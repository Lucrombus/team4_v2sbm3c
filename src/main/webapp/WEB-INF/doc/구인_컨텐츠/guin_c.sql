DROP TABLE guin_c CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 구인 컨텐츠 */
/**********************************/
CREATE TABLE guin_c(
		guin_cno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,  --FK
		memberno                      		NUMBER(10)		 NULL,  --FK
		name                          		VARCHAR2(50)		 NOT NULL,
		brand                         		VARCHAR2(50)		 NOT NULL,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		rdate                          		DATE		 NOT NULL,
		address                       		VARCHAR2(200)		 NOT NULL,
        map                                 VARCHAR2(1000)       NULL,
		wage                          		NUMBER(20)		 NOT NULL,
		day                           		VARCHAR2(50)		 NOT NULL,
		period                        		VARCHAR2(50)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NOT NULL,
		email                         		VARCHAR2(50)		 NOT NULL,
		word                                VARCHAR2(100)         NULL ,
        file1                         		VARCHAR2(1000)		 NULL ,
		file1saved                    		VARCHAR2(1000)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
        thumb1_origin                       VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
        viewcnt                             NUMBER(20)      DEFAULT 0 NOT NULL ,
  FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno) ,
  FOREIGN KEY (memberno) REFERENCES member (memberno) ON DELETE SET NULL
);

COMMENT ON TABLE guin_c is '구인 컨텐츠';
COMMENT ON COLUMN guin_c.guin_cno is '구인 컨텐츠 번호';
COMMENT ON COLUMN guin_c.jobcateno is '업종번호';
COMMENT ON COLUMN guin_c.memberno is '회원번호';
COMMENT ON COLUMN guin_c.name is '업체명';
COMMENT ON COLUMN guin_c.brand is '프렌차이즈';
COMMENT ON COLUMN guin_c.title is '제목';
COMMENT ON COLUMN guin_c.content is '내용';
COMMENT ON COLUMN guin_c.rdate is '등록일';
COMMENT ON COLUMN guin_c.address is '주소';
COMMENT ON COLUMN guin_c.wage is '시급';
COMMENT ON COLUMN guin_c.day is '근무요일';
COMMENT ON COLUMN guin_c.period is '기간';
COMMENT ON COLUMN guin_c.tel is '연락처';
COMMENT ON COLUMN guin_c.email is '이메일';
COMMENT ON COLUMN guin_c.file1 is '메인 이미지';
COMMENT ON COLUMN guin_c.file1saved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN guin_c.thumb1 is '크기가 바뀐 썸네일 이미지';
COMMENT ON COLUMN guin_c.thumb1_origin is '썸네일 오리지널 이미지';
COMMENT ON COLUMN guin_c.size1 is '이미지 용량';
COMMENT ON COLUMN guin_c.viewcnt is '조회수';

DROP SEQUENCE guin_c_seq;

CREATE SEQUENCE guin_c_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO guin_c (guin_cno, jobcateno, memberno, name, brand, title, content, rdate, address, map,
wage, recom, day, period, tel, email, viewcnt)
VALUES (guin_c_seq.nextval, 11, 1, 'CU 무슨무슨점', 'CU', '주말 오전 아르바이트 구함', '업무내용은 ~이고 성실하고 오래하실~ 생략', sysdate, '서울시 OO구 OO동 OO로 123-123', 'nomap',
8900, 1, '토요일, 일요일', '6개월', '010-1234-1234', 'test123@test.com', 0);

/**********************************/
/* SELECT */
/**********************************/ 
SELECT guin_cno, jobcateno, memberno, name, brand, title, content, rdate, address, wage, day, period, tel, email, viewcnt  -- 전부 읽기
FROM guin_c; 

SELECT guin_cno, jobcateno, memberno, name, brand, title, content, rdate, address, wage, day, period, tel, email, viewcnt  -- 특정 레코드만
FROM guin_c 
WHERE guin_cno =1; 


/**********************************/
/* UPDATE */
/**********************************/ 
UPDATE guin_c SET brand = 'GS25';  -- 일괄 수정

UPDATE guin_c SET name = 'GS25 무슨점', brand = 'GS25'   -- 특정 레코드만
WHERE guin_cno = 1;


/**********************************/
/* DELETE */
/**********************************/ 
DELETE guin_c;  -- 일괄삭제

DELETE guin_c  -- 특정 레코드 삭제
WHERE guin_cno = 1;

/**********************************/
/* 검색 레코드 갯수 */
/**********************************/ 
SELECT COUNT(*) AS cnt
FROM guin_c
WHERE jobcateno = 1 AND (UPPER(title) LIKE '%' ||UPPER('123') || '%'
                OR UPPER(content) LIKE '%' || UPPER('123') || '%'
                OR UPPER(word) LIKE '%' || UPPER('123') || '%');


/**********************************/
/* 검색 리스트 */
/**********************************/ 
 SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, viewcnt, r
   FROM (
              SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, viewcnt, rownum as r
              FROM (
                        SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, viewcnt
                        FROM guin_c
                        WHERE jobcateno=1 AND (UPPER(title) LIKE '%' || UPPER('123') || '%' 
                                                                      OR UPPER(content) LIKE '%' || UPPER('123') || '%' 
                                                                      OR UPPER(word) LIKE '%' || UPPER('123') || '%')
                        ORDER BY jobcateno DESC
               )
    );


SELECT *
FROM guin_c
WHERE guin_cno IN (SELECT guin_cno FROM like_guin WHERE memberno =1);


/**********************************/
/* 급여별 추천 테이블 카테고리별 나열 */
/**********************************/ 

 SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, viewcnt,r
   FROM (
              SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, viewcnt,rownum as r
              FROM (
                        SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, viewcnt
                        FROM guin_c
                        WHERE jobcateno=1 
                        ORDER BY wage DESC
               )
    )
    WHERE r >= 1 and r <= 5; 









DROP TABLE contents CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 게시판 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		boardno                       		NUMBER(10)		 NOT NULL ,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(1000)		 NULL ,
		file1saved                    		VARCHAR2(1000)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		word                          		VARCHAR2(100)		 NULL,
		viewcnt                           NUMBER(20)  DEFAULT 0 NOT NULL, 
        FOREIGN KEY (boardno) REFERENCES board(boardno)
);

COMMENT ON TABLE contents is '게시판 컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.boardno is '게시판 번호';
COMMENT ON COLUMN contents.memberno is '회원번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인 이미지 프리뷰';
COMMENT ON COLUMN contents.size1 is '이미지 용량';
COMMENT ON COLUMN contents.word is '검색어';

DROP SEQUENCE contents_seq;

CREATE SEQUENCE contents_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  
/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO contents (contentsno, boardno, memberno, title, content, rdate)
VALUES (contents_seq.nextval, 1, 2, '무작위 잡담', '내용없음', sysdate);

INSERT INTO contents (contentsno, boardno, memberno, title, content, rdate)
VALUES (contents_seq.nextval, 2, 2, '무작위 TIPS', '내용없음', sysdate);

commit;

/**********************************/
/* SELECT */
/**********************************/ 
SELECT contentsno, jobcateno, memberno, name, brand, title, content, rdate, address, wage, day, period, tel, email  -- 전부 읽기
FROM contents; 

SELECT contentsno, jobcateno, memberno, name, brand, title, content, rdate, address, wage, day, period, tel, email  -- 특정 레코드만
FROM contents 
WHERE contentsno =1; 


/**********************************/
/* UPDATE */
/**********************************/ 
UPDATE contents SET brand = 'GS25';  -- 일괄 수정

UPDATE contents SET name = 'GS25 무슨점', brand = 'GS25'   -- 특정 레코드만
WHERE contentsno = 1;


/**********************************/
/* DELETE */
/**********************************/ 
DELETE contents;  -- 일괄삭제

DELETE contents  -- 특정 레코드 삭제
WHERE contentsno = 1;

/**********************************/
/* 검색 레코드 갯수 */
/**********************************/ 
SELECT COUNT(*) AS cnt
FROM contents
WHERE jobcateno = 1 AND (UPPER(title) LIKE '%' ||UPPER('123') || '%'
                OR UPPER(content) LIKE '%' || UPPER('123') || '%'
                OR UPPER(word) LIKE '%' || UPPER('123') || '%');


/**********************************/
/* 검색 리스트 */
/**********************************/ 
 SELECT contentsno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, r
   FROM (
              SELECT contentsno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, rownum as r
              FROM (
                        SELECT contentsno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word
                        FROM contents
                        WHERE jobcateno=1 AND (UPPER(title) LIKE '%' || UPPER('123') || '%' 
                                                                      OR UPPER(content) LIKE '%' || UPPER('123') || '%' 
                                                                      OR UPPER(word) LIKE '%' || UPPER('123') || '%')
                        ORDER BY jobcateno DESC
               )
    )
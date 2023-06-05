DROP TABLE gujik_c CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 구직 컨텐츠 */
/**********************************/
CREATE TABLE gujik_c(
		gujik_cno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,  --FK
		memberno                      		NUMBER(10)		 NOT NULL,  --FK
		title                         		VARCHAR2(50)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		rdate                          		DATE		 NOT NULL,
		gender                        		VARCHAR2(10)		 NOT NULL,
		age                           		NUMBER(10)		 NOT NULL,
		experience                          CHAR(1)          NOT NULL,
		wage_want                     		NUMBER(20)		 NOT NULL,
		day_want                      		VARCHAR2(50)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NOT NULL,
		email                         		VARCHAR2(50)		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL,
  FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno),
  FOREIGN KEY (memberno) REFERENCES memberno (member)      
);

COMMENT ON TABLE gujik_c is '구직 컨텐츠';
COMMENT ON COLUMN gujik_c.gujik_cno is '구직 컨텐츠 번호';
COMMENT ON COLUMN gujik_c.jobcateno is '업종번호';
COMMENT ON COLUMN gujik_c.memberno is '회원번호';
COMMENT ON COLUMN gujik_c.title is '제목';
COMMENT ON COLUMN gujik_c.content is '내용';
COMMENT ON COLUMN gujik_c.date is '등록일';
COMMENT ON COLUMN gujik_c.gender is '성별';
COMMENT ON COLUMN gujik_c.age is '나이';
COMMENT ON COLUMN gujik_c.wage_want is '희망시급';
COMMENT ON COLUMN gujik_c.day_want is '희망요일';
COMMENT ON COLUMN gujik_c.tel is '연락처';
COMMENT ON COLUMN gujik_c.email is '이메일';
COMMENT ON COLUMN gujik_c.file1 is '메인 이미지';
COMMENT ON COLUMN gujik_c.file1saved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN gujik_c.thumb1 is '메인 이미지 프리뷰';
COMMENT ON COLUMN gujik_c.size1 is '이미지 용량';


DROP SEQUENCE gujik_c_seq;

CREATE SEQUENCE gujik_c_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  
/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO gujik_c (gujik_cno, jobcateno, memberno, title, content, rdate, gender, age,
wage_want, day_want, tel, email)
VALUES (gujik_c_seq.nextval, 1, 1, '편의점 알바 하고 싶습니다', '저는 ~이고 ~하며 자기소개 쓰고싶은 내용', sysdate, '남성', 23, 
9000, '월요일, 화요일', '010-1111-2222', 'test123@tset.com');

/**********************************/
/* SELECT */
/**********************************/ 
SELECT gujik_cno, jobcateno, memberno, title, content, rdate, gender, age,
wage_want, day_want, tel, email  -- 전부 읽기
FROM gujik_c; 

SELECT gujik_cno, jobcateno, memberno, title, content, rdate, gender, age,
wage_want, day_want, tel, email  -- 특정 레코드만
FROM gujik_c 
WHERE gujik_cno =2; 


/**********************************/
/* UPDATE */
/**********************************/ 
UPDATE gujik_c SET gender = '여성';  -- 일괄 수정

UPDATE gujik_c SET gender = '남성'   -- 특정 레코드만
WHERE gujik_cno = 2;


/**********************************/
/* DELETE */
/**********************************/ 
DELETE gujik_c;  -- 일괄삭제

DELETE gujik_c  -- 특정 레코드 삭제
WHERE gujik_cno = 1;


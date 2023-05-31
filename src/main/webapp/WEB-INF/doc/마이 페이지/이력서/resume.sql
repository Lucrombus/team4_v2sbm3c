/**********************************/
/* Table Name: 이력서 */
/**********************************/
DROP TABLE resume CASCADE CONSTRAINTS;
DROP SEQUENCE resume_seq;

CREATE TABLE resume(
		resumeno                      		NUMBER(10)		 NOT NULL,
		resumep                       		VARCHAR2(100)		 NULL ,
		intro                         		VARCHAR2(100)		 NULL ,
		memberno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE resume is '이력서';
COMMENT ON COLUMN resume.resumeno is '이력서 번호';
COMMENT ON COLUMN resume.resumep is '이력서 사진';
COMMENT ON COLUMN resume.intro is '자기소개';
COMMENT ON COLUMN resume.memberno is '회원번호';

CREATE SEQUENCE resume_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO resume(resumeno, resumep, intro, memberno)
VALUES(resume_seq.nextval, '이력서사진1.jpg', '자기소개test1', 1);

--select
SELECT resumeno, resumep, intro, memberno
FROM resume;

--update
UPDATE resume SET intro = '자기소개test1수정'
WHERE resumeno = 1;

--delete
DELETE resume
WHERE resumeno = 1;
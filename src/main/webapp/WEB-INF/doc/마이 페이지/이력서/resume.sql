/**********************************/
/* Table Name: 이력서 */
/**********************************/
DROP TABLE resume CASCADE CONSTRAINTS;

CREATE TABLE resume(
		resumeno                      		NUMBER(10)		 NOT NULL   PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		resumetitle                   		VARCHAR2(50)		 NOT NULL,
		file1                         		VARCHAR2(1000)		 NOT NULL,
		file1saved                    		VARCHAR2(1000)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		intro                         		VARCHAR2(4000)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(100)		 NULL ,
		career                        		VARCHAR2(2000)		 NULL ,
		skills                        		VARCHAR2(2000)		 NULL ,
		langskill                     		VARCHAR2(500)		 NULL ,
		project                       		VARCHAR2(4000)		 NULL ,
		award                         		VARCHAR2(500)		 NULL ,
		volunteer                     		VARCHAR2(2000)		 NULL ,
		url                           		VARCHAR2(800)		 NULL ,
		etc                           		VARCHAR2(2000)		 NULL 
);

COMMENT ON TABLE resume is '이력서';
COMMENT ON COLUMN resume.resumeno is '이력서 번호';
COMMENT ON COLUMN resume.memberno is '회원번호';
COMMENT ON COLUMN resume.resumetitle is '이력서 제목';
COMMENT ON COLUMN resume.file1 is '이력서 사진';
COMMENT ON COLUMN resume.file1saved is '실제 저장된 이력서 사진';
COMMENT ON COLUMN resume.thumb1 is '이력서 사진 썸네일';
COMMENT ON COLUMN resume.size1 is '사진 크기';
COMMENT ON COLUMN resume.rdate is '이력서 등록일';
COMMENT ON COLUMN resume.intro is '자기소개';
COMMENT ON COLUMN resume.tel is '연락처';
COMMENT ON COLUMN resume.address is '주소';
COMMENT ON COLUMN resume.career is '경력';
COMMENT ON COLUMN resume.skills is '보유기술';
COMMENT ON COLUMN resume.langskill is '언어능력';
COMMENT ON COLUMN resume.project is '참여프로젝트';
COMMENT ON COLUMN resume.award is '수상이력';
COMMENT ON COLUMN resume.volunteer is '봉사활동';
COMMENT ON COLUMN resume.url is '참고url';
COMMENT ON COLUMN resume.etc is '기타 참고사항';


DROP SEQUENCE resume_seq;

CREATE SEQUENCE resume_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO resume(resumeno, memberno, resumetitle, resumep, intro, rdate)
VALUES(resume_seq.nextval, 1, '이력서제목1', '이력서사진1.jpg', '자기소개test1', sysdate);

--select
SELECT resumeno, memberno, resumetitle, resumep, intro, rdate
FROM resume
WHERE resumeno = 1;

--update
UPDATE resume 
SET resumetitle = '제목1수정', resumep = '사진수정1.jpg', intro = '자기소개1수정'
WHERE resumeno = 1;

--delete
DELETE resume
WHERE resumeno = 1;
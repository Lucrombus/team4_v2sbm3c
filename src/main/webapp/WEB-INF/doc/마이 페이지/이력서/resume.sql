/**********************************/
/* Table Name: 이력서 */
/**********************************/
DROP TABLE resume CASCADE CONSTRAINTS;

CREATE TABLE resume(
		resumeno                      		NUMBER(10)		 NOT NULL  PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                   		    VARCHAR2(100)		 NOT NULL,
		file1                         		VARCHAR2(1000)		 NULL,
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
		wantjob                       		VARCHAR2(100)		 NULL 
);

COMMENT ON TABLE resume is '이력서';
COMMENT ON COLUMN resume.resumeno is '이력서 번호';
COMMENT ON COLUMN resume.memberno is '회원번호';
COMMENT ON COLUMN resume.title is '이력서 제목';
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
COMMENT ON COLUMN resume.wantjob is '희망 업무';


DROP SEQUENCE resume_seq;

CREATE SEQUENCE resume_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO resume(resumeno, memberno, title, file1, file1saved, thumb1, size1, rdate, 
                   intro, tel, address, career, skills, langskill, wantjob)
VALUES(resume_seq.nextval, 1, '이력서제목1', '', '', '', 0, sysdate, 
      '자기소개test1', '010-00', '인천', '웹개발경력 3년', '스프링 부트', '일어 가능', '편의점');

--select
SELECT resumeno, memberno, title, file1, file1saved, thumb1, size1, rdate, 
       intro, tel, address, career, skills, langskill, wantjob
FROM resume
WHERE memberno = 1
ORDER BY resumeno DESC;

--update
UPDATE resume 
SET title = '제목1수정', intro = '자기소개1수정'
WHERE resumeno = 1;

--delete
DELETE resume
WHERE resumeno = 1;

commit;
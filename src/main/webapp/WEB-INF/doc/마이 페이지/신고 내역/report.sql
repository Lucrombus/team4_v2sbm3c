/**********************************/
/* Table Name: 컨텐츠 신고 */
/**********************************/
DROP TABLE report CASCADE CONSTRAINTS;
DROP SEQUENCE report_seq;

CREATE TABLE report(
		reportno                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		reason                        		VARCHAR2(100)		 NULL ,
		targetURL                     		VARCHAR2(100)		 NULL ,
		contentsno                    		NUMBER(10)		 NULL 
);

COMMENT ON TABLE report is '컨텐츠 신고';
COMMENT ON COLUMN report.reportno is '신고번호';
COMMENT ON COLUMN report.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN report.reason is '신고사유';
COMMENT ON COLUMN report.targetURL is '대상 URL';
COMMENT ON COLUMN report.contentsno is '컨텐츠 번호';

CREATE SEQUENCE report_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO report(reportno, memberno, reason, targetURL, contentsno)
VALUES(report_seq.nextval, 1, '신고사유test1', 'https://www.naver.com', 1);

--select
SELECT reportno, memberno, reason, targetURL, contentsno
FROM report;

--update
UPDATE reort SET reason = '신고사유test1수정'
WHERE reportno = 1;

--delete
DELETE report
WHERE reportno = 1;
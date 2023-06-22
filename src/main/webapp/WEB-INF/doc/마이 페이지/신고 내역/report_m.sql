/**********************************/
/* Table Name: 회원 신고 */
/**********************************/
DROP TABLE report_m CASCADE CONSTRAINTS;

CREATE TABLE report_m(
		reportno                      		NUMBER(10)		 NOT NULL   PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		target_mno                    		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		reason                        		VARCHAR2(200)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE report_m is '회원 신고';
COMMENT ON COLUMN report_m.reportno is '신고번호';
COMMENT ON COLUMN report_m.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN report_m.target_mno is '회원번호 (신고대상)';
COMMENT ON COLUMN report_m.title is '제목';
COMMENT ON COLUMN report_m.reason is '신고사유';
COMMENT ON COLUMN report_m.rdate is '신고 등록일';


DROP SEQUENCE report_m_seq;

CREATE SEQUENCE report_m_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO report_m(reportno, memberno, target_mno, title, reason, rdate)
VALUES (report_m_seq.nextval, 1, 2, '신고합니다', '신고사유는 네모다', sysdate);

--select
SELECT *
FROM report_m
WHERE memberno = 1
ORDER BY reportno ASC;

--update(수정 기능 없음)
UPDATE report_m 
SET reason = '신고이유 수정'
WHERE reportno = 1;

--delete
DELETE FROM report_m
WHERE reportno = 1;

commit;

----제약조건 추가
--ALTER TABLE report_m ADD CONSTRAINT IDX_report_m_PK PRIMARY KEY (reportno);
--ALTER TABLE report_m ADD CONSTRAINT IDX_report_m_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);


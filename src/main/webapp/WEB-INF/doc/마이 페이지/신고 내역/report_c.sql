/**********************************/
/* Table Name: 컨텐츠 신고 */
/**********************************/
DROP TABLE report_c CASCADE CONSTRAINTS;

CREATE TABLE report_c(
		reportno                      		NUMBER(10)		 NOT NULL   PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		contentsno                    		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		reason                        		VARCHAR2(200)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		done                          		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

COMMENT ON TABLE report_c is '컨텐츠 신고';
COMMENT ON COLUMN report_c.reportno is '신고번호';
COMMENT ON COLUMN report_c.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN report_c.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN report_m.title is '제목';
COMMENT ON COLUMN report_m.reason is '신고사유';
COMMENT ON COLUMN report_m.rdate is '신고 등록일';
COMMENT ON COLUMN report_m.done is '신고 처리 여부';


DROP SEQUENCE report_c_seq;

CREATE SEQUENCE report_c_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO report_c(reportno, memberno, contentsno, title, reason, rdate, done)
VALUES(report_c_seq.nextval, 1, 1, '신고제목', '신고이유', sysdate, 'N');

--select
SELECT reportno, memberno, contentsno, title, reason, rdate, done
FROM report_c
WHERE memberno = 1
ORDER BY reportno ASC;

--update(수정 기능 없음)
UPDATE report_c 
SET reason = '신고이유 수정'
WHERE reportno = 1;

--delete
DELETE FROM report_c
WHERE reportno = 1;

commit;

----제약조건 추가
--ALTER TABLE report_c ADD CONSTRAINT IDX_content_report_PK PRIMARY KEY (reportno);
--ALTER TABLE report_c ADD CONSTRAINT IDX_content_report_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);
--ALTER TABLE report_c ADD CONSTRAINT IDX_content_report_FK1 FOREIGN KEY (contentsno) REFERENCES contents (contentsno);


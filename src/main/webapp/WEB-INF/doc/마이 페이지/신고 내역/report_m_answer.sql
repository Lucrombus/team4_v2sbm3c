/**********************************/
/* Table Name: 회원 신고 답변 */
/**********************************/
DROP TABLE report_m_answer CASCADE CONSTRAINTS;

CREATE TABLE report_m_answer(
		answerno                      		NUMBER(10)		 NOT NULL,
		content                       		VARCHAR2(300)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		target_mno                    		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		reportno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE report_m_answer is '회원 신고 답변';
COMMENT ON COLUMN report_m_answer.answerno is '답변 번호';
COMMENT ON COLUMN report_m_answer.content is '답변';
COMMENT ON COLUMN report_m_answer.rdate is '등록 날짜';
COMMENT ON COLUMN report_m_answer.target_mno is '회원 신고번호(신고대상자)';
COMMENT ON COLUMN report_m_answer.memberno is '회원번호(신고자)';
COMMENT ON COLUMN report_m_answer.reportno is '신고번호';




DROP SEQUENCE report_m_answer_seq;

CREATE SEQUENCE report_m_answer_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO report_m_answer(answerno, content, rdate, target_mno, memberno, reportno)
VALUES (report_m_answer_seq.nextval, '해결해써욤', sysdate, 1, 5, 7);

--select
SELECT *
FROM report_m_answer
WHERE memberno = 1
ORDER BY reportno ASC;

--update(수정 기능 없음)
UPDATE report_m_answer 
SET reason = '신고이유 수정'
WHERE reportno = 1;

--delete
DELETE FROM report_m_answer
WHERE reportno = 1;

commit;

----제약조건 추가
--ALTER TABLE report_m_answer ADD CONSTRAINT IDX_report_m_answer_PK PRIMARY KEY (answerno);
--ALTER TABLE report_m_answer ADD CONSTRAINT IDX_report_m_answer_FK0 FOREIGN KEY (reportno) REFERENCES report_m (reportno);
--ALTER TABLE report_m_answer ADD CONSTRAINT IDX_report_m_answer_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);



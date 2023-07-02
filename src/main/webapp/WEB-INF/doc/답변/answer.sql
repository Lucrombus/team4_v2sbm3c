/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE answer(
		ANSWERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENT                       		VARCHAR2(300)    DEFAULT '미등록' NOT NULL,
		RDATE                         		DATE		     NOT NULL,
		inquiryno                     		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (inquiryno) REFERENCES inquiry (inquiryno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE answer is '답변';
COMMENT ON COLUMN answer.ANSWERNO is '답변 번호';
COMMENT ON COLUMN answer.CONTENT is '답변';
COMMENT ON COLUMN answer.RDATE is '등록 날짜';
COMMENT ON COLUMN answer.inquiryno is '문의 번호';
COMMENT ON COLUMN answer.memberno is '회원번호';

DROP SEQUENCE answer_seq;

CREATE SEQUENCE answer_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- CREATE
INSERT INTO answer(answerno, content, rdate, inquiryno, memberno) 
VALUES (answer_seq.nextval, '답변', sysdate , 12, 1) 

-- SELECT
SELECT * FROM answer;

SELECT answerno, content, rdate, inquiryno, memberno
FROM answer
WHERE inquiryno = 1
ORDER BY answerno DESC

SELECT COUNT(inquiryno) as cnt
FROM answer
WHERE inquiryno = 11

-- UPDATE
UPDATE answer
SET content = '이상해용'
WHERE answerno = 1

-- DELETE
DELETE FROM answer
WHERE answerno = 1

SELECT *
FROM 
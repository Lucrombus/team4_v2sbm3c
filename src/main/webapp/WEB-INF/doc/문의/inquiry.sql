DROP TABLE inquiry;

/**********************************/
/* Table Name: 문의 */
/**********************************/
CREATE TABLE inquiry(
		inquiryno                   NUMBER(10)      NOT NULL PRIMARY KEY,
        memberno                    NUMBER(10)      NOT NULL,
        inquiryTitle                VARCHAR2(150)    NOT NULL,
		inquiryReason               VARCHAR2(1000)   NOT NULL,
        rdate                       DATE            NOT NULL,
        FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE inquiry is '고객센터(문의)';
COMMENT ON COLUMN inquiry.inquiryno is '문의번호';
COMMENT ON COLUMN inquiry.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN inquiry.inquiryTitle is '문의제목';
COMMENT ON COLUMN inquiry.inquiryReason is '문의사유';
COMMENT ON COLUMN inquiry.rdate is '등록일';

DROP SEQUENCE inquiry_seq;

CREATE SEQUENCE inquiry_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
SELECT * FROM inquiry;

INSERT INTO inquiry(inquiryno, memberno, inquiryTitle, inquiryReason, rdate) 
VALUES (inquiry_seq.nextval, 2, '부적절한 글' , '이유', sysdate); 

SELECT inquiryno, memberno, inquiryTitle, inquiryReason
FROM inquiry
WHERE memberno = 7
ORDER BY inquiryno ASC

SELECT inquiryno, memberno, inquiryTitle, inquiryReason
FROM inquiry
ORDER BY inquiryno ASC

UPDATE inquiry
SET inquiryTitle = '버그 신고' , inquiryReason = '문의 글 조회에서 위에 버튼이 안눌려요' , rdate = sysdate
WHERE inquiryno = 3

DELETE FROM inquiry
WHERE inquiryno = 3

UPDATE inquiry
SET answer_yn = 'Y'
WHERE inquiryno = 3

ALTER TABLE inquiry MODIFY (inquiryTitle VARCHAR2(150));
ALTER TABLE inquiry MODIFY (inquiryReason VARCHAR2(1000));
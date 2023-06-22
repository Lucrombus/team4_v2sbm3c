DROP TABLE inquiry;

/**********************************/
/* Table Name: 문의 */
/**********************************/
CREATE TABLE inquiry(
		inquiryno                     		NUMBER(10)		 NOT NULL PRIMARY KEY,
        memberno                            NUMBER(10)       NOT NULL ,
        inquiryTitle                        VARCHAR2(50)     NOT NULL ,
		inquiryReason                 		VARCHAR2(100)	 NOT NULL ,
        answer                              VARCHAR2(100)    NOT NULL DEFAULT 'N',
        FOREIGN KEY (memberno) REFERENCES member (memberno)
)

COMMENT ON TABLE inquiry is '문의';
COMMENT ON COLUMN inquiry.inquiryno is '문의번호';
COMMENT ON COLUMN inquiry.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN inquiry.inquiryTitle is '문의제목';
COMMENT ON COLUMN inquiry.inquiryReason is '문의사유';
COMMENT ON COLUMN inquiry.contentsno is '컨텐츠 번호';

DROP SEQUENCE inquiry_seq;

CREATE SEQUENCE inquiry_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
SELECT * FROM inquiry;

INSERT INTO inquiry VALUES (inquiry_seq.nextval, 2, '부적절한 글' , '이유', 3); 
/**********************************/
/* Table Name: 문의 */
/**********************************/
CREATE TABLE inquiry(
		inquiryno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		INTEGER(10)		 NOT NULL,
		inquiryReason                 		VARCHAR2(100)	 NOT NULL ,
		contentsno                    		NUMBER(10)		 NOT NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE inquiry is '문의';
COMMENT ON COLUMN inquiry.inquiryno is '문의번호';
COMMENT ON COLUMN inquiry.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN inquiry.inquiryReason is '문의사유';
COMMENT ON COLUMN inquiry.contentsno is '컨텐츠 번호';
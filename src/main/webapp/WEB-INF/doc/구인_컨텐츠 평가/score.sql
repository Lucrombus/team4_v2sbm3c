

/**********************************/
/* Table Name: 평점 */
/**********************************/
CREATE TABLE score(
		scoreno NUMBER(10) NOT NULL PRIMARY KEY,
		guin_cno NUMBER(10),
		memberno NUMBER(10),
		jumsu NUMBER(10),
		rdate DATE,
    FOREIGN KEY (memberno) REFERENCES member (memberno),
    FOREIGN KEY (guin_cno) REFERENCES guin_c (guin_cno)
);


COMMENT ON TABLE score is '평점';
COMMENT ON COLUMN score.scoreno is '평점번호';
COMMENT ON COLUMN score.guin_cno is '구인 컨텐츠 번호';
COMMENT ON COLUMN score.memberno is '회원번호';
COMMENT ON COLUMN score.jumsu is '평점';
COMMENT ON COLUMN score.rdate is '평점날짜';


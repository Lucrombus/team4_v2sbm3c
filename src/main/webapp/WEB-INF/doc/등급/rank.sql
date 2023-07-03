DROP TABLE rank;
/**********************************/
/* Table Name: 등급 */
/**********************************/
CREATE TABLE rank(
		rankno                        		NUMBER(10)		 PRIMARY KEY,
        rankname                            VARCHAR2(20)     NOT NULL
);

COMMENT ON TABLE rank is '등급';
COMMENT ON COLUMN rank.rankno is '등급 번호';
COMMENT ON COLUMN rank.rankname is '등급 이름';

INSERT INTO rank VALUES (1, '관리자');
INSERT INTO rank VALUES (2, '개인 회원');
INSERT INTO rank VALUES (3, '기업 회원');
INSERT INTO rank VALUES (4, '정지 회원');
INSERT INTO rank VALUES (5, '탈퇴 회원');

SELECT *
FROM rank;

commit;

UPDATE rank
SET rankname = '개인 회원'
WHERE rankno = 2

UPDATE rank
SET rankname = '기업 회원'
WHERE rankno = 3

/**********************************/
/* Table Name: 등급 */
/**********************************/
CREATE TABLE rank(
		rankno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        rankname                            VARCHAR2(10)     NOT NULL
);

COMMENT ON TABLE rank is '등급';
COMMENT ON COLUMN rank.rankno is '등급 번호';
COMMENT ON COLUMN rank.rankname is '등급 이름';

CREATE SEQUENCE rank_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO rank VALUES (1, '관리자');
INSERT INTO rank VALUES (2, '회원');


SELECT *
FROM rank;

commit;
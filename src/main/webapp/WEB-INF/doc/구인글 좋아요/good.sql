DROP TABLE good CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: 좋아요 */
/**********************************/
CREATE TABLE good(
		goodno NUMBER(10) NOT NULL PRIMARY KEY,
		guin_cno NUMBER(10),
		memberno NUMBER(10),
		rdate DATE,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (guin_cno) REFERENCES guin_c (guin_cno)
);

COMMENT ON TABLE good is '좋아요';
COMMENT ON COLUMN good.goodno is '좋아요번호';
COMMENT ON COLUMN good.guin_cno is '구인 컨텐츠 번호';
COMMENT ON COLUMN good.memberno is '회원번호';
COMMENT ON COLUMN good.rdate is '좋아요날짜';

DROP SEQUENCE good_seq;

CREATE SEQUENCE good_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  
INSERT INTO good(goodno, memberno, guin_cno, rdate)
VALUES(good_seq.nextval, 1, 8, sysdate);

INSERT INTO good(goodno, memberno, guin_cno, rdate)
VALUES(good_seq.nextval, 2, 8, sysdate);

INSERT INTO good(goodno, memberno, guin_cno, rdate)
VALUES(good_seq.nextval, 3, 9, sysdate);

commit;

SELECT * FROM good;

-- 목록
SELECT goodno, memberno, guin_cno, rdate
FROM good
WHERE guin_cno = 8;

-- 조회
SELECT goodno, memberno, guin_cno, rdate
FROM good
WHERE goodno = 1;

-- 중복 좋아요 확인  
SELECT COUNT(*) as cnt
FROM good
WHERE memberno = 1 AND guin_cno=8;

SELECT guin_cno, COUNT(*) AS cnt
FROM good
GROUP BY guin_cno;
/**********************************/
/* Table Name: 관심 구인 */
/**********************************/
DROP TABLE like_guin CASCADE CONSTRAINTS;
DROP SEQUENCE like_guin_seq;

CREATE TABLE like_guin(
		like_guinno                   		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		guin_cno                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE like_guin is '관심 구인';
COMMENT ON COLUMN like_guin.like_guinno is '관심구인번호';
COMMENT ON COLUMN like_guin.memberno is '회원번호';
COMMENT ON COLUMN like_guin.guin_cno is '구인컨텐츠번호';

CREATE SEQUENCE like_guin_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
--insert
INSERT INTO like_guin(like_guinno, memberno, guin_cno)
VALUES(like_guin_seq.nextval, 1, 1, 1);

--select
SELECT like_guinno, memberno, guin_cno
FROM like_guin;

--update
--업데이트 기능 없음

--delete
DELETE like_guin
WHERE like_guinno = 1;



/**********************************/
/* Table Name: 관심 구직 */
/**********************************/
CREATE TABLE like_gujik(
		like_gujikno                  		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		gujik_cno                     		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE like_gujik is '관심 구직';
COMMENT ON COLUMN like_gujik.like_gujikno is '관심구직번호';
COMMENT ON COLUMN like_gujik.memberno is '회원번호';
COMMENT ON COLUMN like_gujik.gujik_cno is '구직컨텐츠번호';

CREATE SEQUENCE like_gujik_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO like_gujik(like_gujikno, memberno, gujik_cno)
VALUES(like_gujik_seq.nextval, 1, 1, 1);

--select
SELECT like_gujikno, memberno, gujik_cno
FROM like_gujik;

--update
--업데이트 기능 없음

--delete
DELETE like_gujik
WHERE like_gujikno = 1;
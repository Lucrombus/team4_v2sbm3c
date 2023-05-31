DROP TABLE contactad;

/**********************************/
/* Table Name: 접속 주소 */
/**********************************/
CREATE TABLE contactad(
		contactadno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        contactadr                          VARCHAR(50)      NOT NULL,
		rankurlno                           NUMBER(10)		 NULL 
);

COMMENT ON TABLE contactad is '접속 주소';
COMMENT ON COLUMN contactad.contactadno is '접속 주소 번호';
COMMENT ON COLUMN contactad.contactadr is '접속 주소';
COMMENT ON COLUMN contactad.rankurlno is '등급별 접근 URL 번호';

DROP SEQUENCE contactad_seq;

CREATE SEQUENCE contactad_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  -- 등록: 1건 이상, adminno, noticecateno 컬럼에 등록되어 있는 값만 사용 가능
INSERT INTO contactad VALUES (contactad_seq.nextval, 'https://www.naver.com', 1);
INSERT INTO contactad VALUES (contactad_seq.nextval, 'https://www.google.com', 1);
INSERT INTO contactad VALUES (contactad_seq.nextval, 'https://www.gmail.com', 1);
INSERT INTO contactad VALUES (contactad_seq.nextval, 'https://www.daum.net', 1);
INSERT INTO contactad VALUES (contactad_seq.nextval, 'https://www.youtube.com', 2);

commit;

-- 전체 목록
SELECT *
FROM contactad
ORDER BY contactadno ASC;

-- 조회
SELECT *
FROM contactad
WHERE contactadno = 1;

-- 주소 수정
UPDATE contactad
SET contactadr = 'https://www.google.com'
WHERE contactadno = 2;

-- 삭제
DELETE FROM contactad
WHERE contactadno=3;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM contactad;
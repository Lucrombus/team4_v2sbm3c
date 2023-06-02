/**********************************/
/* Table Name: 등급별 접근 URL */
/**********************************/
CREATE TABLE rankurl(
		rankurlno                       	NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rankno                        		NUMBER(10)		 NULL ,
		contactadno                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (rankno) REFERENCES rank (rankno),
  FOREIGN KEY (contactadno) REFERENCES contactad (contactadno)
);

COMMENT ON TABLE ranku is '등급별 접근 URL';
COMMENT ON COLUMN ranku.rankurlno is '등급별 접근 URL 번호';
COMMENT ON COLUMN ranku.rankno is '등급 번호';
COMMENT ON COLUMN ranku.contactadno is '접속 주소 번호';

DROP SEQUENCE rankurl_seq;

CREATE SEQUENCE rankurl_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- 등록: 1건 이상, adminno, noticecateno 컬럼에 등록되어 있는 값만 사용 가능
INSERT INTO rankurl(rankurlno, rankno, contactadno) VALUES (rankurl_seq.nextval, 1, 1);
INSERT INTO rankurl(rankurlno, rankno, contactadno) VALUES (rankurl_seq.nextval, 1, 2);
INSERT INTO rankurl(rankurlno, rankno, contactadno) VALUES (rankurl_seq.nextval, 1, 3);
INSERT INTO rankurl(rankurlno, rankno, contactadno) VALUES (rankurl_seq.nextval, 1, 4);
INSERT INTO rankurl(rankurlno, rankno, contactadno) VALUES (rankurl_seq.nextval, 2, 5);

commit;

-- 전체 목록
SELECT *
FROM rankurl
ORDER BY rankurlno ASC;

-- 조회
SELECT *
FROM rankurl
WHERE rankurlno=1;

-- 수정
UPDATE rankurl
SET rankno = 1
WHERE rankurlno = 5;

-- 삭제
DELETE FROM rankurl
WHERE rankurlno=3;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM rankurl;
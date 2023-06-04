DROP TABLE recommendation CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: 추천시스템 */
/**********************************/
CREATE TABLE recommendation(
		recomno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,  --FK
		memberno                      		NUMBER(10)		 NOT NULL,  --FK
		score                         		FLOAT(10)		 NULL,
        FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno),
        FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE recommendation is '추천시스템';
COMMENT ON COLUMN recommendation.recomno is '추천번호';
COMMENT ON COLUMN recommendation.jobcateno is '업종번호';
COMMENT ON COLUMN recommendation.memberno is '회원번호';
COMMENT ON COLUMN recommendation.score is '추천우선순위';

DROP SEQUENCE recommendation_seq;

CREATE SEQUENCE recommendation_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

INSERT INTO recommendation(recomno, jobcateno, memberno, score)
VALUES (recommendation_seq.nextval, 1, 1, 4.8);

-- 조회
SELECT recomno, jobcateno, memberno, score
FROM recommendation
WHERE recomno=1;

-- 수정
UPDATE recommendation
SET score = 3.5
WHERE recomno=1;

-- 삭제
DELETE FROM recommendation
WHERE recomno=1;


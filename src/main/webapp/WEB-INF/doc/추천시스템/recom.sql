DROP TABLE recommendation CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: 추천시스템 */
/**********************************/
CREATE TABLE recommendation(
		recomno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,  --FK
		memberno                      		NUMBER(10)		 NOT NULL,  --FK
		recom                         		NUMBER(10)		 NULL,
        rcdate                              DATE  NULL,
        FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno),
        FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE recommendation is '추천시스템';
COMMENT ON COLUMN recommendation.recomno is '추천번호';
COMMENT ON COLUMN recommendation.jobcateno is '업종번호';
COMMENT ON COLUMN recommendation.memberno is '회원번호';
COMMENT ON COLUMN recommendation.recom is '추천우선순위';
COMMENT ON COLUMN recommendation.rcdate is '추천날짜';

DROP SEQUENCE recommendation_seq;

CREATE SEQUENCE recommendation_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

INSERT INTO recommendation(recomno, jobcateno, memberno, recom, rcdate)
VALUES (recommendation_seq.nextval, 1, 1, 1, sysdate);

SELECT recomno, jobcateno, memberno, recom
FROM recommendation;

-- 조회
SELECT recomno, jobcateno, memberno, recom
FROM recommendation
WHERE recomno=1;

-- 수정
UPDATE recommendation
SET score = 3.5
WHERE recomno=1;

-- 삭제
DELETE FROM recommendation
WHERE recomno=1;

SELECT jobcateno 
FROM recommendation 
WHERE memberno = 1;

SELECT guin_cno, jobcateno, memberno, name, brand, title, content, rdate, address, wage, day, period, tel, email
FROM guin_c
WHERE (SELECT DISTINCT jobcateno FROM recommendation WHERE memberno = 1) = jobcateno
ORDER BY wage desc;

SELECT guin_cno, jobcateno, memberno, name, brand, title, content, rdate, address, wage, day, period, tel, email
FROM guin_c
WHERE (SELECT jobcateno FROM recommendation WHERE memberno = 1) = jobcateno
ORDER BY wage desc;


-- 회원의 추천 시스템에 선정된 업종을 급여 순으로 정렬
 SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, r
   FROM (
              SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word, rownum as r
              FROM (
                        SELECT guin_cno, memberno, jobcateno, name, brand, title, content, rdate, address, map, wage, day, period, tel, email, file1, file1saved, thumb1, size1, word
                        FROM guin_c
                        WHERE (SELECT DISTINCT jobcateno FROM recommendation WHERE memberno = 1) = jobcateno
                        ORDER BY wage DESC
               )
    )
    WHERE r <=  5;


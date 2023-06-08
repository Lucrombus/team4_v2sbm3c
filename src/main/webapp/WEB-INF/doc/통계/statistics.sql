SELECT memberno, id, password, name, tel, rdate, rankno, experience, gender, birth, education
FROM member
ORDER BY memberno ASC;
/**********************************/
/* Table Name: 통계 컨텐츠(SELECT) */
/**********************************/
--(구직 성공시 경력 여부 동기화 작업 필요)

-- 경력 비율 
SELECT experience AS 경력비율, CONCAT(ROUND((COUNT(EXPERIENCE) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2),'%') AS 비율
FROM MEMBER GROUP BY EXPERIENCE;

경력비율       비율                                       
---------- -----------------------------------------
Y          50%                                      
N          50%       

-- 성별 비율
SELECT gender AS 성별, CONCAT(ROUND((COUNT(gender) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2),'%') AS 비율
FROM MEMBER GROUP BY gender;

성별         비율                                       
---------- -----------------------------------------
남성       66.67%                                   
여성       33.33%      

-- 나이대 구하기
SELECT TRUNC((sysdate - birth)/365, -1) AS 나이 -- 날짜와 날짜를 빼면 남은 일수 리턴, 365로 나눠 연령표시, TRUNC 통해 정수 첫째자리 삭제
FROM member;

        나이
----------
        20
        20
        10
        30
        20
        50
        
-- 나이대 갯수
SELECT TRUNC((sysdate - birth)/365, -1) as 나이대, count(TRUNC((sysdate - birth)/365, -1)) as 나이대_갯수-- 날짜와 날짜를 빼면 남은 일수 리턴, 365로 나눠 연령표시, TRUNC 통해 정수 첫째자리 삭제       
FROM member group by TRUNC((sysdate - birth)/365, -1) ORDER BY 나이대;

       나이대     나이대_갯수
---------- ----------
        10          1
        20          3
        30          1
        50          1

-- 나이대 비율 
SELECT TRUNC((sysdate - birth)/365, -1) as 나이대, CONCAT(ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2),'%') AS 비율
FROM MEMBER GROUP BY TRUNC((sysdate - birth)/365, -1)ORDER BY 나이대;

       나이대 비율                                       
---------- -----------------------------------------
        10 16.67%                                   
        20 50%                                      
        30 16.67%                                   
        50 16.67%   

-- 학력

--DROP TABLE statistics CASCADE CONSTRAINTS;
--
--CREATE TABLE statistics(
--		statisticsno NUMERIC(10) DEFAULT 10 NOT NULL,
--		statisticsname VARCHAR(10) DEFAULT '미정' NOT NULL,
--		memberno NUMERIC(10),
--		experience CHAR(1) DEFAULT 'N' NOT NULL,
--		gender CHAR(10),
--		age NUMERIC(10),
--		education VARCHAR(20)
--        --FOREIGN KEY (memberno, experience, gender, age, education) REFERENCES member (memberno, experience, gender, age, education)
--);
--
--
--COMMENT ON COLUMN statistics.statisticsno is '통계번호';
--COMMENT ON COLUMN statistics.statisticsname is '통계이름';
--COMMENT ON COLUMN statistics.memberno is '회원번호';
--COMMENT ON COLUMN statistics.experience is '경력여부';
--COMMENT ON COLUMN statistics.gender is '성별';
--COMMENT ON COLUMN statistics.age is '나이';
--COMMENT ON COLUMN statistics.education is '학력';
--
--DROP SEQUENCE statistics_seq;
--
--CREATE SEQUENCE statistics_seq
--  START WITH 1                -- 시작 번호
--  INCREMENT BY 1            -- 증가값
--  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
--  CACHE 2                        -- 2번은 메모리에서만 계산
--  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
--  
--SELECT statisticsno, statisticsname, memberno, experience, gender, age, education
--FROM statistics
--ORDER BY statisticsno ASC; 
--
--INSERT INTO statistics(statisticsno, statisticsname)
--VALUES(statistics_seq.nextval, '비율');
--
--INSERT INTO statistics(statisticsno, statisticsname)
--VALUES(statistics_seq.nextval, '비율');

--동기화 작업
--MERGE
--    INTO statistics DB
--    USING member D
--    on (DB.memberno = D.memberno)
--    WHEN MATCHED THEN
--        UPDATE 
--            SET DB.experience = D.experience,
--                DB.gender = D.gender,
--                DB.age = D.age,
--                DB.education = D.education
--    WHEN NOT MATCHED THEN
--        INSERT (DB.memberno, DB.experience, DB.gender, DB.age, DB.education)
--        VALUES (D.memberno, D.experience, D.gender, D.age, D.education);
        
--ALTER TABLE statistics ADD CONSTRAINT IDX_statistics_PK PRIMARY KEY (statisticsno);
--ALTER TABLE statistics ADD CONSTRAINT IDX_statistics_FK0 FOREIGN KEY (memberno,experience,gender,age,education) REFERENCES member (memberno,experience,gender,age,education);

--INSERT INTO statistics(statisticsno, statisticsname, memberno, experience, gender, age, education);
  
--INSERT INTO statistics(statisticsno, statisticsname, memberno)
--VALUES(statistics_seq.nextval, '비율',1);

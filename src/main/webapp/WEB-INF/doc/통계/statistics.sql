SELECT memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education
FROM member
ORDER BY memberno ASC;
/**********************************/
/* Table Name: ?���? 컨텐�?(SELECT) */
/**********************************/
--(구직 ?��공시 경력 ?���? ?��기화 ?��?�� ?��?��)

        SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
        FROM MEMBER 
        GROUP BY TRUNC((sysdate - birth)/365, -1)
        HAVING TRUNC((sysdate - birth)/365, -1) = 10;


-- 경력 유 비율
SELECT experience , ROUND((COUNT(EXPERIENCE) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY EXPERIENCE
HAVING experience = 'Y';

EXPERIENCE    PERCENT
---------- ----------
Y               44.44

-- 경력 무 비율
SELECT experience, ROUND((COUNT(EXPERIENCE) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY EXPERIENCE
HAVING experience = 'N';

EXPERIENCE    PERCENT
---------- ----------
N               55.56

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 성별 남 비율
SELECT gender, ROUND((COUNT(gender) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY gender
HAVING gender = '남성'

GENDER        PERCENT
---------- ----------
남성            33.33


-- 성별 여 비율
SELECT gender, CONCAT(ROUND((COUNT(gender) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2),'%') AS percent
FROM MEMBER 
GROUP BY gender
HAVING gender = '여성'

GENDER     PERCENT                                  
---------- -----------------------------------------
여성       66.67%        

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 나이대 구하기
SELECT TRUNC((sysdate - birth)/365, -1) AS age 
FROM member;

       AGE
----------
        20
        20
        10
        30
        20
        50
        30
        20
        40
        20
        20
        
-- 나이대별 분류
SELECT TRUNC((sysdate - birth)/365, -1) as age, count(TRUNC((sysdate - birth)/365, -1)) as percent     
FROM member group by TRUNC((sysdate - birth)/365, -1) ORDER BY age;

       AGE    PERCENT
---------- ----------
        10          1
        20          6
        30          2
        40          1
        50          1

-- 나이대별 비율 
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
ORDER BY age;

       AGE PERCENT                                  
---------- -----------------------------------------
        10 9.09%                                    
        20 54.55%                                   
        30 18.18%                                   
        40 9.09%                                    
        50 9.09%     

-- 10대 비율
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
HAVING TRUNC((sysdate - birth)/365, -1) = 10;

       AGE    PERCENT
---------- ----------
        10       9.09

-- 20대 비율
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
HAVING TRUNC((sysdate - birth)/365, -1) = 20;

       AGE    PERCENT
---------- ----------
        20      54.55


-- 30대 비율
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
HAVING TRUNC((sysdate - birth)/365, -1) = 30;

       AGE    PERCENT
---------- ----------
        30      18.18

-- 40대 비율
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
HAVING TRUNC((sysdate - birth)/365, -1) = 40;

       AGE    PERCENT
---------- ----------
        40       9.09

-- 50대 비율
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
HAVING TRUNC((sysdate - birth)/365, -1) = 50;

       AGE    PERCENT
---------- ----------
        50       9.09

-- 기타 비율
SELECT TRUNC((sysdate - birth)/365, -1) as age, ROUND((COUNT(TRUNC((sysdate - birth)/365, -1)) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY TRUNC((sysdate - birth)/365, -1)
HAVING TRUNC((sysdate - birth)/365, -1) >= 60;

선택된 행 없음
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--학력 비율
SELECT education , ROUND((COUNT(education) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY education
ORDER BY 1;

EDUCATION     PERCENT
---------- ----------
2년제            9.09
3년제           18.18
4년제           45.45
고졸            27.27

-- 고졸 비율
SELECT education , ROUND((COUNT(education) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY education
HAVING education = '고졸';

EDUCATION     PERCENT
---------- ----------
고졸            27.27

-- 2년제 비율
SELECT education , ROUND((COUNT(education) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY education
HAVING education = '2년제';

EDUCATION     PERCENT
---------- ----------
2년제            9.09

-- 3년제 비율
SELECT education , ROUND((COUNT(education) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY education
HAVING education = '3년제';

EDUCATION     PERCENT
---------- ----------
3년제           18.18

-- 4년제 비율
SELECT education , ROUND((COUNT(education) / (SELECT COUNT(*)FROM MEMBER)) * 100, 2) AS percent
FROM MEMBER 
GROUP BY education
HAVING education = '4년제';

-- ?��?��

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
--COMMENT ON COLUMN statistics.statisticsno is '?��계번?��';
--COMMENT ON COLUMN statistics.statisticsname is '?��계이�?';
--COMMENT ON COLUMN statistics.memberno is '?��?��번호';
--COMMENT ON COLUMN statistics.experience is '경력?���?';
--COMMENT ON COLUMN statistics.gender is '?���?';
--COMMENT ON COLUMN statistics.age is '?��?��';
--COMMENT ON COLUMN statistics.education is '?��?��';
--
--DROP SEQUENCE statistics_seq;
--
--CREATE SEQUENCE statistics_seq
--  START WITH 1                -- ?��?�� 번호
--  INCREMENT BY 1            -- 증�?�?
--  MAXVALUE 9999999999  -- 최�?�?: 9999999999 --> NUMBER(10) ???��
--  CACHE 2                        -- 2번�? 메모리에?���? 계산
--  NOCYCLE;                      -- ?��?�� 1�??�� ?��?��?��?�� 것을 방�?
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

--?��기화 ?��?��
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

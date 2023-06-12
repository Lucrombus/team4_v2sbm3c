DROP TABLE member CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                            NUMBER(10) NOT NULL,
		id                                  VARCHAR2(30) NOT NULL,
		passwd                              VARCHAR2(20) NOT NULL,
		name                               VARCHAR2(20),
        tel                                 VARCHAR(14)  NOT NULL,
		rdate                               DATE NOT NULL,
		rankno                              NUMBER(10),
		experience                          VARCHAR2(10) DEFAULT 'N',
		gender                              VARCHAR(10) DEFAULT 'N',
		birth                               DATE NOT NULL,
		education                           VARCHAR(10) DEFAULT '0',
        FOREIGN KEY (rankno) REFERENCES rank (rankno)
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.passwd is '패스워드';
COMMENT ON COLUMN member.name is '성명';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.rdate is '가입일';
COMMENT ON COLUMN member.rankno is '등급 번호';
COMMENT ON COLUMN member.experience is '경력 여부';
COMMENT ON COLUMN member.gender is '성별';
COMMENT ON COLUMN member.birth is '생년월일';
COMMENT ON COLUMN member.education is '학력';

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO member(memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education) 
VALUES(member_seq.nextval, 'kd1', 1234, '가길동', '010-0000-0000', sysdate, 2, 'Y', '남성', '19990905', '고졸');
INSERT INTO member(memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education) 
VALUES(member_seq.nextval, 'kd2', 1234, '나길동', '010-1234-0000', sysdate, 2, 'Y', '남성', '20000101', '2년제');
INSERT INTO member(memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education) 
VALUES(member_seq.nextval, 'kd3', 1234, '다길동', '010-5678-0000', sysdate, 2, 'Y', '남성', '20100101', '3년제');
INSERT INTO member(memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education) 
VALUES(member_seq.nextval, 'kd4', 1234, '라길순', '010-1111-1111', sysdate, 2, 'N', '여성', '19901010', '고졸');
INSERT INTO member(memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education) 
VALUES(member_seq.nextval, 'kd5', 1234, '마길동', '010-2222-2222', sysdate, 2, 'Y', '남성', '19950905', '고졸');
INSERT INTO member(memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education) 
VALUES(member_seq.nextval, 'kd6', 1234, '바길순', '010-4444-4444', sysdate, 2, 'N', '여성', '19700301', '4년제');


-- 전체 목록
SELECT memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education
FROM member
ORDER BY memberno ASC;

  MEMBERNO ID                             passwd             NAME                 TEL            RDATE                    RANKNO EXPERIENCE GENDER     BIRTH                EDUCATION 
---------- ------------------------------ -------------------- -------------------- -------------- -------------------- ---------- ---------- ---------- -------------------- ----------
         1 kd1                            1234                 가길동               010-0000-0000  2023-06--09 09:55:30          1 Y          남성       1999-09--05 12:00:00 고졸      
         2 kd2                            1234                 나길동               010-1234-0000  2023-06--09 09:55:30          2 Y          남성       2000-01--01 12:00:00 2년제     
         3 kd3                            1234                 다길동               010-5678-0000  2023-06--09 09:55:30          2 Y          남성       2010-01--01 12:00:00 3년제     
         4 kd4                            1234                 라길순               010-1111-1111  2023-06--09 09:55:30          2 N          여성       1990-10--10 12:00:00 고졸      
         5 kd5                            1234                 마길동               010-2222-2222  2023-06--09 09:55:30          2 Y          남성       1995-09--05 12:00:00 고졸      
         6 kd6                            1234                 바길순               010-4444-4444  2023-06--09 09:55:30          2 N          여성       1970-03--01 12:00:00 4년제     

-- 조회
SELECT memberno, id, passwd, name, tel, rdate, rankno, experience, gender, birth, education
FROM member
WHERE memberno=1;

  MEMBERNO ID                             passwd             NAME                 TEL            RDATE                    RANKNO EXPERIENCE GENDER     BIRTH                EDUCATION 
---------- ------------------------------ -------------------- -------------------- -------------- -------------------- ---------- ---------- ---------- -------------------- ----------
         1 kd1                            1234                 가길동               010-0000-0000  2023-06--09 09:55:30          1 Y          남성       1999-09--05 12:00:00 고졸      

-- 수정
UPDATE member
SET id = 'kd1'
WHERE memberno=1;

  MEMBERNO ID                             passwd             NAME                 TEL            RDATE                    RANKNO EXPERIENCE GENDER     BIRTH                EDUCATION 
---------- ------------------------------ -------------------- -------------------- -------------- -------------------- ---------- ---------- ---------- -------------------- ----------
         1 kd4                            1234                 가길동               010-0000-0000  2023-06--09 09:55:30          1 Y          남성       1999-09--05 12:00:00 고졸      

-- 삭제
DELETE FROM member
WHERE memberno=2;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM member;

commit;

SELECT COUNT(memberno) as cnt
FROM member
WHERE id='kd1' AND passwd = 1234




commit;
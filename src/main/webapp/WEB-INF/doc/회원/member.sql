DROP TABLE member;
/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		id                            		VARCHAR2(30)     NOT NULL             UNIQUE,
		password                      		VARCHAR2(20)	 NOT NULL,
		name                          		VARCHAR2(20)	 NOT NULL,
        tel                                 VARCHAR(14)      NOT NULL,
		rdate                          		DATE		     NOT NULL,
		rankno                        		NUMBER(10)		 NOT NULL,
        FOREIGN KEY (rankno) REFERENCES rank (rankno)
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.password is '패스워드';
COMMENT ON COLUMN member.name is '성명';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.rdate is '가입일';
COMMENT ON COLUMN member.rankno is '등급 번호';

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO member(memberno, id, password, name, tel, rdate, rankno) 
VALUES(member_seq.nextval, 'kd1', 1234, '관리자', '010-0000-0000', sysdate, 1);
INSERT INTO member(memberno, id, password, name, tel, rdate, rankno) 
VALUES(member_seq.nextval, 'kd2', 1234, '관리자', '010-0000-0000', sysdate, 1);

-- 전체 목록
SELECT memberno, id, password, name, tel, rdate, rankno
FROM member
ORDER BY memberno ASC;

  MEMBERNO ID                             PASSWORD             NAME                 TEL            RDATE                   RANKNO
---------- ------------------------------ -------------------- -------------------- -------------- ------------------- ----------
         1 kd1                            1234                 관리자               010-0000-0000  2023-06-02 10:14:59          1
         2 kd1                            1234                 관리자               010-0000-0000  2023-06-02 10:15:07          1
         3 kd2                            1234                 관리자               010-0000-0000  2023-06-02 10:15:07          1

-- 조회
SELECT memberno, id, password, name, tel, rdate, rankno
FROM member
WHERE memberno=1;

  MEMBERNO ID                             PASSWORD             NAME                 TEL            RDATE                   RANKNO
---------- ------------------------------ -------------------- -------------------- -------------- ------------------- ----------
         1 kd1                            1234                 관리자               010-0000-0000  2023-06-02 10:14:59          1

-- 수정
UPDATE member
SET id = 'kd4'
WHERE memberno=1;

  MEMBERNO ID                             PASSWORD             NAME                 TEL            ADDRESS1                                                                         ADDRESS2                                           RDATE                   RANKNO
---------- ------------------------------ -------------------- -------------------- -------------- -------------------------------------------------------------------------------- -------------------------------------------------- ------------------- ----------
         1 kd4                            1234                 관리자               010-0000-0000  서울시 은평구                                                                    수색동                                             2023-06-02 10:05:10          1

-- 삭제
DELETE FROM member
WHERE memberno=2;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM member;
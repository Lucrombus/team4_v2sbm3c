/**********************************/
/* Table Name: 업종 카테고리 */
/**********************************/
DROP TABLE jobcate CASCADE CONSTRAINTS;

CREATE TABLE jobcate(
		jobcateno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(20)		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

COMMENT ON TABLE jobcate is '업종 카테고리';
COMMENT ON COLUMN jobcate.jobcateno is '업종번호';
COMMENT ON COLUMN jobcate.name is '업종명';
COMMENT ON COLUMN jobcate.seqno is '출력순서';
COMMENT ON COLUMN jobcate.visible is '보기모드';


--PK용 시퀀스 삭제, 생성--
DROP SEQUENCE jobcate_seq;

CREATE SEQUENCE jobcate_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '카운터', 0, 'N');

INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '배달대행', 0, 'N');

INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '물류', 0, 'N');

INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '재택근무', 0, 'N');

INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '음식점', 0, 'N');

INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '임상시험', 0, 'N');

INSERT INTO jobcate (jobcateno, name, seqno, visible)
VALUES (jobcate_seq.nextval, '기타', 0, 'N');
/**********************************/
/* SELECT */
/**********************************/ 
SELECT jobcateno, name, seqno, visible  -- 전부 읽기
FROM jobcate; 

SELECT jobcateno, name, seqno, visible  -- 특정 레코드만
FROM jobcate
WHERE jobcateno =1; 

/**********************************/
/* UPDATE */
/**********************************/ 

UPDATE jobcate SET visible = 'Y';  -- 일괄 수정

UPDATE jobcate SET visible = 'Y'  -- 특정 레코드만
WHERE jobcateno = 1;

/**********************************/
/* DELETE */
/**********************************/ 
DELETE jobcate;  -- 일괄삭제

DELETE jobcate  -- 특정 레코드 삭제
WHERE jobcateno = 1;



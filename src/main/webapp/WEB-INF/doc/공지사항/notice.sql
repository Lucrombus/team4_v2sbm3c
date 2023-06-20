/**********************************/
/* Table Name: 공지사항 */
/**********************************/

DROP TABLE notice CASCADE CONSTRAINTS;

CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL    PRIMARY KEY,
		topview                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(50)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		cnt                           		NUMBER(7)		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL 
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN notice.topview is '상단노출여부';
COMMENT ON COLUMN notice.memberno is '회원 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.cnt is '조회수';
COMMENT ON COLUMN notice.word is '검색어';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.file1 is '메인 이미지';
COMMENT ON COLUMN notice.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN notice.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN notice.size1 is '메인 이미지 크기';

DROP SEQUENCE notice_seq;

CREATE SEQUENCE notice_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  

--/*제약조건 추가*/
--ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (noticeno);
--ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);


--insert
INSERT INTO notice (noticeno, topview, memberno, title, content, CNT, 
        WORD, rdate, file1, file1saved, thumb1, size1)
VALUES (notice_seq.nextval, 'N', 1, '공지사항제목', '내용', 0, '검색어1', sysdate, '메인이미지', '실제저장이미지', '메인이미지 썸네일', 0);

--select
SELECT noticeno, topview, memberno, title, content, CNT, 
       WORD, rdate, file1, file1saved, thumb1, size1
FROM notice
ORDER BY noticeno DESC;

--update
UPDATE notice
SET topview = 'Y' , title = '제목변경1', content = '내용변경1', word = '검색어수정1', file1 = '메인이미지수정1', 
    file1saved = '실제저장이미지수정1', thumb1 = '메인이미지 썸네일 수정1', size1 = 3
WHERE noticeno = 1;

--delete
DElETE FROM notice
WHERE noticeno = 1;

commit;
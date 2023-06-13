/**********************************/
/* Table Name: 공지사항 */
/**********************************/

DROP TABLE notice CASCADE CONSTRAINTS;

CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL,
		topview                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(50)		 NOT NULL,
		CONTENT                       		VARCHAR2(4000)		 NOT NULL,
		RECOM                         		NUMBER(7)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		REPLYCNT                      		NUMBER(7)		 NOT NULL,
		WORD                          		VARCHAR2(100)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR2(100)		 NULL ,
		FILE1SAVED                    		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
		MAP                           		VARCHAR2(1000)		 NULL ,
		YOUTUBE                       		VARCHAR2(1000)		 NULL ,
        FOREIGN KEY (memberno) REFERENCES memberno (member)
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN notice.topview is '상단노출여부';
COMMENT ON COLUMN notice.memberno is '회원 번호';
COMMENT ON COLUMN notice.TITLE is '제목';
COMMENT ON COLUMN notice.CONTENT is '내용';
COMMENT ON COLUMN notice.RECOM is '추천수';
COMMENT ON COLUMN notice.CNT is '조회수';
COMMENT ON COLUMN notice.REPLYCNT is '댓글수';
COMMENT ON COLUMN notice.WORD is '검색어';
COMMENT ON COLUMN notice.RDATE is '등록일';
COMMENT ON COLUMN notice.FILE1 is '메인 이미지';
COMMENT ON COLUMN notice.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN notice.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN notice.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN notice.MAP is '지도';
COMMENT ON COLUMN notice.YOUTUBE is 'Youtube 영상';

DROP SEQUENCE notice;

CREATE SEQUENCE notice
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  

/*제약조건 추가*/
ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (noticeno);
ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);


--insert
INSERT INTO notice (noticeno, topview, memberno, title, content, RECOM, CNT, REPLYCNT,  
WORD, rdate, file1, file1saved, thumb1, size1, ,map, Youtube)
VALUES (notice seq.nextval, 1, 'N', 1, '공지사항제목', '내용', 1, 0, 0, )

--select

--update

--delete
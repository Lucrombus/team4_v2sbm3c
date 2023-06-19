DROP TABLE contents CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 게시판 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		boardno                       		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(50)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(1000)		 NULL ,
		file1saved                    		VARCHAR2(1000)		 NULL ,
		thumb1                        		VARCHAR2(1000)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		word                          		VARCHAR2(100)		 NULL 
);

COMMENT ON TABLE contents is '게시판 컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.boardno is '게시판 번호';
COMMENT ON COLUMN contents.memberno is '회원번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인 이미지 프리뷰';
COMMENT ON COLUMN contents.size1 is '이미지 용량';
COMMENT ON COLUMN contents.word is '검색어';



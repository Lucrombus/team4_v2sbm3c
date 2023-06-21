/**********************************/
/* Table Name: 업종 카테고리 */
/**********************************/
CREATE TABLE jobcate(
		jobcateno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(20)		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT N		 NOT NULL
);

COMMENT ON TABLE jobcate is '업종 카테고리';
COMMENT ON COLUMN jobcate.jobcateno is '업종번호';
COMMENT ON COLUMN jobcate.name is '업종명';
COMMENT ON COLUMN jobcate.seqno is '출력순서';
COMMENT ON COLUMN jobcate.visible is '보기모드';


/**********************************/
/* Table Name: 등급 */
/**********************************/
CREATE TABLE rank(
		rankno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rankname                      		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE rank is '등급';
COMMENT ON COLUMN rank.rankno is '등급 번호';
COMMENT ON COLUMN rank.rankname is '등급 이름';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		id                            		VARCHAR2(30)		 NOT NULL,
		password                      		VARCHAR2(20)		 NOT NULL,
		name                          		VARCHAR2(20)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		rankno                        		NUMBER(10)		 NULL ,
		experience                    		VARCHAR2(10)		 DEFAULT 'N'		 NOT NULL,
		gender                        		VARCHAR2(10)		 DEFAULT '남성'		 NOT NULL,
		birth                         		DATE		 NOT NULL,
		education                     		VARCHAR2(10)		 DEFAULT '고졸'		 NOT NULL,
  FOREIGN KEY (rankno) REFERENCES rank (rankno)
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.password is '패스워드';
COMMENT ON COLUMN member.name is '성명';
COMMENT ON COLUMN member.rdate is '가입일';
COMMENT ON COLUMN member.rankno is '등급 번호';
COMMENT ON COLUMN member.experience is '경험여부';
COMMENT ON COLUMN member.gender is '성별';
COMMENT ON COLUMN member.birth is '생년월일';
COMMENT ON COLUMN member.education is '학력';


/**********************************/
/* Table Name: 구인 컨텐츠 */
/**********************************/
CREATE TABLE guin_c(
		guin_cno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		brand                         		VARCHAR2(50)		 NOT NULL,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		address                       		VARCHAR2(100)		 NOT NULL,
		map                           		VARCHAR2(1000)		 NOT NULL,
		wage                          		NUMBER(20)		 NOT NULL,
		day                           		VARCHAR2(50)		 NOT NULL,
		period                        		VARCHAR2(50)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NOT NULL,
		email                         		VARCHAR2(50)		 NOT NULL,
		file1                         		VARCHAR2(1000)		 NULL ,
		file1saved                    		VARCHAR2(1000)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		thumb1_origin                 		INTEGER(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		word                          		VARCHAR2(100)		 NULL ,
  FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE guin_c is '구인 컨텐츠';
COMMENT ON COLUMN guin_c.guin_cno is '구인 컨텐츠 번호';
COMMENT ON COLUMN guin_c.jobcateno is '업종번호';
COMMENT ON COLUMN guin_c.memberno is '회원번호';
COMMENT ON COLUMN guin_c.name is '업체명';
COMMENT ON COLUMN guin_c.brand is '프렌차이즈';
COMMENT ON COLUMN guin_c.title is '제목';
COMMENT ON COLUMN guin_c.content is '내용';
COMMENT ON COLUMN guin_c.rdate is '등록일';
COMMENT ON COLUMN guin_c.address is '주소';
COMMENT ON COLUMN guin_c.map is '지도';
COMMENT ON COLUMN guin_c.wage is '시급';
COMMENT ON COLUMN guin_c.day is '근무요일';
COMMENT ON COLUMN guin_c.period is '기간';
COMMENT ON COLUMN guin_c.tel is '연락처';
COMMENT ON COLUMN guin_c.email is '이메일';
COMMENT ON COLUMN guin_c.file1 is '메인 이미지';
COMMENT ON COLUMN guin_c.file1saved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN guin_c.thumb1 is '썸네일';
COMMENT ON COLUMN guin_c.thumb1_origin is '썸네일 오리지널';
COMMENT ON COLUMN guin_c.size1 is '이미지 용량';
COMMENT ON COLUMN guin_c.word is '검색어';


/**********************************/
/* Table Name: 구직 컨텐츠 */
/**********************************/
CREATE TABLE gujik_c(
		gujik_cno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(50)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		gender                        		VARCHAR2(50)		 NOT NULL,
		age                           		NUMBER(10)		 NOT NULL,
		experience                    		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		wage_want                     		NUMBER(20)		 NOT NULL,
		day_want                      		VARCHAR2(50)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NOT NULL,
		email                         		VARCHAR2(50)		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE gujik_c is '구직 컨텐츠';
COMMENT ON COLUMN gujik_c.gujik_cno is '구직 컨텐츠 번호';
COMMENT ON COLUMN gujik_c.jobcateno is '업종번호';
COMMENT ON COLUMN gujik_c.memberno is '회원번호';
COMMENT ON COLUMN gujik_c.title is '제목';
COMMENT ON COLUMN gujik_c.content is '내용';
COMMENT ON COLUMN gujik_c.rdate is '등록일';
COMMENT ON COLUMN gujik_c.gender is '성별';
COMMENT ON COLUMN gujik_c.age is '나이';
COMMENT ON COLUMN gujik_c.experience is '경력여부';
COMMENT ON COLUMN gujik_c.wage_want is '희망시급';
COMMENT ON COLUMN gujik_c.day_want is '희망요일';
COMMENT ON COLUMN gujik_c.tel is '연락처';
COMMENT ON COLUMN gujik_c.email is '이메일';
COMMENT ON COLUMN gujik_c.file1 is '메인 이미지';
COMMENT ON COLUMN gujik_c.file1saved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN gujik_c.thumb1 is '메인 이미지 프리뷰';
COMMENT ON COLUMN gujik_c.size1 is '이미지 용량';


/**********************************/
/* Table Name: 게시판 카테고리 */
/**********************************/
CREATE TABLE board(
		boardno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(20)		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT N		 NOT NULL
);

COMMENT ON TABLE board is '게시판 카테고리';
COMMENT ON COLUMN board.boardno is '게시판 번호';
COMMENT ON COLUMN board.name is '게시판 이름';
COMMENT ON COLUMN board.seqno is '출력순서';
COMMENT ON COLUMN board.visible is '보기모드';


/**********************************/
/* Table Name: 게시판 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		boardno                       		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(1000)		 NULL ,
		file1saved                    		VARCHAR2(1000)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		word                          		VARCHAR2(100)		 NULL ,
  FOREIGN KEY (boardno) REFERENCES board (boardno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
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
COMMENT ON COLUMN contents.size1 is '이미지 용량';
COMMENT ON COLUMN contents.word is '검색어';


/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE reply(
		replyno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
		reply_content                 		VARCHAR2(400)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN reply.memberno is '회원번호';
COMMENT ON COLUMN reply.reply_content is '댓글내용';
COMMENT ON COLUMN reply.rdate is '날짜';


/**********************************/
/* Table Name: 이력서 */
/**********************************/
CREATE TABLE resume(
		resumeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		resumetitle                   		VARCHAR2(50)		 NOT NULL,
		resumep                       		VARCHAR2(100)		 NOT NULL,
		intro                         		VARCHAR2(100)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE resume is '이력서';
COMMENT ON COLUMN resume.resumeno is '이력서 번호';
COMMENT ON COLUMN resume.memberno is '회원번호';
COMMENT ON COLUMN resume.resumetitle is '이력서 제목';
COMMENT ON COLUMN resume.resumep is '이력서 사진';
COMMENT ON COLUMN resume.intro is '자기소개';
COMMENT ON COLUMN resume.rdate is '이력서 등록일';


/**********************************/
/* Table Name: 쪽지 */
/**********************************/
CREATE TABLE message(
		messageno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(30)		 NOT NULL,
		content                       		CLOB(1000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE message is '쪽지';
COMMENT ON COLUMN message.messageno is '쪽지번호';
COMMENT ON COLUMN message.memberno is '보낸 회원번호';
COMMENT ON COLUMN message.memberno is '받는 회원번호';
COMMENT ON COLUMN message.title is '제목';
COMMENT ON COLUMN message.content is '내용';
COMMENT ON COLUMN message.rdate is '쪽지 등록일';


/**********************************/
/* Table Name: 컨텐츠 신고 */
/**********************************/
CREATE TABLE report(
		reportno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		INTEGER(10)		 NOT NULL,
		reason                        		VARCHAR2(100)		 NULL ,
		targetURL                     		VARCHAR2(100)		 NULL ,
		contentsno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE report is '컨텐츠 신고';
COMMENT ON COLUMN report.reportno is '신고번호';
COMMENT ON COLUMN report.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN report.reason is '신고사유';
COMMENT ON COLUMN report.targetURL is '대상 URL';
COMMENT ON COLUMN report.contentsno is '컨텐츠 번호';


/**********************************/
/* Table Name: 관심 구직 */
/**********************************/
CREATE TABLE like_gujik(
		like_gujikno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		gujik_cno                     		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (gujik_cno) REFERENCES gujik_c (gujik_cno)
);

COMMENT ON TABLE like_gujik is '관심 구직';
COMMENT ON COLUMN like_gujik.like_gujikno is '관심구직번호';
COMMENT ON COLUMN like_gujik.memberno is '회원번호';
COMMENT ON COLUMN like_gujik.gujik_cno is '구직컨텐츠번호';


/**********************************/
/* Table Name: 관심 구인 */
/**********************************/
CREATE TABLE like_guin(
		like_guinno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		guin_cno                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (guin_cno) REFERENCES guin_c (guin_cno)
);

COMMENT ON TABLE like_guin is '관심 구인';
COMMENT ON COLUMN like_guin.like_guinno is '관심구인번호';
COMMENT ON COLUMN like_guin.memberno is '회원번호';
COMMENT ON COLUMN like_guin.guin_cno is '구인컨텐츠번호';


/**********************************/
/* Table Name: 댓글 좋아요 */
/**********************************/
CREATE TABLE like_reply(
		like_replyno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NOT NULL,
		replyno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (replyno) REFERENCES reply (replyno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE like_reply is '댓글 좋아요';
COMMENT ON COLUMN like_reply.like_replyno is '좋아요댓글번호';
COMMENT ON COLUMN like_reply.contentsno is '컨텐츠번호';
COMMENT ON COLUMN like_reply.replyno is '댓글번호';
COMMENT ON COLUMN like_reply.memberno is '회원번호';


/**********************************/
/* Table Name: 박찬호 */
/**********************************/
CREATE TABLE Park(

);

COMMENT ON TABLE Park is '박찬호';


/**********************************/
/* Table Name: 최명훈 */
/**********************************/
CREATE TABLE Choi(

);

COMMENT ON TABLE Choi is '최명훈';


/**********************************/
/* Table Name: 임준혁 */
/**********************************/
CREATE TABLE Lim(

);

COMMENT ON TABLE Lim is '임준혁';


/**********************************/
/* Table Name: 윤재석 */
/**********************************/
CREATE TABLE Yoon(

);

COMMENT ON TABLE Yoon is '윤재석';


/**********************************/
/* Table Name: 추천시스템 */
/**********************************/
CREATE TABLE recommendation(
		recomno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		jobcateno                     		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		score                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (jobcateno) REFERENCES jobcate (jobcateno)
);

COMMENT ON TABLE recommendation is '추천시스템';
COMMENT ON COLUMN recommendation.recomno is '추천번호';
COMMENT ON COLUMN recommendation.jobcateno is '업종번호';
COMMENT ON COLUMN recommendation.memberno is '회원번호';
COMMENT ON COLUMN recommendation.score is '추천우선순위';


/**********************************/
/* Table Name: 홍영서 */
/**********************************/
CREATE TABLE Hong(

);

COMMENT ON TABLE Hong is '홍영서';


/**********************************/
/* Table Name: 유원진 */
/**********************************/
CREATE TABLE Yoo(

);

COMMENT ON TABLE Yoo is '유원진';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
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
		size1                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
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


/**********************************/
/* Table Name: 김준범 */
/**********************************/
CREATE TABLE Kim(

);

COMMENT ON TABLE Kim is '김준범';


/**********************************/
/* Table Name: 문의 */
/**********************************/
CREATE TABLE inquiry(
		inquiryno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		INTEGER(10)		 NOT NULL,
		inquiryReason                 		VARCHAR2(100)		 NULL ,
		contentsno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE inquiry is '문의';
COMMENT ON COLUMN inquiry.inquiryno is '문의번호';
COMMENT ON COLUMN inquiry.memberno is '회원번호 (신고자)';
COMMENT ON COLUMN inquiry.inquiryReason is '문의사유';
COMMENT ON COLUMN inquiry.contentsno is '컨텐츠 번호';



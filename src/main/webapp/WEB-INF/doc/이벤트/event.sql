/**********************************/
/* Table Name: 이벤트 */
/**********************************/
CREATE TABLE event(
      eventno                             NUMBER(10)       NOT NULL       PRIMARY KEY,
      memberno                            NUMBER(10)       NOT NULL,
      title                               VARCHAR2(50)       NOT NULL,
      content                             VARCHAR2(4000)       NOT NULL,
      viewcnt                             NUMBER(7)       NOT NULL,
      word                                VARCHAR2(100)       NULL ,
      rdate                               DATE       NOT NULL,
      file1                               VARCHAR2(1000)       NULL ,
      file1saved                          VARCHAR2(1000)       NULL ,
      thumb1                              VARCHAR2(100)       NULL ,
      size1                               NUMBER(10)       NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eventno is '이벤트 번호';
COMMENT ON COLUMN event.memberno is '회원 번호';
COMMENT ON COLUMN event.title is '제목';
COMMENT ON COLUMN event.content is '내용';
COMMENT ON COLUMN event.viewcnt is '조회수';
COMMENT ON COLUMN event.word is '검색어';
COMMENT ON COLUMN event.rdate is '등록일';
COMMENT ON COLUMN event.file1 is '메인 이미지';
COMMENT ON COLUMN event.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN event.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN event.size1 is '메인 이미지 크기';

DROP SEQUENCE event_seq;

CREATE SEQUENCE event_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
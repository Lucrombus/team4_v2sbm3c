/**********************************/
/* Table Name: 쪽지 */
/**********************************/
DROP TABLE message CASCADE CONSTRAINTS;
DROP SEQUENCE message_seq;

CREATE TABLE message(
		messageno                     		NUMBER(10)		 NOT NULL,
		memberno                            NUMBER(10)		 NOT NULL,
		receive_memberno                    NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(30)		 NOT NULL,
		content                       		VARCHAR2(1000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE message is '쪽지';
COMMENT ON COLUMN message.messageno is '쪽지번호';
COMMENT ON COLUMN message.memberno is '보낸 회원번호';
COMMENT ON COLUMN message.receive_memberno is '받는 회원번호';
COMMENT ON COLUMN message.title is '제목';
COMMENT ON COLUMN message.content is '내용';
COMMENT ON COLUMN message.rdate is '날짜';

CREATE SEQUENCE message_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--insert
INSERT INTO message(messageno, memberno, memberno, receive_memberno, title, content, rdate)
VALUES(message_seq.nextval, 1, 1, 2, '쪽지타이틀test1', '쪽지내용test1', sysdate);

--select
SELECT messageno, memberno, memberno, receive_memberno, title, content, rdate
FROM message;

--update
UPDATE message SET title = '쪽지타이틀test1수정'
WHERE messageno = 1;

--delete
DELETE message
WHERE messageno = 1;

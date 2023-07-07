/**********************************/
/* Table Name: 쪽지 */
/**********************************/
DROP TABLE message CASCADE CONSTRAINTS;


CREATE TABLE message(
		messageno                     		NUMBER(10)		 NOT NULL,
		memberno                            NUMBER(10)		 NULL,
		receive_memberno                    NUMBER(10)		 NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(1000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
    read                                CHAR(1)      DEFAULT('N') NOT NULL,
    FOREIGN KEY (memberno) REFERENCES member(memberno) ON DELETE SET NULL,
    FOREIGN KEY (receive_memberno) REFERENCES member(memberno) ON DELETE SET NULL
        
);

COMMENT ON TABLE message is '쪽지';
COMMENT ON COLUMN message.messageno is '쪽지번호';
COMMENT ON COLUMN message.memberno is '보낸 회원번호';
COMMENT ON COLUMN message.receive_memberno is '받는 회원번호';
COMMENT ON COLUMN message.title is '제목';
COMMENT ON COLUMN message.content is '내용';
COMMENT ON COLUMN message.rdate is '날짜';
COMMENT ON COLUMN message.read is '읽음 여부';


DROP SEQUENCE message_seq;

CREATE SEQUENCE message_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO message(messageno, memberno, receive_memberno, title, content, rdate)
VALUES(message_seq.nextval, 1, 2, '쪽지타이틀test1', '쪽지내용test1', sysdate);



/**********************************/
/* SELECT */
/**********************************/

--내가 받은 쪽지 조회
SELECT messageno, memberno, receive_memberno, title, content, rdate, read
FROM message
WHERE receive_memberno = 2;

commit;

--내가 보낸 쪽지 조회
SELECT messageno, memberno, receive_memberno, title, content, rdate, read
FROM message
WHERE memberno = 1;

--안 읽은 메시지 갯수
SELECT count(*)
FROM message
WHERE receive_memberno = 1 and read = 'N';

/**********************************/
/* UPDATE */
/**********************************/

--읽은 메시지 Y로 바꾸기
UPDATE message SET read = 'Y'
WHERE messageno= 1;

/**********************************/
/* DELETE */
/**********************************/

--쪽지 삭제
DELETE message
WHERE messageno = 1 AND receive_meberno = 1;

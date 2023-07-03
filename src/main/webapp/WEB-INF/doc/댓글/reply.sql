DROP TABLE reply CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE reply(
		replyno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL ,
        reply_content                       VARCHAR2(400)    NOT NULL,
		rdate                         		DATE		 NOT NULL,
        FOREIGN KEY (contentsno) REFERENCES contents(contentsno),
        FOREIGN KEY (memberno) REFERENCES member(memberno)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN reply.memberno is '회원번호';
COMMENT ON COLUMN reply.reply_content is '댓글내용';
COMMENT ON COLUMN reply.rdate is '날짜';

DROP SEQUENCE reply_seq;

CREATE SEQUENCE reply_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  
/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO reply (replyno, contentsno, memberno, reply_content, rdate)
VALUES (reply_seq.nextval, 2, 2, '하이요', sysdate);

commit;

/**********************************/
/* SELECT */
/**********************************/
SELECT replyno, contentsno, memberno, reply_content, rdate
FROM replyno
WHERE replyno = 1;

/**********************************/
/* DELETE */
/**********************************/ 
DELETE FROM reply
WHERE replyno = 1;
  

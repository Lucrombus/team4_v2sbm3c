/**********************************/
/* Table Name: 파일 저장소 */
/**********************************/
DROP TABLE like_reply CASCADE CONSTRAINTS;

CREATE TABLE like_reply(
		likeno                     		   NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		replyno                            NUMBER(10)        NOT NULL,    
        memberno                           NUMBER(10)	     NOT NULL,
        FOREIGN KEY (replyno) REFERENCES reply (replyno),
        FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE like_reply is '댓글 좋아요';
COMMENT ON COLUMN like_reply.likeno is '좋아요 번호';
COMMENT ON COLUMN like_reply.replyno is '좋아요 대상 댓글 번호';
COMMENT ON COLUMN like_reply.memberno is '좋아요 누른 회원 번호';

--PK용 시퀀스 삭제, 생성--
DROP SEQUENCE like_reply_seq;

CREATE SEQUENCE like_reply_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지








/**********************************/
/* INSERT */
/**********************************/   
--좋아요 눌렀을 때
INSERT INTO like_reply (likeno, replyno, memberno)
VALUES (like_reply_seq.nextval, 38, 1);






/**********************************/
/* SELECT */
/**********************************/ 

-- 특정 댓글에 달린 추천 갯수
SELECT COUNT(*) as cnt
FROM like_reply
WHERE replyno = 38;



-- 특정 멤버가 특정 댓글을 추천 몇번 했는지
SELECT COUNT(*) as cnt
FROM like_reply
WHERE replyno = 38 AND memberno =1;


-- 댓글번호 별 좋아요 갯수 출력
SELECT r.replyno, COUNT(l.memberno) as count
FROM reply r LEFT OUTER JOIN like_reply l ON r.replyno = l.replyno
GROUP BY r.replyno
ORDER BY replyno;

-- 특정 댓글번호의 좋아요 갯수 출력
SELECT r.replyno, COUNT(l.memberno) as cnt
FROM reply r LEFT OUTER JOIN like_reply l ON r.replyno = l.replyno
GROUP BY r.replyno
HAVING r.replyno = 38;


-- 댓글 리스트와 좋아요 갯수
SELECT r.replyno, r.contentsno, r.memberno, r.reply_content, r.rdate, l.cnt
    FROM reply r, 
    (
    SELECT r.replyno as replyno, COUNT(l.memberno) as cnt
    FROM reply r LEFT OUTER JOIN like_reply l ON r.replyno = l.replyno
    GROUP BY r.replyno
    ORDER BY replyno
    ) l
WHERE r.replyno = l.replyno;


/**********************************/
/* DELETE */
/**********************************/ 

DELETE FROM like_reply;
commit;







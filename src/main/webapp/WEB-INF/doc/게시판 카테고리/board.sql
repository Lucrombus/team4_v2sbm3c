DROP TABLE board CASCADE CONSTRAINTS;

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


--PK용 시퀀스 삭제, 생성--
DROP SEQUENCE board_seq;

CREATE SEQUENCE board_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* INSERT */
/**********************************/ 
INSERT INTO board (boardno, name, seqno, visible)
VALUES (board_seq.nextval, '편의점', 0, 'N');

INSERT INTO board (boardno, name, seqno, visible)
VALUES (board_seq.nextval, '카페', 0, 'N');

INSERT INTO board (boardno, name, seqno, visible)
VALUES (board_seq.nextval, '피시방', 0, 'N');


/**********************************/
/* SELECT */
/**********************************/ 
SELECT boardno, name, seqno, visible  -- 전부 읽기
FROM board; 

SELECT boardno, name, seqno, visible  -- 특정 레코드만
FROM board
WHERE boardno =1; 

/**********************************/
/* UPDATE */
/**********************************/ 

UPDATE board SET visible = 'Y';  -- 일괄 수정

UPDATE board SET visible = 'Y'  -- 특정 레코드만
WHERE boardno = 1;

UPDATE board SET name = 'PC방'  -- 특정 레코드만
WHERE boardno = 9;


commit;

/**********************************/
/* DELETE */
/**********************************/ 
DELETE board;  -- 일괄삭제

DELETE board  -- 특정 레코드 삭제
WHERE boardno = 1;


INSERT INTO board(boardno, name, seqno, visible) 
VALUES(board_seq.nextval, '편의점', 0, 'N');

SELECT boardno, name, seqno, visible 
FROM board 
ORDER BY seqno ASC;

DELETE FROM board
WHERE boardno = 3;

commit;
package dev.mvc.notice;

import java.util.ArrayList;

public interface NoticeProcInter {
  
  /**
   * 공지사항 등록
   * @param NoticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 공지사항 전체 목록
   * @param 
   * @return 전체목록을 ArrayList<NoticeVO>로 리턴
   */
  public ArrayList<NoticeVO> list_all();
  
  /**
   * 공지사항 조회
   * @return
   */
  public NoticeVO read(int noticeno);
  
  /**
   * 공지사항 글 수정
   * @return
   */
  public int update_text(NoticeVO noticeVO);
  
  /**
   * 공지사항 파일 수정
   * @return
   */
  public int update_file(NoticeVO noticeVO);
  
  /**
   * 공지사항 삭제
   * @return
   */
  public int delete(int noticeno);
  
  

}

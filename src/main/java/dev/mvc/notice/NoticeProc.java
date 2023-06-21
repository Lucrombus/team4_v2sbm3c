package dev.mvc.notice;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.contents.ContentsVO;
import dev.mvc.jobcate.JobcateVO;
import dev.mvc.resume.ResumeVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
  @Autowired
  private NoticeDAOInter noticeDAO;
  
  @Override
  public int create(NoticeVO noticeVO) { 
    
    int cnt = this.noticeDAO.create(noticeVO); 
    return cnt;
  }
  
  @Override
  public ArrayList<NoticeVO> list_all() {
    ArrayList<NoticeVO> list = this.noticeDAO.list_all();
    
    // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
    for (NoticeVO noticeVO : list) {
      String title = noticeVO.getTitle();
      String content = noticeVO.getContent();
      
      title = Tool.convertChar(title);  // 특수 문자 처리
      content = Tool.convertChar(content); 
      
      noticeVO.setTitle(title);
      noticeVO.setContent(content);  
    }
    
    return list;
  }
  
  @Override
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = this.noticeDAO.read(noticeno);
    return noticeVO;
    
  }
  
  @Override
  public int update_text(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update_text(noticeVO);
    return cnt;
  }

  @Override
  public int update_file(NoticeVO noticeVO) {
      int cnt = this.noticeDAO.update_file(noticeVO);
      return cnt;
  }

  @Override
  public int delete(int noticeno) {
    int cnt = this.noticeDAO.delete(noticeno);
    return cnt;
  }


  

  
  
 

 

}
package dev.mvc.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class NoticeCont {
  
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;
  
  public NoticeCont() {
    System.out.println("NoticeCont created");
  }

  //이력서 등록 폼
  
  //이력서 등록 처리
  
  //리스트 조회
  
  //이력서 조회
  
  //이력서 삭제 폼
  
  //이력서 삭제 처리
  
  //이력서 수정 폼
  
  //이력서 수정 처리
  
  
}
package dev.mvc.resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ResumeCont {
  
  @Autowired
  @Qualifier("dev.mvc.resume.ResumeProc")
  private ResumeProcInter resumeProc;
  
  public ResumeCont() {
    System.out.println("ResumeCont created");
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

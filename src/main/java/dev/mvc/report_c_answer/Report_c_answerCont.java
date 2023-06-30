package dev.mvc.report_c_answer;

import java.util.ArrayList;
import java.util.function.Function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.report_m.Report_mVO;
import dev.mvc.resume.Resume;
import dev.mvc.resume.ResumeVO;
import dev.mvc.tool.Tool;


@Controller
public class Report_c_answerCont {
  
  @Autowired
  @Qualifier("dev.mvc.report_c_answer.Report_c_answerProc")
  private Report_c_answerProcInter report_cProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;

  public Report_c_answerCont() {
    System.out.println("Report_c_answerCont created");
  }
  
  

}

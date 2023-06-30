package dev.mvc.report_c_answer;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.report_c_answer.Report_c_answerProc")
public class Report_c_answerProc implements Report_c_answerProcInter{
  
  @Autowired
  private Report_c_answerDAOInter report_cDAO;

  

}

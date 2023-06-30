package dev.mvc.report_m_answer;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.report_m_answer.Report_m_answerProc")
public class Report_m_answerProc implements Report_m_answerProcInter{
  
  @Autowired
  private Report_m_answerDAOInter report_mDAO;

  

}

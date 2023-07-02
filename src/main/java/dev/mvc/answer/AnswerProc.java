package dev.mvc.answer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.inquiry.InquiryVO;
import dev.mvc.tool.Tool;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.answer.AnswerProc")
public class AnswerProc implements AnswerProcInter {
  @Autowired // 자동으로 answerDAO으로 묶음.
  private AnswerDAOInter answerDAO;
  
  public AnswerProc(){
    System.out.println("");
  }
  
  @Override
  public int create(AnswerVO answerVO) {
    int cnt = this.answerDAO.create(answerVO);
    return cnt;
  }

  @Override
  public AnswerVO read(int answerno) {
    AnswerVO answerVO = this.answerDAO.read(answerno);
    return answerVO;
  }

  @Override
  public ArrayList<AnswerVO> list_all() {
    ArrayList<AnswerVO> list = this.answerDAO.list_all();
    
    // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
    for (AnswerVO answerVO : list) {
      String content = answerVO.getContent();
      
      content = Tool.convertChar(content); 
      
      answerVO.setContent(content);  
    }
    return list; 
  }

  @Override
  public int update(AnswerVO answerVO) {
    int cnt = this.answerDAO.update(answerVO);
    return cnt;
  }

  @Override
  public int delete(int answerno) {
    int cnt = this.answerDAO.delete(answerno);
    return cnt;
  }

  @Override
  public AnswerVO read_by_inquiryno(int inquiryno) {
    AnswerVO answerVO = this.answerDAO.read_by_inquiryno(inquiryno);
    return answerVO;
  }
}

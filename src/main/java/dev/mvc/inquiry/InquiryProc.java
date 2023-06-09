package dev.mvc.inquiry;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberVO;
import dev.mvc.tool.Tool;
 
@Component("dev.mvc.inquiry.InquiryProc")
public class InquiryProc implements InquiryProcInter {
  @Autowired // 자동으로 memberDAO으로 묶음.
  private InquiryDAOInter inquiryDAO;
  
  public InquiryProc(){
    System.out.println("");
  }

  @Override
  public int create(InquiryVO inquiryVO) {
    int cnt = this.inquiryDAO.create(inquiryVO);
    return cnt;
  }
  
  @Override
  public ArrayList<InquiryVO> list_all() {
    ArrayList<InquiryVO> list = this.inquiryDAO.list_all();
    
    // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
    for (InquiryVO inquiryVO : list) {
      String title = inquiryVO.getInquiryTitle();
      String content = inquiryVO.getInquiryReason();
      
      title = Tool.convertChar(title);  // 특수 문자 처리
      content = Tool.convertChar(content); 
      
      inquiryVO.setInquiryTitle(title);
      inquiryVO.setInquiryReason(content);  
    }
    return list; 
  }
  
  @Override
  public ArrayList<InquiryVO> list_by_memberno(int memberno) {
    ArrayList<InquiryVO> list = this.inquiryDAO.list_by_memberno(memberno);
    
 // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
    for (InquiryVO inquiryVO : list) {
      String title = inquiryVO.getInquiryTitle();
      String reason = inquiryVO.getInquiryReason();
      
      title = Tool.convertChar(title);  // 특수 문자 처리
      reason = Tool.convertChar(reason); 
      
      inquiryVO.setInquiryTitle(title);
      inquiryVO.setInquiryReason(reason);  
    }
    return list; 
  }
  
  @Override
  public InquiryVO read(int inquiryno) {
    InquiryVO inquiryVO = this.inquiryDAO.read(inquiryno);
    return inquiryVO;
  }

  @Override
  public int update(InquiryVO inquiryVO) {
    int cnt = this.inquiryDAO.update(inquiryVO);
    return cnt;
  }

  @Override
  public int delete(int inquiryno) {
    int cnt = this.inquiryDAO.delete(inquiryno);
    return cnt;
  }

  @Override
  public int update_yn(InquiryVO inquiryVO) {
    int cnt = this.inquiryDAO.update_yn(inquiryVO);
    return cnt;
  }
}
package dev.mvc.inquiry;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
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
  
//  @Override
//  public ArrayList<MemberVO> list() {
//    ArrayList<MemberVO> list = this.memberDAO.list();
//    return list;
//  }
//
//  @Override
//  public MemberVO read(int memberno) {
//    MemberVO memberVO = this.memberDAO.read(memberno);
//    return memberVO;
//  }
//
//  @Override
//  public MemberVO readById(String id) {
//    MemberVO memberVO = this.memberDAO.readById(id);
//    return memberVO;
//  }
//  
//  @Override
//  public MemberVO readByMemberno(int memberno) {
//    MemberVO memberVO = this.memberDAO.readByMemberno(memberno);
//    return memberVO;
//  }
//  
//  @Override
//  public int update(MemberVO memberVO) {
//    int cnt = this.memberDAO.update(memberVO);
//    return cnt;
//  }
//  
//  @Override
//  public int delete(int memberno) {
//    int cnt = this.memberDAO.delete(memberno);
//    return cnt;
//  }

}
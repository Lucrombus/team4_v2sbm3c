package dev.mvc.inquiry;

import java.util.ArrayList;
import java.util.HashMap;  // class
import java.util.List;
// interface, 인터페이스를 사용하는 이유는 다른 형태의 구현 클래스로 변경 시 소스 변경이 거의 발생 안됨.
// 예) 2022년 세금 계산 방법 구현 class, 2023년 세금 계산 방법 구현 class
// 인터페이스 = 구현 클래스
// Payend pay = new Payend2022();
// Payend pay = new Payend2023();
// Payend pay = new Payend2024();
// pay.calc();
import java.util.Map; // interface

import dev.mvc.member.MemberVO;
import dev.mvc.notice.NoticeVO;

public interface InquiryDAOInter {
  
  /**
   * 문의 글 등록
   * @param inquiryVO
   * @return
   */
  public int create(InquiryVO inquiryVO);
  
  /**
   * 문의 전체 목록 (관리자)
   * @return
   */
  public ArrayList<InquiryVO> list_all();
  
  /**
   * 멤버 개인 문의 전체 목록
   * @return
   */
  public ArrayList<InquiryVO> list_by_memberno(int memberno);
  
  /**
   * 문의 조회
   * @return
   */
  public InquiryVO read(int inquiryno);
}

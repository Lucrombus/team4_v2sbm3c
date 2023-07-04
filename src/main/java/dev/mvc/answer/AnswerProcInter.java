package dev.mvc.answer;

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

import dev.mvc.answer.AnswerVO;
import dev.mvc.inquiry.InquiryVO;
import dev.mvc.member.MemberVO;

public interface AnswerProcInter {

  /**
   * 답변 등록
   * @param answerVO
   * @return
   */
  public int create(AnswerVO answerVO);
  
  /**
   * 답변 조회
   * @param answerno
   * @return
   */
  public AnswerVO read(int answerno);
  
  /**
   * 답변 전체 목록
   * @return
   */
  public ArrayList<AnswerVO> list_all();
  
  /**
   * 답변 수정 처리
   * @param answerVO
   * @return
   */
  public int update(AnswerVO answerVO);
  
  /**
   * 답변 삭제 처리
   * @param answerno
   * @return
   */
  public int delete(int answerno);
  
  /**
   * 문의 번호에 따른 문의 및 답변 조회
   * @param inquiryno
   * @return
   */
  public AnswerVO read_by_inquiryno(int inquiryno);
  
  /**
   * inquiryno에 따른 답변 목록
   * @param inquiryno
   * @return
   */
  public ArrayList<AnswerVO> list_by_inquiryno(int inquiryno);
  
  /**
   * 답변 작성 유무 확인
   * @param inquiryno
   * @return cnt
   */
  public int checkAnswer(int inquiryno);
}

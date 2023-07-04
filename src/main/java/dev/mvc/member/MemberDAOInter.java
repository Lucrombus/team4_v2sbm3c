package dev.mvc.member;

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

public interface MemberDAOInter {
  /**
   * 중복 아이디 검사
   * @param id
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
  
  /**
   * 회원 가입
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public ArrayList<MemberVO> list();
  
  /**
   * 등급에 따른 회원 목록
   * @return
   */
  public ArrayList<MemberVO> list_by_rankno(int rankno);
  
  /**
   * memberno로 회원 정보 조회
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * id로 회원 정보 조회
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   * memberno로 회원 정보 조회
   * @param memberno
   * @return
   */
  public MemberVO readByMemberno(int Memberno);
  
  /**
   * 수정 처리
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 회원 삭제 처리
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * 등급에 따른 회원 삭제 처리
   * @param rankno
   * @return
   */
  public int delete_by_rankno(int rankno);
  
  /**
   * 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return 변경된 패스워드 갯수
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * 로그인 처리
   */
  public int login(HashMap<String, Object> map);
  
  /**
   * 정지 회원이 아닌 회원 로그인 처리
   */
  public int login_p(HashMap<String, Object> map);
  
  /**
   * 탈퇴 회원이 아닌 회원 로그인 처리
   */
  public int login_s(HashMap<String, Object> map);
  
  /**
   * 탈퇴 회원 처리
   * @param memberVO
   * @return
   */
  public int suspend_member(MemberVO memberVO);
  
  /**
   * 탈퇴 회원 처리
   * @param memberVO
   * @return
   */
  public int delete_member(MemberVO memberVO);
  
  /**
   * 아이디 찾기
   * @param memberVO
   * @return
   */
  public String find_id(MemberVO memberVO);
  
  /**
   * 비밀번호 찾기
   * @param memberVO
   * @return
   */
  public String find_passwd(MemberVO memberVO);
  
//  /**
//   *  페이징된 회원 목록
//   *  spring framework이 JDBC 관련 코드를 모두 생성해줌
//   * @return
//   */
//  public ArrayList<MemberVO> list_by_paging(MemberVO memberVO);
}
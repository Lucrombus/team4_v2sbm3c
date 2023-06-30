package dev.mvc.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberProcInter {
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
   * 로그인 된 회원 계정인지 검사
   * @param session
   * @return true : 사용자
   */
  public boolean isMember(HttpSession session);
  
  /**
   * 로그인 된 기업 계정인지 검사
   * @param session
   * @return true : 사용자
   */
  public boolean isEnterprise(HttpSession session);
  
  /**
   * 로그인 된 관리자 계정인지 검사
   * @param session
   * @return true : 사용자
   */
  public boolean isAdmin(HttpSession session);
  
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
  
//  /**
//   *  페이징된 회원 목록
//   *  spring framework이 JDBC 관련 코드를 모두 생성해줌
//   * @return
//   */
//  public ArrayList<MemberVO> list_by_paging(MemberVO memberVO);
//  
//  /** 
//   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
//   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
//   * 
//   * @param now_page      현재 페이지
//   * @return 페이징 생성 문자열
//   */ 
//  public String pagingBox(int now_page);
}
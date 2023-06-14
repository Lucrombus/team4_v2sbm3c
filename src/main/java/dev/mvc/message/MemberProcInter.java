package dev.mvc.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import dev.mvc.Report.reportVO;

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
  public int create(reportVO memberVO);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public ArrayList<reportVO> list();
  
  /**
   * memberno로 회원 정보 조회
   * @param memberno
   * @return
   */
  public reportVO read(int memberno);
  
  /**
   * id로 회원 정보 조회
   * @param id
   * @return
   */
  public reportVO readById(String id);
  
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
  public int update(reportVO memberVO);
  
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
}
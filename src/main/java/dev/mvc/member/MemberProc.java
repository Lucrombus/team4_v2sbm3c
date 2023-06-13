package dev.mvc.member;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  @Autowired // 자동으로 memberDAO으로 묶음.
  private MemberDAOInter memberDAO;
  
  public MemberProc(){
    System.out.println("");
  }

  @Override
  public int checkID(String id) {
    int cnt = this.memberDAO.checkID(id);
    return cnt;
  }

  @Override
  public int create(MemberVO memberVO) {
    int cnt = this.memberDAO.create(memberVO);
    return cnt;
  }

  @Override
  public ArrayList<MemberVO> list() {
    ArrayList<MemberVO> list = this.memberDAO.list();
    return list;
  }

  @Override
  public MemberVO read(int memberno) {
    MemberVO memberVO = this.memberDAO.read(memberno);
    return memberVO;
  }

  @Override
  public MemberVO readById(String id) {
    MemberVO memberVO = this.memberDAO.readById(id);
    return memberVO;
  }
  
  @Override
  public MemberVO readByMemberno(int memberno) {
    MemberVO memberVO = this.memberDAO.readByMemberno(memberno);
    return memberVO;
  }
  
  @Override
  public int update(MemberVO memberVO) {
    int cnt = this.memberDAO.update(memberVO);
    return cnt;
  }
  
  @Override
  public int delete(int memberno) {
    int cnt = this.memberDAO.delete(memberno);
    return cnt;
  }
  
  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_update(map);
    return cnt;
  }

  @Override
  public int login(HashMap<String, Object> map) {
    int cnt = this.memberDAO.login(map);
    return cnt;
  }

  @Override
  public boolean isMember(HttpSession session) {
    boolean member_sw = false; // 로그인 하지 않은 것으로 초기화
    int rankno = 2;
    
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("rankno") != null) {
        rankno = (int)session.getAttribute("rankno");
      }
      
      if (id != null && rankno == 2){ // 관리자 + 회원
        member_sw = true;  // 로그인 한 경우
      }
    }
    
    return member_sw;
  }
  
  @Override
  public boolean isEnterprise(HttpSession session) {
    boolean enterprise_sw = false; // 로그인 하지 않은 것으로 초기화
    int rankno = 3;
    
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("rankno") != null) {
        rankno = (int)session.getAttribute("rankno");
      }
      
      if (id != null && rankno == 3){ // 관리자 + 회원
        enterprise_sw = true;  // 로그인 한 경우
      }
    }
    
    return enterprise_sw;
  }

  @Override
  public boolean isAdmin(HttpSession session) {
    boolean admin_sw = false;
    int rankno = 1;
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("rankno") != null) {
        rankno = (int)session.getAttribute("rankno");
      }
      
      if (id != null && rankno == 1) {
        admin_sw = true; // 정상적으로 로그인 한 경우
      }
    }
    return admin_sw;
  }
}
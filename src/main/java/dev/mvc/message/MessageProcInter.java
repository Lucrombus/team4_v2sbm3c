package dev.mvc.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MessageProcInter {
  
  /**
   * 등록
   * 
   * @param MessageVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(MessageVO MessageVO);
  
  /**
   * 조회
   * 
   * @param int
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public ArrayList<MessageVO> list_receive(int receive_memberno);
  
  /**
   * 조회
   * 
   * @param int
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public ArrayList<MessageVO> list_send(int memberno);
  
  /**
   * 조회
   * 
   * @param int
   * @return 
   */
  public MessageVO read(int messageno);
  
  
  
}
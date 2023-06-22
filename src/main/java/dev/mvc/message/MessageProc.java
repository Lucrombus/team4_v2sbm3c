package dev.mvc.message;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.message.MessageProc")
public class MessageProc implements MessageProcInter {
  
  @Autowired
  private MessageDAOInter MessageDAO;
  
  
  
  @Override
  public int create(MessageVO messageVO) {
    
    int cnt = this.MessageDAO.create(messageVO);
    return cnt;
  }
  
  @Override
  public ArrayList<MessageVO> list_receive(int receive_memberno) {
    
    ArrayList<MessageVO> list = this.MessageDAO.list_receive(receive_memberno);
    return list;
  }
  
  
  
  

  }
  


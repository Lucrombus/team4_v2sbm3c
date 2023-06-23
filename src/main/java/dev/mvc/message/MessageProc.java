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
  
  @Override
  public ArrayList<MessageVO> list_send(int memberno) {
    
    ArrayList<MessageVO> list = this.MessageDAO.list_send(memberno);
    return list;
  }
  
  @Override
  public MessageVO read(int messageno) {
    
    MessageVO messageVO = this.MessageDAO.read(messageno);
    return messageVO;
  }
  
  @Override
  public int delete(int messageno) {
    
    int cnt = this.MessageDAO.delete(messageno);
    return cnt;
  }
  
  @Override
  public int change_read(int messageno) {
    
    int cnt = this.MessageDAO.change_read(messageno);
    return cnt;
  }
  
  @Override
  public int count_unread(int receive_memberno) {
    
    int cnt = this.MessageDAO.count_unread(receive_memberno);
    return cnt;
  }
  
  
  
  

  }
  


//package dev.mvc.recom;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//@Component("dev.mvc.recom.RecomProc")
//public class RecomProc implements RecomProcInter{
//  @Autowired
//  public RecomDAOInter recomDAO;
//  
//  @Override
//  public int create(RecomVO recomVO) {
//    
//    int cnt = this.recomDAO.create(recomVO);
//    return cnt;
//  }
//  
//}
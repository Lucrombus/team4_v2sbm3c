package dev.mvc.good;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;


@Controller
public class GoodCont{
//  @Autowired
//  @Qualifier("dev.mvc.good.GoodProc")
//  private GoodProcInter goodProc;
  
  public GoodCont() {
    System.out.println("-> GoodCont created");
  }
}

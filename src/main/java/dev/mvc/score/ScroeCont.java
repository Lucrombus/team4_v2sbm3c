package dev.mvc.score;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;


@Controller
public class ScroeCont{
//  @Autowired
//  @Qualifier("dev.mvc.good.GoodProc")
//  private GoodProcInter goodProc;
  
  public ScroeCont() {
    System.out.println("-> ScoreCont created");
  }
}

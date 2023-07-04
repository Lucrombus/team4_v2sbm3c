package dev.mvc.team4;

import java.util.HashMap;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import dev.mvc.st.StProcInter;
import dev.mvc.st.StVO;

@SpringBootTest
class Team4V2sbm3cApplicationTests {
  @Autowired
  @Qualifier("dev.mvc.st.StProc") // 할당되는 Class 객체의 이름
  private StProcInter stProc = null;
  
//  @Test
//  public void testExp_y() throws Exception {
//
//      StVO stVO = this.stProc.exp_y();
//      System.out.println("-> experience: " + stVO.getExperience());
//      System.out.println("-> percent: " + stVO.getPercent());   
//  }
//
//  @Test
//  public void testExp_n() throws Exception {
//
//      StVO stVO = this.stProc.exp_n();
//      System.out.println("-> experience: " + stVO.getExperience());
//      System.out.println("-> percent: " + stVO.getPercent());   
//  }
//  
//  @Test
//  public void testGender_m() throws Exception {
//
//      StVO stVO = this.stProc.gender_m();
//      System.out.println("-> gender: " + stVO.getGender());
//      System.out.println("-> percent: " + stVO.getPercent());   
//  }
//  
//  @Test
//  public void testGender_w() throws Exception {
//
//      StVO stVO = this.stProc.gender_w();
//      System.out.println("-> gender: " + stVO.getGender());
//      System.out.println("-> percent: " + stVO.getPercent());   
//  }
  
  @Test
  public void testAge_10() throws Exception {
  
      StVO stVO = this.stProc.age_10();
      System.out.println("-> age: " + stVO.getAge());
      System.out.println("-> percent: " + stVO.getPercent());   
  }
  
  @Test
  public void testAge_20() throws Exception {
  
      StVO stVO = this.stProc.age_20();
      System.out.println("-> age: " + stVO.getAge());
      System.out.println("-> percent: " + stVO.getPercent());   
  }
  
  @Test
  public void testAge_30() throws Exception {
  
      StVO stVO = this.stProc.age_30();
      System.out.println("-> age: " + stVO.getAge());
      System.out.println("-> percent: " + stVO.getPercent());   
  }
  
  @Test
  public void testAge_40() throws Exception {
  
      StVO stVO = this.stProc.age_40();
      System.out.println("-> age: " + stVO.getAge());
      System.out.println("-> percent: " + stVO.getPercent());   
  }
  
  @Test
  public void testAge_50() throws Exception {
  
      StVO stVO = this.stProc.age_50();
      System.out.println("-> age: " + stVO.getAge());
      System.out.println("-> percent: " + stVO.getPercent());   
  }
  
  @Test
  public void testAge_etc() throws Exception {
  
      StVO stVO = this.stProc.age_etc();
      System.out.println("-> age: " + stVO.getAge());
      System.out.println("-> percent: " + stVO.getPercent());   
  }

  
	@Test
	void contextLoads() {
	}

}

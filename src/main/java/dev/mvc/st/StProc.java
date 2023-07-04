package dev.mvc.st;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.st.StProc")
public class StProc implements StProcInter {
  @Autowired
  private StDAOInter stDAO;
  
  @Override
  public StVO exp_y() {
    StVO stVO = this.stDAO.exp_y();
    return stVO;
  }
  
  @Override
  public StVO exp_n() {
    StVO stVO = this.stDAO.exp_n();
    return stVO;
  }

  @Override
  public StVO gender_m() {
    StVO stVO = this.stDAO.gender_m();
    return stVO;
  }
  
  @Override
  public StVO gender_w() {
    StVO stVO = this.stDAO.gender_w();
    return stVO;
  }

  @Override
  public StVO age_10() {
    StVO stVO = this.stDAO.age_10();
    return stVO;
  }

  @Override
  public StVO age_20() {
    StVO stVO = this.stDAO.age_20();
    return stVO;
  }

  @Override
  public StVO age_30() {
    StVO stVO = this.stDAO.age_30();
    return stVO;
  }

  @Override
  public StVO age_40() {
    StVO stVO = this.stDAO.age_40();
    return stVO;
  }

  @Override
  public StVO age_50() {
    StVO stVO = this.stDAO.age_50();
    return stVO;
  }

  @Override
  public StVO age_etc() {
    StVO stVO = this.stDAO.age_etc();
    return stVO;
  }


  
}


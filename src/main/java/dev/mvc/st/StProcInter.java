package dev.mvc.st;

import java.util.HashMap;

public interface StProcInter{
  
  /**
   * 경력있음
   * @param stVO
   * @return
   */
  public StVO exp_y();
  
  /**
   * 경력없음
   * @param stVO
   * @return
   */
  public StVO exp_n();
  
  /**
   * 성별남자
   * @param stVO
   * @return
   */
  public StVO gender_m();
  
  /**
   * 성별여자
   * @param stVO
   * @return
   */
  public StVO gender_w();
  
  /**
   * 10대
   * @param stvo
   * @return
   */
  public StVO age_10();
  
  /**
   * 20대
   * @param stvo
   * @return
   */
  public StVO age_20();
  
  /**
   * 30대
   * @param stvo
   * @return
   */
  public StVO age_30();
  
  /**
   * 40대
   * @param stvo
   * @return
   */
  public StVO age_40();
  
  /**
   * 50대
   * @param stvo
   * @return
   */
  public StVO age_50();
  
  /**
   * 60대 이상
   * @param stvo
   * @return
   */
  public StVO age_etc();
}
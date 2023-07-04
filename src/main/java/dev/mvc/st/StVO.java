package dev.mvc.st;

/**
 * 통계
 * @author soldesk
 *
 */
public class StVO{
  /** 경력여부 */
  private String experience;
  /** 성별여부 */
  private String gender;
  /** 나이대 */
  private String age;
  /** percent */
  private double percent;

  
  

  public String getExperience() {
    return experience;
  }
  public void setExperience(String experience) {
    this.experience = experience;
  }
  public String getGender() {
    return gender;
  }
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getAge() {
    return age;
  }
  public void setAge(String age) {
    this.age = age;
  }
  
  
  
  
  public double getPercent() {
    return percent;
  }
  public void setPercent(double percent) {
    this.percent = percent;
  }
  
 
}
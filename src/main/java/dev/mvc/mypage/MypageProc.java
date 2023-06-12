package dev.mvc.mypage;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import dev.mvc.tool.Tool;

@Component("dev.mvc.mypage.MypageProc")
public class MypageProc implements MypageProcInter {
  @Autowired
  private MypageDAOInter mypageDAO;
  
  @Override
  public int create_like_guin(MypageVO mypageVO) {
    int cnt = this.mypageDAO.create_like_guin(mypageVO);
    return cnt;
  }
  
  @Override
  public int create_like_gugic(MypageVO mypageVO) {
    int cnt = this.mypageDAO.create_like_gugic(mypageVO);
    return cnt;
  }
  
  @Override
  public ArrayList<MypageVO> list_like_guin() {
    ArrayList<MypageVO> list = this.mypageDAO.list_like_guin();
    
    // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
    for (MypageVO mypageVO : list) {
      String title = mypageVO.getTitle_like_guin();
      String detail = mypageVO.getDetail_like_guin();
      
      title = Tool.convertChar(title);  // 특수 문자 처리
      detail = Tool.convertChar(detail); 
      
      mypageVO.setTitle_like_guin(title);
      mypageVO.setDetail_like_guin(detail);  

    }
    
    return list;
  }
  
  @Override
  public ArrayList<MypageVO> list_like_gugic() {
    ArrayList<MypageVO> list = this.mypageDAO.list_like_gugic();
    
    // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
    for (MypageVO mypageVO : list) {
      String title = mypageVO.getTitle_like_gugic();
      String detail = mypageVO.getDetail_like_gugic();
      
      title = Tool.convertChar(title);  // 특수 문자 처리
      detail = Tool.convertChar(detail); 
      
      mypageVO.setTitle_like_gugic(title);
      mypageVO.setDetail_like_gugic(detail);  

    }
    
    return list;
  }
  
  /**
   * 관심 구인 조회
   */
  @Override
  public MypageVO read_like_guin(int like_guinno) {
    MypageVO mypageVO = this.mypageDAO.read_like_guin(like_guinno);
    return mypageVO;
  }
  
  /**
   * 관심 구직 조회
   */
  @Override
  public MypageVO read_like_gugic(int like_gugicno) {
    MypageVO mypageVO = this.mypageDAO.read_like_gugic(like_gugicno);
    return mypageVO;
  }
  
  /**
   * 관심 구인 삭제
   */
  @Override
  public int delete_like_guin(int like_guinno) {
    int cnt = this.mypageDAO.delete_like_guin(like_guinno);
    return cnt;
  }  
  
  /**
   * 관심 구직 삭제
   */
  @Override
  public int delete_like_gugic(int like_gugicno) {
    int cnt = this.mypageDAO.delete_like_gugic(like_gugicno);
    return cnt;
  }
  
}

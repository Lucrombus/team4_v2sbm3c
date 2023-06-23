package dev.mvc.mypage;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.member.MemberDAOInter;
import dev.mvc.tool.Tool;

@Component("dev.mvc.mypage.MypageProc")
public class MypageProc implements MypageProcInter {
  @Autowired
  private MypageDAOInter mypageDAO;
  
  @Override
  public int myinfo(MypageVO mypageVO) {
    int cnt = this.mypageDAO.myinfo(mypageVO);
    return cnt;
  }
  
  @Override
  public MypageVO mypage_main(int memberno) {
    MypageVO mypageVO = this.mypageDAO.mypage_main(memberno);
    return mypageVO;
  }
  
  @Override
  public int create_like_guin(MypageVO mypageVO) {
    int cnt = this.mypageDAO.create_like_guin(mypageVO);
    return cnt;
  }
  
  @Override
  public int create_like_gugik(MypageVO mypageVO) {
    int cnt = this.mypageDAO.create_like_gugik(mypageVO);
    return cnt;
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
  public MypageVO read_like_gugik(int like_gugikno) {
    MypageVO mypageVO = this.mypageDAO.read_like_gugik(like_gugikno);
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
  public int delete_like_gugik(int like_gugikno) {
    int cnt = this.mypageDAO.delete_like_gugik(like_gugikno);
    return cnt;
  }
  
  @Override
  public MypageVO report(int reportno) {
    MypageVO mypageVO = this.mypageDAO.report(reportno);
    return mypageVO;
  }
}

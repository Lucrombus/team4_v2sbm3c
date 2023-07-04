<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="dev.mvc.jobcate.JobcateVO"%>
<%@ page import="dev.mvc.member.MemberVO"%>

<script type="text/javascript">
function recommend() {
      var url = 'http://localhost:8000/ais/recommend_form/?memberno=${sessionScope.memberno }';
      var win = window.open(url, '공지 사항', 'width=1300px, height=850px');
      
      var x = (screen.width - 1300) / 2;
      var y = (screen.height - 850) / 2;
      
      win.moveTo(x, y); // 화면 중앙으로 이동
}
</script>

<DIV class='container_top'>
    <!-- 헤더 start -->
    <div class="header">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
              <div class='top_left'>
                 <a class="navbar-brand" href="/">
                 <img src="/images/logo.png" alt="" width="200" height="75" class="d-inline-block align-text-top"></a>
      
                 <button class="navbar-toggler" type="button"
                     data-toggle="collapse" data-target="#navbarCollapse"
                     aria-controls="navbarCollapse" aria-expanded="false"
                     aria-label="Toggle Navigation">
                     <span class="navbar-toggler-icon"></span>
                 </button>
               </div>
                 <div class='top_right'>
                   <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="menu">
                     <li>
                       <a href="/notice/list_all_search_paging.do?now_page=1">공지사항</a>
                       <ul class="submenu">
                        <li><a href="/event/list_all_search_paging.do?now_page=1">이벤트</a>
                       </ul>
                     </li>
                     <li>
                      <%-- 구인 서브 메뉴 --%>
                      <a href="/guin_c/list_by_jobcateno_search_paging.do?jobcateno=0&now_page=1">구인</a>
                      <ul class="submenu">
                          <c:forEach var="jobcateVO" items="${list}">
                              <c:set var="jobcateno"
                                  value="${jobcateVO.jobcateno }" />
                              <c:set var="name"
                                  value="${jobcateVO.name }" />
                              <c:set var="visible"
                                  value="${jobcateVO.visible }" />
                              <c:if
                                  test="${jobcateVO.visible.equals('Y') }">
                                <li>
                                  <a href="/guin_c/list_by_jobcateno_search_paging.do?jobcateno=${jobcateno }&now_page=1">${name }</a>
                                </li>
                              </c:if>
   
                          </c:forEach>
   
                      </ul>
                     </li>
         
                     <li>
                      <%-- 커뮤니티 서브 메뉴 --%>
                      <a href="/contents/list_by_boardno_search_paging.do?boardno=0&now_page=1">커뮤니티</a>
                      <ul class="submenu">
                       <c:forEach var="boardVO"
                           items="${list_board}">
                           <c:set var="boardno"
                               value="${boardVO.boardno }" />
                           <c:set var="name"
                               value="${boardVO.name }" />
                           <c:set var="visible"
                               value="${boardVO.visible }" />
                           <c:if
                               test="${boardVO.visible.equals('Y') }">
                             <li>
                               <a href="/contents/list_by_boardno_search_paging.do?boardno=${boardno }&now_page=1">${name }</a>
                             </li>
                           </c:if>
                       </c:forEach>
                      </ul>
                     </li>
      
                     <c:if test="${sessionScope.id != null}">
                       <li><a href="#">${sessionScope.id } ${sessionScope.rankno == 1 ? "(관리자)" : ""}</a>
                         <ul class="submenu">
                           <li>
                             <a href='/message/list_receive.do'>쪽지
                               <c:if test="${unread_cnt > 0 }">(${unread_cnt }) <img src='/images/new_mail.png'  title="관리자" class="icon">
                               </c:if>
                             </a>
                           </li>
                           <li><a href="javascript: recommend();">관심분야 등록하고 추천받기</a></li>
                           <li><a href="/mypage/mypage_main.do?memberno=${sessionScope.memberno }">마이페이지</a></li>
                           <li><a href="/member/read.do?memberno=${sessionScope.memberno }">가입정보 수정</a></li>
                           <li><a href="/member/passwd_update.do?memberno=${sessionScope.memberno } ">비밀번호 변경</a></li>
                           <li><a href='/member/logout.do'>로그아웃</a></li>
                           <li><a href="/member/delete_member.do?memberno=${sessionScope.memberno }">회원 탈퇴</a></li>
                         </ul>
                       </li>
                     </c:if>
      
                     <c:if test="${sessionScope.id == null}">
                       <li>
                           <%-- 회원 서브 메뉴 --%>
                        <a href="#">회원</a>
                         <ul class="submenu">
                           <li><a href="/member/login.do">로그인</a></li>
                           <li><a href="/member/create.do">개인 회원 가입</a></li>
                           <li><a href="/member/enterprise_create.do">기업회원 가입</a></li>
                           <li><a href="#">아이디 찾기</a></li>
                           <li><a href="#">비밀번호 찾기</a></li>
                         </ul>
                       </li>
                     </c:if>
                     <c:if test="${sessionScope.rankno == 1}">
                       <li>
                           <%-- 관리자 로그인 확인 필요--%>
                         <a href="#">카테고리 관리</a>
                         <ul class="submenu">
                           <li><a href="/jobcate/list_all.do">구인 카테고리</a></li>
                           <li><a href="/board/list_all.do">커뮤니티 카테고리</a></li>
                         </ul>
                       </li>
                     </c:if>
                     <c:if test="${sessionScope.rankno == 1}">
                       <li>
                         <%-- 관리자 로그인 확인 필요--%>
                         <a href="#">회원 관리</a>
                         <ul class="submenu">
                            <li><a href="/rank/list_all.do">등급 목록</a></li>
                           <li><a href="/member/list.do">회원 목록</a></li>
                             <li><a href="/inquiry/list_all.do">문의 목록</a></li>
                             <li><a href="/answer/list_all.do">답변 목록</a></li>
                             <li><a href="/report_all/list_all.do">신고 목록</a></li>
                         </ul>
                       </li>
                     </c:if>
                    </ul>
                   </div>
                 </div>
        </nav>
      </div>


</div>
<!-- 헤더 end -->

<%-- 내용 --%>
<DIV class='content'>
    <div style='clear: both; height: 50px;'></div>
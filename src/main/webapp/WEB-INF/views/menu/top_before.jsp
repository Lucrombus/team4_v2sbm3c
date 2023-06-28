<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="dev.mvc.jobcate.JobcateVO"%>
<%@ page import="dev.mvc.member.MemberVO"%>

<script type="text/javascript">
function recommend() {
      var url = 'http://43.201.72.175:8000/ais/recommend_form/?memberno=${sessionScope.memberno }';
      var win = window.open(url, '공지 사항', 'width=1300px, height=850px');
      
      var x = (screen.width - 1300) / 2;
      var y = (screen.height - 850) / 2;
      
      win.moveTo(x, y); // 화면 중앙으로 이동
}
</script>

<DIV class='container_main'>
    <!-- 헤더 start -->
    <div class="header">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="/">
            <img src="/images/logo.png" alt="" width="200" height="75" class="d-inline-block align-text-top"></a>

            <button class="navbar-toggler" type="button"
                data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false"
                aria-label="Toggle Navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link"
                        href="/notice/list_all_search_paging.do?now_page=1">공지사항</a>
                    </li>
                    <li class="nav-item dropdown">
                        <%-- 구인 서브 메뉴 --%> <a
                        class="nav-link dropdown-toggle"
                        data-toggle="dropdown" href="#">구인</a>
                        <div class="dropdown-menu">
                            <c:forEach var="jobcateVO" items="${list}">
                                <c:set var="jobcateno"
                                    value="${jobcateVO.jobcateno }" />
                                <c:set var="name"
                                    value="${jobcateVO.name }" />
                                <c:set var="visible"
                                    value="${jobcateVO.visible }" />
                                <c:if
                                    test="${jobcateVO.visible.equals('Y') }">
                                    <a class="dropdown-item"
                                        href="/guin_c/list_by_jobcateno_search_paging.do?jobcateno=${jobcateno }&now_page=1">${name }</a>
                                </c:if>

                            </c:forEach>

                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <%-- 커뮤니티 서브 메뉴 --%> <a
                        class="nav-link dropdown-toggle"
                        data-toggle="dropdown" href="#">커뮤니티</a>
                        <div class="dropdown-menu">
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
                                    <a class="dropdown-item"
                                        href="/contents/list_by_boardno_search_paging.do?boardno=${boardno }&now_page=1">${name }</a>
                                </c:if>

                            </c:forEach>

                        </div>
                    </li>

                    <c:if test="${sessionScope.id != null}">
                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle"
                            data-toggle="dropdown" href="#">${sessionScope.id }
                                ${sessionScope.memberno == 1 ? "(관리자)" : ""}</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item"
                                    href='/message/list_receive.do'>쪽지
                                    <c:if test="${unread_cnt > 0 }">(${unread_cnt }) <img
                                            src='/images/new_mail.png'
                                            title="관리자" class="icon">
                                    </c:if>
                                </a> <a class="dropdown-item" href="javascript: recommend();">관심분야
                                    등록하고 추천받기</a> <a class="dropdown-item"
                                    href="/mypage/mypage_main.do?memberno=${sessionScope.memberno }">마이페이지</a>
                                <a class="dropdown-item"
                                    href="/member/read.do?memberno=${sessionScope.memberno }">가입정보
                                    수정</a> <a class="dropdown-item"
                                    href="/member/passwd_update.do?memberno=${sessionScope.memberno } ">비밀번호
                                    변경</a> <a class="dropdown-item"
                                    href='/member/logout.do'>로그아웃</a> <a
                                    class="dropdown-item"
                                    href="/member/delete_member.do?memberno=${sessionScope.memberno }">회원
                                    탈퇴</a>
                            </div></li>
                    </c:if>

                    <c:if test="${sessionScope.id == null}">
                        <li class="nav-item dropdown">
                            <%-- 회원 서브 메뉴 --%> <a
                            class="nav-link dropdown-toggle"
                            data-toggle="dropdown" href="#">회원</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item"
                                    href="/member/login.do">로그인</a> <a
                                    class="dropdown-item"
                                    href="/member/create.do">개인 회원
                                    가입</a> <a class="dropdown-item"
                                    href="/member/enterprise_create.do">기업
                                    회원 가입</a> <a class="dropdown-item"
                                    href="#">아이디 찾기</a> <a
                                    class="dropdown-item" href="#">비밀번호
                                    찾기</a>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.rankno == 1}">
                        <li class="nav-item dropdown">
                            <%-- 관리자 로그인 확인 필요--%> <a
                            class="nav-link dropdown-toggle"
                            data-toggle="dropdown" href="#">카테고리 관리</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item"
                                    href="/jobcate/list_all.do">구인
                                    카테고리</a> <a class="dropdown-item"
                                    href="/board/list_all.do">커뮤니티
                                    카테고리</a>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.rankno == 1}">
                        <li class="nav-item dropdown">
                            <%-- 관리자 로그인 확인 필요--%> <a
                            class="nav-link dropdown-toggle"
                            data-toggle="dropdown" href="#">회원 관리</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item"
                                    href="/member/list.do">회원 목록</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </div>


</div>
<!-- 헤더 end -->

<%-- 내용 --%>
<DIV class='content'>
    <div style='clear: both; height: 50px;'></div>
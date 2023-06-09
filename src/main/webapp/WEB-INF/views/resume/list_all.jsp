<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
<A href="./list_by_memberno_search_paging.do?memberno=${sessionScope.memberno }&now_page=1" class='title_link'>내 이력서 </a>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 회원 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.rankno == 2}">
      <A href="./create.do">등록</A>
      <span class='menu_divide' >│</span>
    </c:if>

    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 65%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 15%;"></col>
    </colgroup>

    <thead>
      <tr >
        <th style='text-align: center;'>번호</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>희망업종</th>
      </tr>
    
    </thead>
    
    <tbody>
      <c:forEach var="resumeVO" items="${list }">
        <c:set var="title" value="${resumeVO.title }" />
        <c:set var="intro" value="${resumeVO.intro }" />
        <c:set var="resumeno" value="${resumeVO.resumeno }" />
        <c:set var="rdate" value="${resumeVO.rdate }" />
        <c:set var="memberno" value="${resumeVO.memberno }" />
        <c:set var="wantjob" value="${resumeVO.wantjob }" />

        
        <tr style="height:50px;">
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${resumeno}
          </td>
          <td style='vertical-align: middle;'>
            <a href="./read.do?resumeno=${resumeno}"><strong>${title}</strong>  
            </a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
          ${rdate }
          </td>
           <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
          ${wantjob }
          </td>
        </tr>
        
      </c:forEach>


    </tbody>
  </table>
   <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
  
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
  <c:import url="/menu/top.do" />
  <DIV class='title_line'>마이페이지</DIV>
  <DIV class='message'>
    <button type='button' onclick="location.href='/mypage/myinfo.do'" class="btn btn-info">내 정보</button>
    <br><br>
    <button type='button' onclick="location.href='/like_guin/list_all.do?memberno=${memberno}'" class="btn btn-info">나의 관심 구인 목록</button>
    <br><br>
    <button type='button' onclick="location.href='/mypage/report.do'" class="btn btn-info">내 신고 내역</button>
    <br><br>
    <c:if test="${sessionScope.rankno == 1}">
        <button type='button' onclick="location.href='/inquiry/list_all.do'" class="btn btn-info">문의</button>
        <br><br>
    </c:if>
    <c:if test="${sessionScope.rankno == 2 || sessionScope.rankno == 3}">
        <button type='button' onclick="location.href='/inquiry/list_by_memberno.do?memberno=${memberno}'" class="btn btn-info">문의</button>
        <br><br>
    </c:if>
    <button type='button' onclick="location.href='/resume/list_by_memberno_search_paging.do?memberno=${memberno}'" class="btn btn-info">내 이력서</button>     
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
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
  <DIV class='myinfo_container'>
    <DIV class='myinfo_box'>
     <a href="/mypage/myinfo.do"><IMG src="/mypage/images/myinfo.png" style='width: 40%; margin-bottom: 10px;'></a><br>
	    <button type='button' onclick="location.href='/mypage/myinfo.do'" class="btn btn-secondary">내 정보</button>
	  </DIV>
	  <DIV class='myinfo_box'>
       <a href="/like_guin/list_all.do?memberno=${memberno}"><IMG src="/mypage/images/like_guin.png" style='width: 40%; margin-bottom: 10px;'></a><br>
	    <button type='button' onclick="location.href='/like_guin/list_all.do?memberno=${memberno}'" class="btn btn-secondary">나의 관심 구인 목록</button>
	  </DIV>
	  <DIV class='myinfo_box'>
	    <a href="/mypage/report.do"><IMG src="/mypage/images/report.png" style='width: 40%; margin-bottom: 10px;'></a><br>
	    <button type='button' onclick="location.href='/mypage/report.do'" class="btn btn-secondary">내 신고 내역</button>
	  </DIV>
  </DIV>
  <br><br>
  <DIV class='myinfo_container' style='width:33%;'>
	  <DIV class='myinfo_box'>
	    <c:if test="${sessionScope.rankno == 1}">
	      <a href="/inquiry/list_all.do"><IMG src="/mypage/images/inquiry.png" style='width: 40%; margin-bottom: 10px;'></a><br>
	      <button type='button' onclick="location.href='/inquiry/list_all.do'" class="btn btn-secondary">문의</button>
	    </c:if>
		  <c:if test="${sessionScope.rankno == 2 || sessionScope.rankno == 3}">
		    <a href="/inquiry/list_by_memberno.do?memberno=${memberno}"><IMG src="/mypage/images/inquiry.png" style='width: 40%; margin-bottom: 10px;'></a><br>
	      <button type='button' onclick="location.href='/inquiry/list_by_memberno.do?memberno=${memberno}'" class="btn btn-secondary">문의</button>
	    </c:if>
	  </DIV>
	  <DIV class='myinfo_box'>
	    <a href="/resume/list_all.do?memberno=${memberno}"><IMG src="/mypage/images/resume.png" style='width: 40%; margin-bottom: 10px;'></a><br>
	    <button type='button' onclick="location.href='/resume/list_all.do?memberno=${memberno}'" class="btn btn-secondary">내 이력서</button>
	  </DIV>
	</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
</head>
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />
  <DIV class='main_container'>
    <DIV class='index_left'>
	    <DIV class='main_box'>
		    <IMG src='/images/index_cafe.jpg' style='width: 70%;'>
		  </DIV>
		</DIV>
		<DIV class='index_right'>
		  <DIV class='main_box' style='border: 3px solid rgba(80, 40, 0, 0.7); margin-top:30px; width:80%;'>
		    <a>알바 구하기 힘들 때!</a><br><br>
		    <a>여러 알바 비교하고 싶을 때!</a><br><br>
		    <a>쉬운 알바 찾아보고 싶을 때!</a><br><br>
		    <a>단기 알바 지원하고 싶을 때!</a><br><br>
		    <a>알바 찾느라 지친 당신을 위한!</a><br><br><br>
		    <a>알바지옥몬</a>
		    <IMG src='/images/hellmon.png' style='width: 5%;'>
		  </DIV>
		</DIV>
  </DIV>
  <p>
  <DIV style='width: 70%; margin: 10px auto;'>
     <h2>왕눈이 님을 위한 추천 상품</h2>
     <c:import url="/guin_c/recommend_wage.do" />
   </DIV>
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>


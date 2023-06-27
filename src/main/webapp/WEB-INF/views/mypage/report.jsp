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

<DIV class='title_line'>내 신고 내역</DIV>
  <DIV class='myinfo_container' style='width:33%;'>
    <DIV class='myinfo_box'>
      <a href="/report_m/list_all_by_memberno.do"><IMG src="/mypage/images/report_m.png" style='width: 40%; margin-bottom: 10px;'></a><br>
      <button type='button' onclick="location.href='/report_m/list_all_by_memberno.do'" class="btn btn-secondary">회원 신고 내역</button>
    </DIV>
    <DIV class='myinfo_box'>
      <a href="/report_c/list_all_by_memberno.do"><IMG src="/mypage/images/report_c.png" style='width: 40%; margin-bottom: 10px;'></a><br>
      <button type='button' onclick="location.href='/report_c/list_all_by_memberno.do'" class="btn btn-secondary">게시글 신고 내역</button>
    </DIV>
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
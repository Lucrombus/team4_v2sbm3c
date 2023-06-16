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

  <DIV style='width: 100%; margin: 30px auto; text-align: center;'>
    <%-- /static/images/index01.png --%>
    <IMG src='/images/index01.png' style='width: 7%;'>
  </DIV>
  
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='text-align: center;'>
      <jsp:include page="./menu/notice.jsp" flush='false' />
    </DIV> 
    
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>


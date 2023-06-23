<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />

 <c:forEach var="like_guinVO" items="${list }">
    <c:set var="like_guinno" value ="${like_guinVO.like_guinno}" />
    <c:set var="memberno" value ="${like_guinVO.memberno}" />
    <c:set var="guin_cno" value ="${like_guinVO.guin_cno}" />
  </c:forEach> 
 
<DIV class='title_line'>
  관심 구인 목록
</DIV>
<tr style="height: 112px;">
  <td style='vertical-align: middle; text-align: center;'>
    ${memberno }
  </td>  
  <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
    ${like_guinno }
  </td> 
  <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
    ${guin_cno }
  </td> 
</tr>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바 지옥몬 0.1</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
  전체 답변 목록
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 15%;"></col>
    </colgroup>

    <thead>
      <tr>
        <th style='text-align: center;'>문의 번호</th>
        <th style='text-align: center;'>답변</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>작성자</th>
      </tr>
    
    </thead>
    
    <tbody>
      <c:forEach var="answerVO" items="${list }">
        <c:set var="content" value="${answerVO.content }" />
        <c:set var="rdate" value="${answerVO.rdate }" />
        <c:set var="answerno" value="${answerVO.answerno }" />
        <c:set var="memberno" value="${answerVO.memberno }" />
        <c:set var="inquiryno" value="${answerVO.inquiryno }" />
        
        <tr style="height: 112px;">
          <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
            ${inquiryno}
          </td>
          <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
            <a href="./read.do?answerno=${answerno}"><strong>${content}</strong>  
            </a> 
          </td>  
          <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
            ${rdate.substring(0,10) }
          </td> 
          <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
            ${f.apply(memberno) }
          </td> 
        </tr>
        
      </c:forEach>

    </tbody>
  </table>
</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
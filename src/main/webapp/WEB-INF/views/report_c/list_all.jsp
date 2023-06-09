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

 
<DIV class='title_line'>
<A href="./list_all.do?&now_page=1" class='title_link'>게시글 신고 내역 </a>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-hover" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 5%;"></col>
      <col style="width: 10%;"></col>

    </colgroup>

    <thead>
      <tr >
        <th style='text-align: center;'>신고번호</th>
        <th style='text-align: center;'>신고된 글 고유번호</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>신고자</th>
        <th style='text-align: center;'>처리여부</th>
      </tr>
    
    </thead>
    
    
    <tbody>
    
      <c:forEach var="report_cVO" items="${list }">
        <c:set var="reason" value="${report_cVO.reason }" />
        <c:set var="contentsno" value="${report_cVO.contentsno }" />
        <c:set var="reportno" value="${report_cVO.reportno }" />
        <c:set var="rdate" value="${report_cVO.rdate }" />
        <c:set var="memberno" value="${report_cVO.memberno }" />
        <c:set var="done" value="${report_cVO.done }" />



        
        <tr style="height:50px;" onmouseover="this.style.cursor='pointer'" onclick="window.location='/report_c/read.do?reportno=${reportno}'">
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${reportno}
          </td>
          <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
            <strong>${contentsno }</strong>
          </td>
          <td style='vertical-align: middle; '>
            <strong>${reason}</strong>
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            ${rdate }
          </td>
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
            ${f.apply(memberno) }
          </td>
          <c:if test="${report_cVO.done == 'Y' }">
            <td style='vertical-align: middle; text-align: center; font-size: 17px; color: Green;'>처리 완료</td>
          </c:if>
          <c:if test="${report_cVO.done == 'N' }">
            <td style='vertical-align: middle; text-align: center; font-size: 17px; color: Red;'>대기중</td>
          </c:if>
        </tr>
        
        
      </c:forEach>

     
    </tbody>
  </table>
  

</DIV>

 

</body>
 
</html>
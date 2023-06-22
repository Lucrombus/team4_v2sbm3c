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
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
  내 문의 목록
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?memberno=${sessionScope.memberno}">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 80%;"></col>
      <col style="width: 20%;"></col>
    </colgroup>

    <thead>
      <tr>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성자</th>
      </tr>
    
    </thead>
    
    <tbody>
      <c:forEach var="inquiryVO" items="${list }">
        <c:set var="inquiryno" value="${inquiryVO.inquiryno }" />
        <c:set var="memberno" value="${inquiryVO.memberno }" />
        <c:set var="inquiryTitle" value="${inquiryVO.inquiryTitle }" />
        <c:set var="inquiryReason" value="${inquiryVO.inquiryReason }" />
        <c:set var="answer" value="${inquiryVO.answer }" />
        
        <tr style="height: 112px;">
          <td style='vertical-align: middle; text-align: center;'>
            <a href="./read.do?inquiryno=${inquiryno}&now_page=${param.now_page}"><strong>${inquiryTitle}</strong>  
            </a> 
          </td>  
          <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
            ${memberVO.id }
          </td> 
        </tr>
        
      </c:forEach>

    </tbody>
  </table>
</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
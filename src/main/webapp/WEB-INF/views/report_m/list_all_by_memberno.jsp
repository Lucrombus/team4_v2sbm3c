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
<A href="./list_all_by_memberno.do?memberno=${sessionScope.memberno }&now_page=1" class='title_link'>내 신고 내역 </a>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <c:if test="${sessionScope.id != null}">
     <A href="./create.do">등록</A>
     <span class='menu_divide' >│</span>
    </c:if>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 5%;"></col>

    </colgroup>

    <thead>
      <tr >
        <th style='text-align: center;'>신고번호</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>신고된 회원번호</th>
        <th style='text-align: center;'>신고자</th>

      </tr>
    
    </thead>
    
    <tbody>
      <c:forEach var="report_mVO" items="${list }"> <!-- 값 불러오기!!!!!!!!!!!! -->
        <c:set var="reportno" value="${report_mVO.reportno }" />
        <c:set var="memberno" value="${report_mVO.memberno }" />
        <c:set var="target_mno" value="${report_mVO.target_mno }" />
        <c:set var="title" value="${report_mVO.title }" />
        <c:set var="reason" value="${report_mVO.reason }" />
        <c:set var="rdate" value="${report_mVO.rdate }" />




        
        <tr style="height:50px;">
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${reportno}
          </td>
          <td style='vertical-align: middle;  font-weight:bold;'>
            <a href="./read.do?reportno=${reportno}"><strong>${title }</strong></a> 
          </td>
          <td style='vertical-align: middle; text-align: center;'>
          ${rdate }
          </td>
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${target_mno }
          </td>
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${id }
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
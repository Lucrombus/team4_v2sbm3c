<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="reportno" value="${report_cVO.reportno }" />
<c:set var="memberno" value="${report_cVO.memberno }" />        
<c:set var="contentsno" value="${report_cVO.contentsno }" />        
<c:set var="reason" value="${report_cVO.reason }" />        
<c:set var="rdate" value="${report_cVO.rdate.substring(0, 16) }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬0.1</title>
 
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
<A href="./list_all_by_memberno.do?memberno=${sessionScope.memberno }&now_page=1" class='title_link'>신고 내역 </a> > 
<A href="./read.do?reportno=${reportno }" class='title_link'>${title }</A>${reason }</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.id != null}">
      <A href="./create.do">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./delete.do?reportno=${reportno}">삭제</A>  
      <span class='menu_divide' >│</span>
    </c:if>

    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        
        <div style="font-size: 1em;">신고번호 : ${reportno }</div><br>
        <div style="font-size: 1em;">신고자 번호 : ${memberno }</div><br>
        <div style="font-size: 1em;">컨텐츠 번호 : ${contentsno }</div><br>
        <div style="font-size: 1em;">신고 사유 : ${reason }</div><br>
        <div style="font-size: 1em;">신고 날짜 : ${rdate }</div><br>
      </li>
      
      <div class='menu_line'></div>
      
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }"> <%-- ServletRegister.java: registrationBean.addUrlMappings("/download"); --%>
            첨부 파일: <a href='/download?dir=/resume/storage&filename=${file1saved}&downname=${file1}'>${file1}</a> (${size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>



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
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_cateno.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <A href="/inquiry/create.do?inquiryno=${param.inquiryno}">등록</A>
    <c:if test="${sessionScope.rankno == 1}">
      
      <span class='menu_divide' >│</span>
      <A href="./update.do?answerno=${param.answerno}">답변 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./delete.do?answerno=${answerno}">삭제</A>  
    </c:if>
    <span class='menu_divide' >│</span>

    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">
          <span style="font-size: 1.5em; font-weight: bold;">제목 - ${inquiryVO.inquiryTitle }</span><br>
          <div style="font-size: 1em;">${f.apply(inquiryVO.memberno) } / ${inquiryVO.rdate }</div><br>
          ${inquiryVO.inquiryReason }
        </DIV>
      </li>
      <br>
      
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">
          <span style="font-size: 1.5em; font-weight: bold;">답변</span><br>
          <div style="font-size: 1em;"> 
            <c:choose>
                <c:when test = "${answerVO.memberno == null}"></c:when>
                <c:when test = "${answerVO.memberno != null }">${f.apply(answerVO.memberno) } /</c:when>
            </c:choose>
            ${answerVO.rdate }</div><br>
            <c:choose>
                <c:when test = "${answerVO.content == null}">답변 미등록</c:when>
                <c:when test = "${answerVO.content != null }">${answerVO.content }</c:when>
            </c:choose>
        </DIV>
      </li>
      
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>



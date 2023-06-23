<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="inquiryno" value="${inquiryVO.inquiryno }" />
<c:set var="inquiryTitle" value="${inquiryVO.inquiryTitle }" />        
<c:set var="inquiryReason" value="${inquiryVO.inquiryReason }" />
<c:set var="memberno" value="${inquiryVO.memberno }" />
<c:set var="rdate" value="${inquiryVO.rdate }" />
 
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
 
<DIV class='title_line'><A href="./list_by_cateno.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.id != null}">
      <A href="./create.do?memberno=${memberno}">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update.do?inquiryno=${inquiryno}&now_page=${param.now_page}">문의 수정</A>
      <span class='menu_divide' >│</span>
      <A href="javascript:location.reload();">새로고침</A>
    </c:if>

  </ASIDE>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">

          <span style="font-size: 1.5em; font-weight: bold;">제목 - ${inquiryTitle }</span><br>
          <div style="font-size: 1em;">${id } / ${rdate }</div><br>
          ${inquiryReason }
        </DIV>
      </li>
      
  </fieldset>
  </DIV>
  <DIV style='text-align: center; width: 100%; float: center;'>
    <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='inquiryno' value='${inquiryno}'>
              <input type='hidden' name='memberno' value='${memberno}'>
              <br><br>
              <div style='text-align: center; margin: 10px auto;'>
                <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                <br><br>
                <button type = "submit" class="btn btn-primary">삭제 진행</button>
                <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
              </div>   
          </FORM>
     </DIV>
    
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>



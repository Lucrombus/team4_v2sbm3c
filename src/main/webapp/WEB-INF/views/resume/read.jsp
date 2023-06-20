<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="resumeno" value="${resumeVO.resumeno }" />
<c:set var="title" value="${resumeVO.title }" />        
<c:set var="file1" value="${resumeVO.file1 }" />
<c:set var="file1saved" value="${resumeVO.file1saved }" />
<c:set var="thumb1" value="${resumeVO.thumb1 }" />
<c:set var="intro" value="${resumeVO.intro }" />

<c:set var="size1_label" value="${resumeVO.size1_label }" />
<c:set var="rdate" value="${resumeVO.rdate.substring(0, 16) }" />
 
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
 
<DIV class='title_line'><A href="./list_by_cateno.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.id != null}">
      <A href="./create.do">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?noticeno=${noticeno}&now_page=${param.now_page}&word=${param.word }">글 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?noticeno=${noticeno}&now_page=${param.now_page}">파일 수정</A>  
      <span class='menu_divide' >│</span>
      <A href="./delete.do?noticeno=${noticeno}&now_page=${param.now_page}">삭제</A>  
      <span class='menu_divide' >│</span>
    </c:if>

    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <%-- /static/notice/storage/ --%>
              <img src="/notice/storage/${file1saved }" style='width: 20%; float: left; margin-top: 0.5%; margin-right: 1%;'> 
            </c:when>
            <c:otherwise> <!-- 기본 이미지 출력 -->
              <img src="/notice/images/none1.png" style='width: 20%; float: left; margin-top: 0.5%; margin-right: 1%;'> 
            </c:otherwise>
          </c:choose>

          <span style="font-size: 1.5em; font-weight: bold;">${title }</span><br>
          <div style="font-size: 1em;">이름 : ${name } / ${rdate }</div><br>
          ${content }
        </DIV>
      </li>
      
      <li class="li_none" style="clear: both;">
        <DIV style='text-decoration: none;'>
          <br>
          검색어(키워드): ${word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }"> <%-- ServletRegister.java: registrationBean.addUrlMappings("/download"); --%>
            첨부 파일: <a href='/download?dir=/notice/storage&filename=${file1saved}&downname=${file1}'>${file1}</a> (${size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>



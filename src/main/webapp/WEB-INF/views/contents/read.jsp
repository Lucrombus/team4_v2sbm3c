<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="boardno" value="${param.boardno }" />
<c:set var="title" value="${contentsVO.title }" />        
<c:set var="file1" value="${contentsVO.file1 }" />
<c:set var="file1saved" value="${contentsVO.file1saved }" />
<c:set var="content" value="${contentsVO.content }" />
<c:set var="rdate" value="${contentsVO.rdate }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="size1_label" value="${contentsVO.size1_label }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_boardno_search_paging.do?boardno=${boardno }&now_page=1" class='title_link'>${param.boardno != 0 ? boardVO.name : "전체목록" } 게시판</A> > ${contentsVO.title } </DIV>
<c:if test="${sessionScope.id != null}">
  <A href="./create.do?boardno=${param.boardno }&now_page=${param.now_page}">등록</A>
  <span class='menu_divide' >│</span>
  <A href="./update.do?boardno=${param.boardno }&contentsno=${contentsno}&now_page=${param.now_page}">수정</A>
  <span class='menu_divide' >│</span>
  <A href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page}&boardno=${boardno}">삭제</A>  
</c:if>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <A href="./list_by_boardno_search_paging.do?boardno=${param.boardno}&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>

  </ASIDE> 

  
  
  <DIV style="text-align: right; clear: both;">  
    <ASIDE class="aside_left" style="padding-bottom: 10px;">
      <span style="font-size: 1.5em; font-weight: bold;">${title }</span>
      <span class='menu_divide' >│</span> ${memberVO.id}
      <span class='menu_divide' >│</span> ${rdate }
    </ASIDE>
  
    <form name='frm' id='frm' method='get' action='./list_by_boardno_search_paging.do'>
      <input type='hidden' name='boardno' value='${param.boardno }'>
      <input type='hidden' name='now_page' value='1'>  <%-- 검색기본 시작 페이지 --%>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit' class="btn btn-secondary btn-sm">검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' class='btn btn-info btn-sm'
                     onclick="location.href='./list_by_boardno_search_paging.do?boardno=${param.boardno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
 
  <DIV class='menu_line'></DIV>
  <BR>
  <fieldset class="fieldset_basic">
  ${content }
  <BR>
  <BR>
  <BR>
  <BR>
  </fieldset>

</DIV>
<DIV style="text-align: right;">
 <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${word }
        </DIV>
      </li>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
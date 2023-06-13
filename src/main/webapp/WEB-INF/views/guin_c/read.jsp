<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="guin_cno" value="${guin_cVO.guin_cno }" />
<c:set var="jobcateno" value="${param.jobcateno }" />
<c:set var="title" value="${guin_cVO.title }" />        
<c:set var="file1" value="${guin_cVO.file1 }" />
<c:set var="file1saved" value="${guin_cVO.file1saved }" />
<c:set var="thumb1" value="${guin_cVO.thumb1 }" />
<c:set var="content" value="${guin_cVO.content }" />
<c:set var="rdate" value="${guin_cVO.rdate }" />
<c:set var="word" value="${guin_cVO.word }" />
<c:set var="map" value="${guin_cVO.map }" />
<c:set var="size1_label" value="${guin_cVO.size1_label }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_jobcateno_search_paging.do?jobcateno=${jobcateno }&now_page=1" class='title_link'>${param.jobcateno != 0 ? typeVO.name : "전체목록" } 게시판</A> > ${guin_cVO.title } </DIV>
<c:if test="${sessionScope.id != null}">
  <A href="./create.do?jobcateno=${param.jobcateno }&now_page=${param.now_page}">등록</A>
  <span class='menu_divide' >│</span>
  <A href="./update_text.do?guin_cno=${guin_cno}&now_page=${param.now_page}">수정</A>
  <span class='menu_divide' >│</span>
  <A href="./update_file.do?guin_cno=${guin_cno}&now_page=${param.now_page}">파일 수정</A>  
  <span class='menu_divide' >│</span>
  <A href="./map.do?jobcateno=${jobcateno }&guin_cno=${guin_cno}&now_page=${param.now_page}">지도</A>  
  <span class='menu_divide' >│</span>
  <A href="./youtube.do?jobcateno=${jobcateno }&guin_cno=${guin_cno}&now_page=${param.now_page}">유튜브</A>  
  <span class='menu_divide' >│</span>
  <A href="./delete.do?guin_cno=${guin_cno}&now_page=${param.now_page}&jobcateno=${jobcateno}">삭제</A>  
  <span class='menu_divide' >│</span>
</c:if>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno}&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>

  </ASIDE> 

  
  
  <DIV style="text-align: right; clear: both;">  
    <ASIDE class="aside_left" style="padding-bottom: 10px;">
      <span style="font-size: 1.5em; font-weight: bold;">${title }</span>
      <span class='menu_divide' >│</span> ${memberVO.id}
      <span class='menu_divide' >│</span> ${rdate }
    </ASIDE>
  
    <form name='frm' id='frm' method='get' action='./list_by_jobcateno_search_paging.do'>
      <input type='hidden' name='jobcateno' value='${param.jobcateno }'>
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
                     onclick="location.href='./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  

  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 50%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/guin_c/storage/ --%>
                <IMG src="/guin_c/storage/${thumb1 }" style="width: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        <DIV>
         ${content }
        </DIV>
      </li>

      <c:if test="${map.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 15px; padding-bottom: 15px;">
          <DIV style='width:640px; height: 360px; margin: 0px auto;'>
            ${map }
          </DIV>
        </li>
      </c:if> 
    </ul>
  </fieldset>

</DIV>
<DIV style="text-align: right;">
 <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${thumb1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/guin_c/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
          </c:if>
        </DIV>
      </li>  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
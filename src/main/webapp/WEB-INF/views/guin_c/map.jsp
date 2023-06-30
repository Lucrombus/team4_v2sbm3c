<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />

<DIV class='title_line'><A href="/guin_c/list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=1" class="title_link">${param.jobcateno != 0 ? jobcateVO.name : "전체목록" } 구인</A> > ${guin_cVO.title } > 지도 등록/수정/삭제</DIV>
 
<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=${param.now_page }">목록</A>    
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
   <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_jobcateno_search_paging.do'>
      <input type='hidden' name='jobcateno' value='${param.jobcateno }'>  <%-- 게시판의 구분 --%>
      <input type='hidden' name='now_page' value=1>  <%-- 검색기본 시작 페이지 --%>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%; ' class='input_word'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit' class="btn btn-secondary btn-sm">검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' class="btn btn-secondary btn-sm"
                     onclick="location.href='./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  <%--등록 폼 --%>
  <FORM name='form' method='POST' action='./map.do'>
    <input type="hidden" name="guin_cno" value="${param.guin_cno }">
    <input type="hidden" name="memberno" value="${guin_cVO.memberno }">
    <input type="hidden" name="jobcateno" value="${param.jobcateno}">
    <input type="hidden" name="now_page" value="${param.now_page }">
    
    <div>
       <label>지도 스크립트</label>
       <textarea name='map' class="form-control" rows="12" style='width: 100%;'>${guin_cVO.map }</textarea>
    </div>
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="form.map.value=''; form.submit();" class="btn btn-primary">지도삭제</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>

  <HR>
  <DIV style="text-align: center;">
      <H4>[참고] 다음 지도의 등록 방법</H4>
      <IMG src='/contents/images/map01.jpg' style='width: 60%;'><br><br>
      <IMG src='/contents/images/map02.jpg' style='width: 60%;'><br><br>
      <IMG src='/contents/images/map03.jpg' style='width: 60%;'><br><br>
      <IMG src='/contents/images/map04.jpg' style='width: 60%;'><br><br>
      <IMG src='/contents/images/map05.jpg' style='width: 60%;'><br>
  </DIV>
  
</DIV>


<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
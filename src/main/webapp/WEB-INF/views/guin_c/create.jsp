<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>${param.typeno != 0 ? typeVO.name : "전체목록" } 게시판 > 글 등록 </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right"  style="padding-bottom: 10px;">
    <A href="./list_by_typeno_search_paging.do?typeno=${param.typeno }&now_page=1">기본 목록형</A> 
    <span class='menu_divide' >│</span>   
    <A href="javascript:location.reload();">새로고침</A>

  </ASIDE>
  
  <DIV style="text-align: right; clear: both; ">  
    <form name='frm' id='frm' method='get' action='./list_by_typeno_search_paging.do'>
      <input type='hidden' name='typeno' value='${param.typeno }'>  <%-- 게시판의 구분 --%>
      <input type='hidden' name='now_page' value='${param.now_page }'>  <%-- 게시판의 구분 --%>
      
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
                     onclick="location.href='./list_by_cateno_search.do?typeno=${param.typeno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  
  
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    
    <c:choose>
    <c:when test="${param.typeno == 0}">
    <c:forEach items="${list}" var="typeVO_2">
    <input type="radio" class="btn-check" name="typeno" id="option${typeVO_2.typeno }" value=${typeVO_2.typeno } autocomplete="off"  required>
    <label class="btn btn-outline-secondary" for="option${typeVO_2.typeno }">${typeVO_2.name }</label> <%--부트스트랩 프리셋 --%>
    </c:forEach>
    </c:when>
    <c:otherwise>
    <input type="hidden" name="typeno" value="${param.typeno }">
    </c:otherwise>
    </c:choose>
    
    <input type="hidden" name="adminno" value="<%=session.getAttribute("adminno")%>">
    
    
    
 
    <div>
    <br>
       <label>제목</label>
       <input type='text' name='title' value='가을 영화' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>가을 단풍보며 멍때리기</textarea>
    </div>
    <div>
       <label>검색어</label>
       <input type='text' name='word' value='월터,벤 스틸러,크리스튼위그,휴먼,도전' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>   
    <div>
       <label>이미지</label>
       <input type='file' class="form-control" name='file1MF' id='file1MF' 
                 value='' placeholder="파일 선택">
    </div>   
    <div>
       <label>패스워드</label>
       <input type='password' name='passwd' value='1234' required="required" 
                 class="form-control" style='width: 50%;'>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_by_typeno_search_paging.do?typeno=${param.typeno}&now_page=${param.now_page }'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
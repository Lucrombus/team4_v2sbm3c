<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="guin_cno" value="${guin_cVO.guin_cno }" />
<c:set var="jobcateno" value="${guin_cVO.jobcateno }" />
<c:set var="title" value="${guin_cVO.title }" />
<c:set var="file1saved" value="${guin_cVO.file1saved.toLowerCase() }" />
<c:set var="file1" value="${guin_cVO.file1 }" />
<c:set var="thumb1" value="${guin_cVO.thumb1 }" />
<c:set var="thumb1_origin" value="${guin_cVO.thumb1_origin }" />
<c:set var="size1" value="${guin_cVO.size1 }" />
           
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
 
<DIV class='title_line'><A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=1" class='title_link'>${param.jobcateno != 0 ? jobcateVO.name : "전체목록" } 구인 </A> > 글 수정 > ${title } </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right"  style="padding-bottom: 10px;">
    <A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=1">목록</A> 
    <span class='menu_divide' >│</span>   
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
  
  <DIV style="text-align: right; clear: both; ">  
    <form name='frm' method='get' action='./list_by_jobcateno_search_paging.do'>
      <input type='hidden' name='jobcateno' value='${param.jobcateno }'>  <%-- 게시판의 구분 --%>
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
                     onclick="location.href='./list_by_cateno_search.do?jobcateno=${param.jobcateno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>

          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/guin_c/storage/${thumb1 }" style='width: 90%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 없는 경우 -->
              상품 관련 이미지가 없습니다.
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'>${title}</span>
          <c:if test="${size1 > 0 }">
            <br>삭제되는 파일: ${thumb1_origin }
          </c:if>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='guin_cno' value='${guin_cno}'>
              <input type='hidden' name='jobcateno' value='${jobcateno}'>
              <input type='hidden' name='now_page' value='${param.now_page}'>
              <br><br>
              <div style='text-align: center; margin: 10px auto;'>
                <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                <br><br>
                <button type = "submit" class="btn btn-primary">삭제 진행</button>
                <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
              </div>   
          </FORM>
        </DIV>
      </li>
     </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
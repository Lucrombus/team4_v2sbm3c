<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="resumeno" value="${resumeVO.resumeno }" />
<c:set var="title" value="${resumeVO.title }" />
<c:set var="file1" value="${resumeVO.file1 }" />
<c:set var="file1saved" value="${resumeVO.file1saved }" />
<c:set var="thumb1" value="${resumeVO.thumb1.toLowerCase() }" />
<c:set var="size1" value="${resumeVO.size1 }" />
 
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
<A href="./list_all.do?memberno=${sessionScope.memberno }&now_page=1" class='title_link'>이력서 </a> > 
<A href="./read.do?resumeno=${resumeno }" class='title_link'>${title }</A> > 파일 수정</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.id != null}">
      <A href="./create.do">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?resumeno=${resumeno}&now_page=${param.now_page}">글 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?resumeno=${resumeno}&now_page=${param.now_page}">파일 수정</A>  
      <span class='menu_divide' >│</span>
      <A href="./delete.do?resumeno=${resumeno}&now_page=${param.now_page}">삭제</A>  
      <span class='menu_divide' >│</span>
    </c:if>

    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/resume/storage/${file1saved }" style='width: 90%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 없음 -->
               <IMG src="/resume/images/none1.png" style="width: 90%;"> 
            </c:otherwise>
          </c:choose>
          
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'>${title}</span>
          <br>
          <FORM name='frm' method='POST' action='./update_file.do' enctype="multipart/form-data">
            <input type="hidden" name="resumeno" value="${resumeno }">
            <!-- <input type="hidden" name="now_page" value="${param.now_page }">  -->
                
            <br><br> 
            변경 이미지 선택<br>  
            <input type='file' name='file1MF' id='file1MF' value='' placeholder="파일 선택"><br>
            <br>
            <div style='margin-top: 20px; clear: both;'>  
              <button type="submit" class="btn btn-primary">파일 변경 처리</button>
              <button type="submit" class="btn btn-primary">파일 삭제</button>
              <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
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



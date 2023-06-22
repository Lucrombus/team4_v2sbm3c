<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="resumeno" value="${resumeVO.resumeno }" />
<c:set var="title" value="${resumeVO.title }" />
<c:set var="intro" value="${resumeVO.intro }" />
<c:set var="tel" value="${resumeVO.tel }" />
<c:set var="address" value="${resumeVO.address }" />
<c:set var="career" value="${resumeVO.career }" />
<c:set var="skills" value="${resumeVO.skills }" />
<c:set var="langskill" value="${resumeVO.langskill }" />
<c:set var="wantjob" value="${resumeVO.wantjob }" />

 
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
<A href="./read.do?resumeno=${resumeno }" class='title_link'>${title }</A> > 글 수정</DIV>

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
  
  <FORM name='frm' method='POST' action='./update_text.do'>
    <input type="hidden" name="resumeno" value="${resumeno }">
    <!-- <input type="hidden" name="now_page" value="${param.now_page }">  -->
    
    <div>
       <label>제목</label>
       <input type='text' name='title' value='${title }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>자기소개</label>
       <textarea name='intro' required="required" class="form-control" rows="12" style='width: 100%;'>${intro }</textarea>
    </div>
    <div>
       <label>전화번호</label>
       <input type='text' name='tel' value='${tel }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>주소</label>
       <input type='text' name='address' value='${address }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
        <div>
       <label>희망직종</label>
       <input type='text' name='wantjob' value='${wantjob }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>경력</label>
       <input type='text' name='career' value='${career }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>보유기술(자격증)</label>
       <input type='text' name='skills' value='${skills }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>언어능력</label>
       <input type='text' name='langskill' value='${langskill }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>

       
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="location.href='./read.do?resumeno=${resumeno }'" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


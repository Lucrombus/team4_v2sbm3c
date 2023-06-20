<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬 1.0</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>
    회원(관리자 전용)
  </DIV>

  <DIV class='content_body'>

    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
   
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <TR>
      <TH class='th_bs'>등급</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>경력</TH>
      <TH class='th_bs'>성별</TH>
      <TH class='th_bs'>생일</TH>
      <TH class='th_bs'>등록일</TH>
      <TH class='th_bs'>기타</TH>
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="rankno" value ="${memberVO.rankno}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="name" value ="${memberVO.name}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="experience" value ="${memberVO.experience}" />
      <c:set var="gender" value ="${memberVO.gender}" />
      <c:set var="birth" value ="${memberVO.birth}" />
      <c:set var="rdate" value ="${memberVO.rdate}" />
       
    <TR>
      <TD class='td_basic'>
        <c:choose>
          <c:when test="${rankno == 1}"><img src='/member/images/admin.png' title="관리자" class="icon"></c:when> <%-- static 기준 --%>
          <c:when test="${rankno == 2}"><img src='/member/images/user.png' title="개인 회원" class="icon"></c:when>
          <c:when test="${rankno == 3}"><img src='/member/images/enterprise.png' title="기업 회원" class="icon"></c:when>
          <c:when test="${rankno == 4}"><img src='/member/images/x.png' title="탈퇴 회원" class="icon"></c:when>
        </c:choose>  
      </TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${id}</A></TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${name}</A></TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_basic'>${experience}</TD>
      <TD class='td_basic'>${gender}</TD>
      <TD class='td_basic'>${birth}</TD>
      <TD class='td_basic'>${rdate.substring(0, 10)}</TD> <%-- 년월일 --%>
      </TD>
      <TD class='td_basic'>
        <A href="./passwd_update.do?memberno=${memberno}"><IMG src='/member/images/passwd.png' title='패스워드 변경' class="icon"></A>
        <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정' class="icon"></A>
        <A href="./delete.do?memberno=${memberno}"><IMG src='/member/images/delete.png' title='삭제' class="icon"></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create.do'" class="btn btn-info">등록</button>
    <button type='button' onclick="location.reload();" class="btn btn-info">새로 고침</button>
  </DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
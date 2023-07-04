<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바 지옥몬 0.1</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>전체 등급 리스트 [${rankVO.rankname }]> 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type="hidden" name="rankno" value="${rankVO.rankno }">
      <div class="msg_warning">등급을 삭제하면 복구 할 수 없습니다.</div>
      <label>등급 이름</label>: ${rankVO.rankname }
      
      <button type="submit" id='submit' class='btn btn-warning btn-sm' style='height: 28px; margin-bottom: 5px;'>삭제</button>          
      <button type="button" onclick="location.href='/rank/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 60%;'/>
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="rankVO" items="${list }">
        <c:set var="rankno" value="${rankVO.rankno }" />
        <c:set var="rankname" value="${rankVO.rankname }" />
        
      <TR>
        <TD class='td_bs'>${rankno }</TD>
        
        <TD class='td_bs'>${rankname }</TD>
        <TD class='td_bs'>
          <A href="./read_update.do?rankno=${rankno }" title="수정"><IMG src="/rank/images/update.png" class="icon"></A>
          <A href="./read_delete.do?rankno=${rankno }" title="삭제"><IMG src="/rank/images/delete.png" class="icon"></A>          
        </TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


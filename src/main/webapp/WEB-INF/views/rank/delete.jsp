<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.rank.RankVO" %>

<%
RankVO rankVO_read = (RankVO)request.getAttribute("rankVO");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>전체 카테고리 > 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type="hidden" name="cateno" value="<%=rankVO_read.getRankno() %>">

      <c:choose>
        <c:when test="${count_by_cateno >= 1 }"> <%-- 자식 레코드가 있는 상황 --%>
          <div class="msg_warning">
            관련 자료 ${count_by_cateno } 건이 발견되었습니다.<br>
            관련 자료와 카테고리를 모두 삭제하시겠습니까?
          </div>
            
          <label>관련 등급 이름</label>: <%=rankVO_read.getRankname() %> 
          <a href="../contents/list_by_cateno.do?cateno=${cateVO.cateno }" title="관련 카테고리로 이동"><img src='/cate/images/link.png'></a>
          &nbsp;      
          <button type="submit" id='submit' class='btn btn-danger btn-sm' style='height: 28px; margin-bottom: 5px;'>관련 자료와 함게 카테고리 삭제</button>
          
        </c:when>
        <c:otherwise>
          <div class="msg_warning">등급을 삭제하면 복구 할 수 없습니다.</div>
          <label>등급 이름</label>: <%=rankVO_read.getRankname() %>
      
          <button type="submit" id='submit' class='btn btn-warning btn-sm' style='height: 28px; margin-bottom: 5px;'>삭제</button>          
        </c:otherwise>
      </c:choose>      

      <button type="button" onclick="location.href='/cate/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 50%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">자료수</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    ArrayList<RankVO> list = (ArrayList<RankVO>)request.getAttribute("list");
    
    for (int i=0; i < list.size(); i++) {
      RankVO rankVO = list.get(i);
    %>
      <TR>
        <TD class='td_bs'><%= rankVO.getRankno() %></TD>
        <TD><%=rankVO.getRankname() %></TD>
        <TD>
          <A href="./read_update.do?cateno=<%=rankVO.getRankno() %>" title="수정"><IMG src="/cate/images/update.png" class="icon"></A>
          <A href="./read_delete.do?cateno=<%=rankVO.getRankno() %>" title="삭제"><IMG src="/cate/images/delete.png" class="icon"></A>
        </TD>
      </TR>
    <%  
    }
    %>
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


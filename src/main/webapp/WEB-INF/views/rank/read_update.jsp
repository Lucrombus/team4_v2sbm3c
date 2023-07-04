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
<title>알바 지옥몬 0.1</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>전체 등급 리스트 [${rankVO.rankname }]> 수정</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./update.do'>
      <input type="hidden" name="rankno" value='${rankVO.rankno }'>
      <label>등급 이름</label>
      <input type='text' name='rankname' value='${rankVO.rankname }' required="required" style='width: 10%;' autofocus="autofocus">
      <button type="submit" id='submit' class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>수정</button>
      <button type="button" onclick="location.href='/rank/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
    </FORM>
  </DIV>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

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
    <%
    ArrayList<RankVO> list = (ArrayList<RankVO>)request.getAttribute("list");
    
    for (int i=0; i < list.size(); i++) {
      RankVO rankVO = list.get(i);
    %>
      <TR>
        <TD class='td_bs'><%= rankVO.getRankno() %></TD>
        <TD class='td_bs'><%=rankVO.getRankname() %></TD>
        <TD>
          <A href="./read_update.do?rankno=<%=rankVO.getRankno() %>" title="수정"><IMG src="/cate/images/update.png" class="icon"></A>
          <A href="./read_delete.do?rankno=<%=rankVO.getRankno() %>" title="삭제"><IMG src="/cate/images/delete.png" class="icon"></A>
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


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.jobcate.JobcateVO" %>

<%
// 목록시 출력시 for문에서 cateVO를 사용하고 있음으로 여기서는 cateVO_read 라고 다르게 해야함.
// 삭제할 카테고리 정보를 읽어옴
JobcateVO jobcateVO_read = (JobcateVO)request.getAttribute("jobcateVO");
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
 
<DIV class='title_line'>전체 카테고리 > 수정</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./update.do'>
      <input type="hidden" name="jobcateno" value="<%=jobcateVO_read.getJobcateno() %>">
      <label>카테고리 이름</label>
      <input type='text' name='name' value='<%=jobcateVO_read.getName() %>' required="required" style='width: 25%;' autofocus="autofocus">
      <label>출력 순서</label>
      <input type='number' name='seqno' value='<%=jobcateVO_read.getSeqno() %>' min='1' required="required" style='width: 5%;'>  
      <button type="submit" id='submit' class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>수정</button>
      <button type="button" onclick="location.href='/cate/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 50%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 30%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">자료수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    ArrayList<JobcateVO> list = (ArrayList<JobcateVO>)request.getAttribute("list");
    
    for (int i=0; i < list.size(); i++) {
      JobcateVO jobcateVO = list.get(i);
    %>
      <TR>
        <TD class='td_bs' style="text-align:center"><%= jobcateVO.getSeqno() %></TD>
        <TD style="text-align:center" ><%=jobcateVO.getName() %></TD>
        <TD class='td_bs' style="text-align:center"></TD>
        <TD style="text-align:center">
          <A href="./read_update.do?jobcateno=<%=jobcateVO.getJobcateno() %>" title="수정"><IMG src="/cate/images/update.png" class="icon"></A>
          <A href="./read_delete.do?jobcateno=<%=jobcateVO.getJobcateno() %>" title="삭제"><IMG src="/cate/images/delete.png" class="icon"></A>
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

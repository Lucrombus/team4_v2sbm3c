<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.function.Function" %>
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
<title>알바지옥몬 0.1</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
    
</head> 
 
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>구인 카테고리 > 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type="hidden" name="jobcateno" value="<%=jobcateVO_read.getJobcateno() %>"> <%-- 삭제할 카테고리 번호 --%>

      <c:choose>
        <c:when test="${count_by_jobcateno >= 1 }"> <%-- 자식 레코드가 있는 상황 --%>
          <div class="msg_warning">
            관련 자료 ${count_by_jobcateno } 건이 발견되었습니다.<br>
            관련 자료와 카테고리를 모두 삭제하시겠습니까?
          </div>
            
          <label>관련 카테고리 이름</label>: <%=jobcateVO_read.getName() %> 
          <a href="/guin_c/list_by_jobcateno_search_paging.do?jobcateno=${jobcateVO.jobcateno }" title="관련 카테고리로 이동"><img src='/cate/images/link.png'></a>
          &nbsp;      
          <button type="submit" id='submit' class='btn btn-danger btn-sm' style='height: 28px; margin-bottom: 5px;'>관련 자료와 함게 카테고리 삭제</button>
          
        </c:when>
        <c:otherwise>
          <div class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
          <label>카테고리 이름</label>: <%=jobcateVO_read.getName() %>
      
          <button type="submit" id='submit' class='btn btn-warning btn-sm' style='height: 28px; margin-bottom: 5px;'>삭제</button>          
        </c:otherwise>
      </c:choose>      

      <button type="button" onclick="location.href='/jobcate/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 50%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 30%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">PK</TH>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">자료수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    ArrayList<JobcateVO> list = (ArrayList<JobcateVO>)request.getAttribute("list");
    Function<Integer, Integer> f = (Function<Integer, Integer>) request.getAttribute("f");
    
    for (int i=0; i < list.size(); i++) {
      JobcateVO jobcateVO = list.get(i);
    %>
      <TR>
        <TD class='td_bs'><%= jobcateVO.getJobcateno() %></TD>
        <TD class='td_bs' style="text-align:center"><%= jobcateVO.getSeqno() %></TD>
        <TD style="text-align:center" ><%=jobcateVO.getName() %></TD>
        <TD style="text-align:center"><%=f.apply(jobcateVO.getJobcateno())%></TD>
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


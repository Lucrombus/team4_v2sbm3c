<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.function.Function" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.board.BoardVO" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
    
</head> 
 
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>커뮤니티 카테고리</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>카테고리 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%; margin-right: 10px;' autofocus="autofocus">
      <label> 출력 순서</label>
      <input type='number' name='seqno' min="1" value='1' required="required" style='width: 5%;'>
  
      <button type="submit" id='submit' class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>등록</button>
      <button type="button" onclick="location.href='/board/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
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
    ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("list");
    Function<Integer, Integer> f = (Function<Integer, Integer>) request.getAttribute("f");
    
    
    for (int i=0; i < list.size(); i++) {
      BoardVO boardVO = list.get(i);
    %>
      <TR>
        <TD class='td_bs'><%= boardVO.getBoardno() %></TD>
        <TD class='td_bs'><%= boardVO.getSeqno() %></TD>
        <TD style="text-align:center" ><a href="/contents/list_by_boardno_search_paging.do?boardno=<%=boardVO.getBoardno() %>&now_page=1"><%=boardVO.getName() %></a></TD>
        <TD style="text-align:center"><%=f.apply(boardVO.getBoardno())%></TD>
        <TD style="text-align:center">
          <A href="./read_update.do?boardno=<%=boardVO.getBoardno() %>" title="수정"><IMG src="/cate/images/update.png" class="icon"></A>
          <A href="./read_delete.do?boardno=<%=boardVO.getBoardno() %>" title="삭제"><IMG src="/cate/images/delete.png" class="icon"></A>
          <A href="./update_seqno_decrease.do?boardno=<%=boardVO.getBoardno() %>" title="우선순위 높이기"><IMG src="/cate/images/decrease.png" class="icon"></A>
          <A href="./update_seqno_increase.do?boardno=<%=boardVO.getBoardno() %>" title="우선순위 낮추기"><IMG src="/cate/images/increase.png" class="icon"></A>
 
          <%
          if (boardVO.getVisible().equals("Y")) {
          %>
            <A href="./update_visible_n.do?boardno=<%=boardVO.getBoardno() %>"><IMG src="/cate/images/show.png" class="icon"></A>
          <%  
          } else { // N
          %>
            <A href="./update_visible_y.do?boardno=<%=boardVO.getBoardno() %>"><IMG src="/cate/images/hide.png" class="icon"></A>
          <%  
          }
          %>
                    
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


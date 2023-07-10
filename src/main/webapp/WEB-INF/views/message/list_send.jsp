<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
</head>
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />

<DIV class='title_line'>
<a href="/message/list_receive.do"><span style="font-size:20px; color:#A4A4A4; ">받은 쪽지함 </span></a>
<span class='menu_divide' >│</span>
<a href="/message/list_send.do"><span style="font-size:20px; font-weight:bold;">보낸 쪽지함 </span></a>
<span class='menu_divide' >│</span>
<a href="/message/create.do"><span style="font-size:20px; color:#A4A4A4; ">쪽지쓰기 </span></a>
</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>
        <table class="table table-hover table-bordered table-sm" style="width: 100%;">
            <colgroup>
                <col style='width: 10%;' />
                <col style='width: 45%;' />
                <col style='width: 15%;' />
                <col style='width: 20%;' />
                <col style='width: 10%;' />
            </colgroup>

            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">받는사람</th>
                    <th scope="col">날짜</th>
                    <th scope="col">읽음</th>
                </tr>
            </thead>


            <tbody>
            <c:if test="${list[0]== null}">
            <tr>
            <td colspan="5">
            보낸 쪽지가 아무것도 없습니다!
            </td>
            </tr>
            </c:if>
            
            <c:forEach var="MessageVO" items="${list }">
              <tr onclick="location.href='/message/read.do?messageno=${MessageVO.messageno }'" class="hover">
                <td>${MessageVO.messageno }</td>
                <td>${MessageVO.title}</td>
                <td>${f.apply(MessageVO.receive_memberno).id == null ? '(알수없음)' : f.apply(MessageVO.receive_memberno).id }</td>
                <td>${MessageVO.rdate }</td>
                <td>${MessageVO.read }</td>
              </tr>
            </c:forEach>
            
             
            </tbody>
        </table>
    </DIV>
       
    
  
  
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
 

</body>
</html>


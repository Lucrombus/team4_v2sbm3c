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

<DIV class='title_line'>받은 쪽지함</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>
        <table class="table" style="width: 100%;">
            <colgroup>
                <col style='width: 10%;' />
                <col style='width: 60%;' />
                <col style='width: 10%;' />
                <col style='width: 20%;' />
            </colgroup>

            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">제목</th>
                    <th scope="col">보낸사람</th>
                    <th scope="col">날짜</th>
                </tr>
            </thead>


            <tbody>
            
            <c:forEach var="MessageVO" items="${list }">
              <tr>
                <td>${MessageVO.messageno }</td>
                <td>${MessageVO.title}</td>
                <td>${f.apply(MessageVO.memberno).id }</td>
                <td>${MessageVO.rdate }</td>
              </tr>
            </c:forEach>
            
             
            </tbody>
        </table>
    </DIV>
       
    
  
  
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
 

</body>
</html>


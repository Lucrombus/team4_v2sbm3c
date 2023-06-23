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
<a href="/message/list_send.do"><span style="font-size:20px; color:#A4A4A4; ">보낸 쪽지함 </span></a>
<span class='menu_divide' >│</span>
<a href="/message/create.do"><span style="font-size:20px; color:#A4A4A4; ">쪽지쓰기 </span></a>
</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>

        <FORM name='frm' id='frm'>
            
            <div class="input-group mb-3" style="width:60%;">
                <span class="input-group-text" id="basic-addon1">보낸사람</span>
                <input type="text" class="form-control" value="${f.apply(messageVO.memberno).id }"style="background-color: white;" readonly>
            </div>
        
        
            
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" id="title" name="title" class="form-control" value="${messageVO.title }"  style="background-color: white;" readonly>
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" id="content" name="content" rows="12" style="background-color: white;" readonly>${messageVO.content }</textarea>
            </div>

        </FORM>


    </DIV>
       
    
  
  
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
 

</body>
</html>


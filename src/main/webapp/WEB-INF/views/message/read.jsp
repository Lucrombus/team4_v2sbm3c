<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="receiver" value="${f.apply(messageVO.receive_memberno).id == sessionScope.id ? '나' : f.apply(messageVO.receive_memberno).id }" />
<c:set var="sender" value="${f.apply(messageVO.memberno).id == sessionScope.id ? '나' : f.apply(messageVO.memberno).id }" />

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
<script type="text/javascript">
function check(){
	 var result = confirm("쪽지를 삭제하시겠습니까?\n보낸사람과 받은사람의 쪽지함 양쪽 모두에서 삭제됩니다"); 
   if (result){
	   $("#frm").submit();
       }else{
           }  
}
</script>


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

        <FORM name='frm' id='frm' method='POST' action='./delete.do'>
            <input type="hidden" name="receive_memberno" value="${messageVO.receive_memberno }">
            <input type="hidden" name="memberno" value="${messageVO.memberno }">
            <input type="hidden" name="messageno" value="${messageVO.messageno }">
            
            <div class="input-group mb-3" style="width:60%;">
                <span class="input-group-text" id="basic-addon1">보낸사람</span>
                <input type="text" class="form-control" value="${sender == null ? '(알수없음)' : sender}"style="background-color: white;" readonly>
                <span class="input-group-text" id="basic-addon1">받는사람</span>
                <input type="text" class="form-control" value="${receiver == null ? '(알수없음)' : receiver}"style="background-color: white;" readonly>
            </div>
            
        
        
            
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" id="title" class="form-control" value="${messageVO.title }"  style="background-color: white;" readonly>
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" id="content" rows="12" style="background-color: white;" readonly>${messageVO.content }</textarea>
            </div>
            
            <div class="content_body_bottom">
            <button type="button" onclick="check()" class="btn btn-danger">삭제</button>
            </div>

        </FORM>


    </DIV>
       
    
  
  
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
 

</body>
</html>


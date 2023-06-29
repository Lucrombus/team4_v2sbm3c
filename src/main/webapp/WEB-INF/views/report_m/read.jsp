<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="reportno" value="${report_mVO.reportno }" />
<c:set var="memberno" value="${report_mVO.memberno }" />
<c:set var="target_mno" value="${report_mVO.target_mno }" />
<c:set var="title" value="${report_mVO.title }" />                  
<c:set var="reason" value="${report_mVO.reason }" />        
<c:set var="rdate" value="${report_mVO.rdate.substring(0, 16) }" />
<c:set var="done" value="${report_mVO.done }" />        
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬0.1</title>
 
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
</head>

<script type="text/javascript">
function check(){
   var result = confirm("신고를 철회하시겠습니까?"); 
   if (result){
     $("#frm").submit();
       }else{
           }  
}
</script> 
 
<body>
<c:import url="/menu/top.do" />

<DIV class='title_line'>
<a href="/report_m/list_all_by_memberno.do?memberno=${memberno }"><span style="font-size:20px; color:#A4A4A4;">내 신고 조회 </span></a>
<span class='menu_divide' >│</span>
<a href="/report_m/create.do"><span style="font-size:20px; color:#A4A4A4;">회원 신고하기 </span></a>
</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>

        <FORM name='frm' id='frm' method='POST' action='./delete.do'>
            <input type="hidden" name="target_mno" value="${target_mno }">
            <input type="hidden" name="memberno" value="${memberno }">
            <input type="hidden" name="reportno" value="${reportno }">     
                   
            <div class="input-group mb-3" style="width:60%;">
                <span class="input-group-text" id="basic-addon1">신고자</span>
                <input type="text" class="form-control" value="${id }"style="background-color: white;" readonly>
                <span class="input-group-text" id="basic-addon1">신고대상</span>
                <input type="text" class="form-control" value="${id_t}"style="background-color: white;" readonly>
            </div>
            
        
        
            
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" id="title" class="form-control" value="${title }"  style="background-color: white;" readonly>
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" id="reason" rows="12" style="background-color: white;" readonly>${reason }</textarea>
            </div>
            
            <div class="content_body_bottom">
            <button type="button" onclick="check()" class="btn btn-danger">삭제</button>
            </div>

        </FORM>


    </DIV>
<!-- ---------------------------------------------- -->
 

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>



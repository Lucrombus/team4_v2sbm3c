<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="reportno" value="${report_cVO.reportno }" />
<c:set var="memberno" value="${report_cVO.memberno }" />
<c:set var="contentsno" value="${report_cVO.contentsno }" />
<c:set var="title" value="${report_cVO.title }" />                  
<c:set var="reason" value="${report_cVO.reason }" />        
<c:set var="rdate" value="${report_cVO.rdate.substring(0, 16) }" />
<c:set var="done" value="${report_cVO.done }" />        
 
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
<a href="/report_c/list_all_by_memberno.do?memberno=${memberno }"><span style="font-size:20px; color:#A4A4A4; ">게시글 신고 조회 </span></a>
<span class='menu_divide' >│</span>
<span style="font-size:20px; font-weight:bold;">게시글 신고 내용 </span>
</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>

        <FORM name='frm' id='frm' method='POST' action='./delete.do'>
            
            <input type="hidden" name="reportno" value="${reportno }">  
                   
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1" >신고된 게시글 고유번호</span>
                <input type="text" class="form-control" placeholder="신고 게시물 번호" id="contentsno" name="contentsno" value="${contentsno }" style="background-color: white;" readonly>
            </div>    
            <div class="input-group mb-3" >
                <span class="input-group-text" id="basic-addon1" >신고된 게시글</span>
                <a href="/contents/read.do?contentsno=${contentsno }" style="display: flex; flex-grow: 1;">
                  <input type="text" class="form-control" placeholder="게시글 제목" id="title_c" name="title_c" value="${title_c }" style="background-color: white;" readonly>
                </a>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" id="title" name="title" value="${title }" class="form-control" required="required" maxlength="33" style="background-color: white;" readonly>
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" id="reason" name="reason" rows="12" required="required" maxlength="333" style="background-color: white;" readonly>${reason }</textarea>
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



<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 

 
<script type="text/javascript">
var ID_EXIST = false;

function CheckID() {

    var id_read = $("#idchecker").val();
    console.log("입력한 ID: " + id_read);
    var dataToSend = {member_target: id_read};
    console.log("전송할 데이터: " + dataToSend.target_no);

    $.ajax({
        url: "/report_m/checkid_ajax.do",
        type: "post",
        cache: false,
        async: true,
        dataType: "json",
        data: dataToSend,
        success: function(rdata) {
            if (rdata.result == "성공") {
                console.log("조회성공")
                $("#span_result").html("<span style='color:#00db00;'>조회성공</span>");
                $("#target_mno").val(rdata.memberno);
                ID_EXIST = true;


            } else {
                console.log("조회실패")
                $("#span_result").html("<span style='color:#ff0000;'>조회실패</span>");
                alert("존재하지 않는 ID입니다");
                ID_EXIST = false;
            }

        },
        error: function(request, status, error) {
        }
    });

}

function checkLength() {
    var title_length = $("#title").val().length;
    var reason_length = $("#reason").val().length;

    console.log('제목길이' + title_length);
    console.log('내용길이' + reason_length);

    if (document.getElementById("frm").checkValidity()) {
        if (title_length < 33) {
            if (reason_length < 333) {
                if (ID_EXIST == true) {
                    $("#frm").submit();
                } else {
                    alert("신고받는 대상 ID를 확인해주세요");
                }

            } else {
                alert("내용은 333자 이내로 해주세요");
            }
        } else {
            alert("제목은 33자 이내로 해주세요");

        }
    } else {
        alert("입력되지 않은 필수 정보가 있습니다");
    }

}
</script>
    
</head>
<body>
<c:import url="/menu/top.do" />

<DIV class='title_line'>
<a href="/report_m/list_all_by_memberno.do?memberno=${memberno }"><span style="font-size:20px; color:#A4A4A4; ">내 신고 조회 </span></a>
<span class='menu_divide' >│</span>
<a href="/report_m/create.do"><span style="font-size:20px; font-weight:bold;">회원 신고하기 </span></a>
</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>

        <FORM name='frm' id='frm' method='POST'
            action='./create.do' enctype="multipart/form-data" >
            
            <input type="hidden" name="target_mno" value="" id="target_mno">

            <div class="input-group mb-3" style="width:60%;">
                <span class="input-group-text" id="basic-addon1">신고받는 대상</span>
                <input type="text" class="form-control" placeholder="ID" id="idchecker" value="${param.target_id }">
                <button type="button" onclick="CheckID()" class="btn btn-outline-secondary">조회</button>
                <span style="padding-left:10px; padding-top:4px;" id="span_result">조회필요</span>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" id="title" name="title" class="form-control" required="required" maxlength="33">
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" id="reason" name="reason" rows="12" required="required" maxlength="333"></textarea>
            </div>

            <div class="content_body_bottom">
                <button type="button" onclick="checkLength();"
                    class="btn btn-secondary">전송</button>
                <button type="button"
                    onclick="location.href='/message/list_send.do'"
                    class="btn btn-secondary">취소</button>
            </div>

        </FORM>


    </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


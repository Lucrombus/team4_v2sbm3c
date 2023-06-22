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

<script type="text/javascript">
var ID_EXIST = false;

function CheckID() {

    var id_read = $("#idchecker").val();
    console.log("입력한 ID: " + id_read);
    var dataToSend = {member_receive: id_read};
    console.log("전송할 데이터: " + dataToSend.member_receive);

	  $.ajax({                // 자바스크립트 객체 표기법: {, }  
          url: "/message/checkid_ajax.do", // form action 기능을 함.
          type: "post",          // form method 기능을 함.
          cache: false,         // 응답 결과 임시 저장 취소
          async: true,          // true: 비동기 통신 (권장), false: 동기 통신
          dataType: "json",     // 서버로부터의 응답 형식: json, html, xml..., JSON.parse() 자동 처리
          data: dataToSend,         // 서버로 보내는 데이터, id=user1&passwd=1234
          success: function(rdata) { // 응답 성공
            if (rdata.result == "성공") {
                console.log("조회성공")
                $("#span_result").html("<span style='color:#00db00;'>조회성공</span>");
                $("#receiver").val(rdata.memberno);
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

function checkLength() { // 입력되는 문자열의 길이를 구해서 오라클 칼럼 용량 초과 오류를 방지하는 함수

    var title_length = $("#title").val().length;
    var content_length = $("#content").val().length;

    console.log('제목길이' + title_length);
    console.log('내용길이' + content_length);

    if (document.getElementById("frm").checkValidity()) { // required 옵션 체크하는 함수
      if (title_length < 33) {
        if (content_length < 333) {
          if (ID_EXIST == true){
        	  $("#frm").submit();
              }else {
            	  alert("받는사람 ID를 확인해주세요");
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
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />

<DIV class='title_line'>쪽지 쓰기</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>

        <FORM name='frm' id='frm' method='POST'
            action='./create.do' enctype="multipart/form-data" >
            
            <input type="hidden" name="receive_memberno" value="" id="receiver">

            <div class="input-group mb-3" style="width:60%;">
                <span class="input-group-text" id="basic-addon1">받는사람</span>
                <input type="text" class="form-control" placeholder="ID" id="idchecker">
                <button type="button" onclick="CheckID()" class="btn btn-outline-secondary">조회</button>
                <span style="padding-left:10px; padding-top:4px;" id="span_result">조회필요</span>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" id="title" name="title" class="form-control" required="required" maxlength="33">
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" id="content" name="content" rows="12" required="required" maxlength="333"></textarea>
            </div>

            <div class="content_body_bottom">
                <button type="button" onclick="checkLength();"
                    class="btn btn-secondary">전송</button>
                <button type="button"
                    onclick="location.href='./list_by_boardno_search_paging.do?boardno=${param.boardno}&now_page=${param.now_page }'"
                    class="btn btn-secondary">취소</button>
            </div>

        </FORM>


    </DIV>
       
    
  
  
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
 

</body>
</html>


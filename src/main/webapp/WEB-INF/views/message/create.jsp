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
function CheckID() {

    var id_read = $("").value

	  $.ajax({                // 자바스크립트 객체 표기법: {, }  
          url: "/message/checkid_ajax.do", // form action 기능을 함.
          type: "post",          // form method 기능을 함.
          cache: false,         // 응답 결과 임시 저장 취소
          async: true,          // true: 비동기 통신 (권장), false: 동기 통신
          dataType: "json",     // 서버로부터의 응답 형식: json, html, xml..., JSON.parse() 자동 처리
          data: dataToSend,         // 서버로 보내는 데이터, id=user1&passwd=1234
          success: function(rdata) { // 응답 성공
            if (rdata.result == "성공") {
            } else {
            }
                
          },
          error: function(request, status, error) {
          }   
        });
	    
}

</script>
    
</head>
<body>
<%-- <jsp:include page="../menu/top.jsp" flush='false' /> --%>
<c:import url="/menu/top.do" />

<DIV class='title_line'>쪽지 쓰기</DIV>

    <DIV style='width: 50%; margin: 30px auto; text-align: center;'>

        <FORM name='frm' id='frm' method='POST'
            action='./create.do' enctype="multipart/form-data">
            
            <input type="hidden" name="memberno_receive" value="">

            <div class="input-group mb-3" style="width:50%;">
                <span class="input-group-text" id="basic-addon1">받는사람</span>
                <input type="text" class="form-control"
                    placeholder="ID" >
                <button type="button" onclick="CheckID()" class="btn btn-outline-secondary">조회</button>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">제목</span>
                <input type="text" class="form-control">
            </div>
            <div class="input-group">
                <span class="input-group-text">내용</span>
                <textarea class="form-control" rows="12"></textarea>
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


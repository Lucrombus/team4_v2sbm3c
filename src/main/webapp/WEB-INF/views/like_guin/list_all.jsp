<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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
<script>
function like_n(image) {
    var dataToSend = {guin_cno: $(image).data("guin_cno")};
    console.log("클릭한 댓글의 데이터: " + dataToSend.guin_cno);

    if (${sessionScope.id != null}){
      $.ajax({                // 자바스크립트 객체 표기법: {, }  
            url: "/like_guin/like_n.do", // form action 기능을 함.
            type: "post",          // form method 기능을 함.
            cache: false,         // 응답 결과 임시 저장 취소
            async: true,          // true: 비동기 통신 (권장), false: 동기 통신
            dataType: "json",     // 서버로부터의 응답 형식: json, html, xml..., JSON.parse() 자동 처리
            data: dataToSend,         // 서버로 보내는 데이터, id=user1&passwd=1234
            success: function(rdata) { // 응답 성공
              if (rdata.result == "성공") {
                window.location.reload();
              } else {
                alert("아무튼 실패함");  
              }
                  
            },
            error: function(request, status, error) {
            }   
          });

        }else{
          alert("관심 등록 해제를 하려면 로그인을 하십시오")
            }

    }
</script>
 
<body>
<c:import url="/menu/top.do" />
 <DIV class='title_line'>나의 관심 구인 목록</DIV>

      
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 5%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 5%;"></col>
    </colgroup>

    <thead>
      <tr >
        <th style='text-align: center;'>번호</th>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>작성자</th>
        <th style='text-align: center;'>해제</th>
      </tr>
    
    </thead>
    
    <c:if test="${list[0]== null}">
         <tr>
             <td colspan="6" style='vertical-align: middle; text-align: center; font-size: 17px;'>
              등록된 구인정보가 아무것도 없습니다!
             </td>
         </tr>
     </c:if>
    
    <tbody>
      <c:forEach var="guin_cVO" items="${list }">
        <c:set var="title" value="${guin_cVO.title }" />
        <c:set var="content" value="${guin_cVO.content }" />
        <c:set var="jobcateno" value="${guin_cVO.jobcateno }" />
        <c:set var="guin_cno" value="${guin_cVO.guin_cno }" />
        <c:set var="thumb1" value="${guin_cVO.thumb1 }" />
        <c:set var="rdate" value="${guin_cVO.rdate }" />
        <c:set var="memberno" value="${guin_cVO.memberno }" />
        

		        <tr style="height:100px;">
		          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
		          ${guin_cno}
		          </td>
		          <td style='vertical-align: middle; text-align: center;'>
		            <c:choose>
		              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
		                <%-- registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir());--%>
		                <IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
		              </c:when>
		              <c:otherwise> <!-- 이미지가 없는 경우, 기본 이미지 출력 /static/contents/images/none1.png-->
		                <IMG src="/contents/images/none1.png" style="width: 120px; height: 80px;">
		              </c:otherwise>
		            </c:choose>
		          </td>  
		          <td style='vertical-align: middle;'>
		            <a href="/guin_c/read.do?guin_cno=${guin_cno}&jobcateno=${jobcateno}&now_page=1&word=${param.word}"><strong>${title }</strong>  
		            </a> 
		          </td>
		          <td style='vertical-align: middle; text-align: center;'>
		          ${rdate }
		          </td>
		           <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
		          ${f.apply(memberno) }
		          </td>
              <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
              <IMG src="/like_guin/images/like_y.png" id="like_y" class="icon" style="cursor:pointer;" onclick="like_n(this)" data-guin_cno="${guin_cno }">
              </td>
		        </tr>
        
      </c:forEach>


    </tbody>
  </table>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
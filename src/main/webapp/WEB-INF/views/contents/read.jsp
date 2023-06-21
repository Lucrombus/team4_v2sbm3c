<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="boardno" value="${param.boardno }" />
<c:set var="title" value="${contentsVO.title }" />        
<c:set var="file1" value="${contentsVO.file1 }" />
<c:set var="file1saved" value="${contentsVO.file1saved }" />
<c:set var="content" value="${contentsVO.content }" />
<c:set var="rdate" value="${contentsVO.rdate }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="size1_label" value="${contentsVO.size1_label }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
<script type="text/javascript">

	function confirmClick(event) {
		var result = confirm("댓글을 삭제하시겠습니까?");
		if (result) {
			return true;

		} else {
			event.preventDefault(); // 기본 동작(링크 이동) 막기
			return false;
		}
	}




	  function gaechu(image) {
	      var dataToSend = {replyno: $(image).data("value")};
        console.log("클릭한 댓글의 데이터: " + dataToSend.replyno);

        if (${sessionScope.id != null}){
        	$.ajax({                // 자바스크립트 객체 표기법: {, }  
                url: "/like_reply/gaechu_ajax.do", // form action 기능을 함.
                type: "post",          // form method 기능을 함.
                cache: false,         // 응답 결과 임시 저장 취소
                async: true,          // true: 비동기 통신 (권장), false: 동기 통신
                dataType: "json",     // 서버로부터의 응답 형식: json, html, xml..., JSON.parse() 자동 처리
                data: dataToSend,         // 서버로 보내는 데이터, id=user1&passwd=1234
                success: function(rdata) { // 응답 성공
                  if (rdata.result == "성공") {
                    window.location.reload();
                  } else {
                    alert("이미 추천한 댓글입니다");  
                  }
                      
                },
                error: function(request, status, error) {
                }   
              });

            }else{
            	alert("로그인을 하십시오")
                }

	      }
</script>

</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_boardno_search_paging.do?boardno=${boardno }&now_page=1" class='title_link'>${param.boardno != 0 ? boardVO.name : "전체목록" } 게시판</A> > ${contentsVO.title } </DIV>
<c:if test="${sessionScope.id != null}">
  <A href="./create.do?boardno=${param.boardno }&now_page=${param.now_page}">등록</A>
  <span class='menu_divide' >│</span>
  <A href="./update.do?boardno=${param.boardno }&contentsno=${contentsno}&now_page=${param.now_page}">수정</A>
  <span class='menu_divide' >│</span>
  <A href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page}&boardno=${boardno}">삭제</A>  
</c:if>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <A href="./list_by_boardno_search_paging.do?boardno=${param.boardno}&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>

  </ASIDE> 

  
  
  <DIV style="text-align: right; clear: both;">  
    <ASIDE class="aside_left" style="padding-bottom: 10px;">
      <span style="font-size: 1.5em; font-weight: bold;">${title }</span>
      <span class='menu_divide' >│</span> ${memberVO.id}
      <span class='menu_divide' >│</span> ${rdate }
    </ASIDE>
  
    <form name='frm' id='frm' method='get' action='./list_by_boardno_search_paging.do'>
      <input type='hidden' name='boardno' value='${param.boardno }'>
      <input type='hidden' name='now_page' value='1'>  <%-- 검색기본 시작 페이지 --%>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit' class="btn btn-secondary btn-sm">검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' class='btn btn-info btn-sm'
                     onclick="location.href='./list_by_boardno_search_paging.do?boardno=${param.boardno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
 
  <DIV class='menu_line'></DIV>
  <BR>
  <fieldset class="fieldset_basic">
  ${content }
  <BR>
  <BR>
  <BR>
  <BR>
  </fieldset>
  
  <DIV style="text-align: right;">
 <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${word }
        </DIV>
      </li>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <BR>
 
  <DIV class='reply-div'> <!-- 댓글 -->
  <label style='font-size:15px; font-weight:bold;'>댓글목록</label> <span class='reply-count'>[${reply_count }]</span>
  
  <table class="table" style="width:100%;">
   <colgroup>
      <col style="width: 8%;"></col>
      <col style="width: 75%;"></col>
      <col style="width: 5%;"></col>
      <col style="width: 8%;"></col>
      <col style="width: 4%;"></col>
   </colgroup>
      <c:forEach var="replyVO" items="${reply_list }">
      <c:set var="memberno" value="${replyVO.memberno }" />
      <tr>
      <td>${f.apply(memberno) }</td>
      <td>${replyVO.reply_content }</td>
      <td><a href="#"><IMG src="/images/gaechu.png" class="icon" data-value="${replyVO.replyno }" onclick="gaechu(this)"></a> +${f2.apply(replyVO.replyno) } </td>
      <td style="font-size:13px; vertical-align: middle;">${replyVO.rdate }</td>
      <td>
      <a href="/reply/delete.do?contentsno=${param.contentsno }&boardno=${param.boardno}&now_page=${param.now_page}&word=${param.word}&replyno=${replyVO.replyno}"><IMG src="/cate/images/delete.png" class="icon" 
      onclick="confirmClick(event)"></a>
      </td>
      </tr>
      </c:forEach>
  </table>
  
  

  
  <form name='frm2' id='frm2' method='post' action='/reply/create.do'>
      <input type="hidden" name="contentsno" value="${param.contentsno }" >
      <input type="hidden" name="boardno" value="${param.boardno}" >
      <input type="hidden" name="now_page" value="${param.now_page}" >
      <input type="hidden" name="word" value="${param.word}" >
      <textarea name="reply_content" class="form-control" placeholder="댓글입력" id="reply_content" style="height: 100px" required="required"  maxlength="100"></textarea>
      <BR>
      <div style="text-align:right;">
      <button type='submit' class="btn btn-dark btn-sm">댓글 등록</button>
      </div>
      
  </form>
  
  </DIV> <!-- 댓글 -->

</DIV>



 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
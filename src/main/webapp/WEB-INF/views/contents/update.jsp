<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<title>알바 지옥몬 0.1</title>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
<style>
   .ck-editor__editable_inline {
    min-height: 400px;
  }
</style>
<script type="text/javascript"> <!--이미지 리스트를 문자열로 저장하기 위한 초기 스크립트!-->
var formSubmitted = false;

window.addEventListener('beforeunload', function(event) {

  if (formSubmitted != true) {
    const confirmationMessage = '정말로 페이지를 떠나시겠습니까?';
    event.returnValue = confirmationMessage;

    // 사용자가 나가기 버튼을 눌렀을 때 처리할 코드
    $(window).on('unload', function() {
      // 여기에 실행할 코드를 작성합니다.
      // 페이지를 나가기 전에 수행할 작업을 구현하세요.

      // 예를 들어, AJAX 요청을 보내거나 상태를 서버에 업데이트하는 작업을 수행할 수 있습니다.
      $.ajax({
        url : './ajax.do',
        method : 'POST',
        data : {
          value : file1saved
        },
        success : function(response) {
          // 성공적으로 요청이 완료된 후 실행할 작업
        },
        error : function(xhr, status, error) {
          // 요청이 실패한 경우 실행할 작업
        }
      });
    });

  }

});

var file1 = '';
var file1saved = '';
var size1 = 0;

function checkLength() { // 입력되는 문자열의 길이를 구해서 오라클 칼럼 용량 초과 오류를 방지하는 함수

  var title_length = $("#title").val().length;
  var content_length = CKEDITOR.instances['editor'].getData().length;

  console.log('제목길이' + title_length);
  console.log('내용길이' + content_length);

  if (document.getElementById("frm").checkValidity() && content_length > 0) { // required 옵션 체크하는 함수
    if (title_length < 30) {
      if (content_length < 1300) {
        formSubmitted = true;          
        $("#frm").submit();
      } else {
        alert("내용은 1300자 이내로 해주세요\n현재 글자 수: "+content_length);
      }
    } else {
      alert("제목은 30자 이내로 해주세요\n현재 글자 수: "+title_length);

    }
  } else {
    alert("입력되지 않은 필수 정보가 있습니다");
  }

}
</script>

</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_boardno_search_paging.do?boardno=${param.boardno }&now_page=1" class='title_link'>${param.boardno != 0 ? boardVO.name : "전체목록" } 게시판  </A> > 글 수정 > ${title } </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right"  style="padding-bottom: 10px;">
    <A href="./list_by_boardno_search_paging.do?boardno=${param.boardno }&now_page=1">목록</A> 
    <span class='menu_divide' >│</span>   
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
  
  <DIV style="text-align: right; clear: both; ">  
    <form name='frm' method='get' action='./list_by_boardno_search_paging.do'>
      <input type='hidden' name='boardno' value='${param.boardno }'>  <%-- 게시판의 구분 --%>
      <input type='hidden' name='now_page' value='${param.now_page }'>  <%-- 게시판의 구분 --%>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%; ' class='input_word'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit' class="btn btn-secondary btn-sm">검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' class="btn btn-secondary btn-sm"
                     onclick="location.href='./list_by_cateno_search.do?boardno=${param.boardno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  
  
  <FORM name='frm' id='frm' method='POST' action='./update.do' enctype="multipart/form-data">
  

    <input type="hidden" name="contentsno" value="${contentsno }">
    <input type="hidden" name="memberno" value="${contentsVO.memberno}">
    <input type="hidden" name="file1" value="${file1}" id="file1">
    <input type="hidden" name="file1saved" value="${file1saved}" id="file1saved">
    <input type="hidden" name="size1" value=0 id="size1">
    <input type='hidden' name='boardno' value="${param.boardno}"> 
    
    <!-- 컨텐트 내용에 있는 줄바꿈 문자를 자바스크립트가 정상적으로 인식하게 하기 위한 중간과정  -->
    <input type='hidden' name='media' id='media' value='${content }'>
    
    
    
    
 
    <div>
    <br>
       <label>제목</label>
       <input type='text' name='title' id='title' value='${title}' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' value ='${content}'required="required" id="editor" > </textarea>
    </div>
    <div>
       <label>검색어</label>
       <input type='text' name='word' value='${word}' required="required" 
                 class="form-control" style='width: 100%;' maxlength="33">
    </div>    
    <div class="content_body_bottom">
      <button type="button" onclick="checkLength();" class="btn btn-primary">수정</button>
      <button type="button" onclick="location.href='./list_by_boardno_search_paging.do?boardno=${param.boardno}&now_page=${param.now_page }'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>

  
  <script src="/ckeditor/ckeditor.js"></script>
  <script>
  CKEDITOR.replace( 'editor', {
	    filebrowserUploadUrl: '/contents/test.do',
      height: '500px'
	}).on('fileUploadResponse', function (evt) {
          var xhr = evt.data.fileLoader.xhr;
          if (xhr.status === 200) {
            var responseJson = JSON.parse(xhr.responseText);
            // JSON 문자열 파싱 후 사용할 코드 작성
            console.log('이미지 업로드 결과:', responseJson.url);

            file1 = $("#file1").val() + responseJson.file1 + "---";
            file1saved = $("#file1saved").val() + responseJson.file1saved + "---";
            size1 = size1  + responseJson.size1

            console.log('저장된 이미지:', file1saved);
            console.log('사이즈:', size1);

            
            $("#file1").val(file1); // 업로드된 이미지 정보를 input 태그에 저장
            $("#file1saved").val(file1saved); // 업로드된 이미지 정보를 input 태그에 저장
            $("#size1").val(size1); // 업로드된 이미지 정보를 input 태그에 저장
          } else {
            console.error('이미지 업로드 실패:', xhr.status);
          }
        });
  var read_content = document.getElementById("media").value
  console.log(read_content);
  CKEDITOR.instances['editor'].setData(read_content);
  </script>
  

  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
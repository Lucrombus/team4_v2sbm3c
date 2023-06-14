<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
   .ck-editor__editable_inline {
    min-height: 400px;
  }
</style>
<script type="text/javascript"> <!--이미지 리스트를 문자열로 저장하기 위한 초기 스크립트!-->

var file1 = '';
var file1saved = '';
var size1 = 0;

</script>

</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=1" class='title_link'>${param.jobcateno != 0 ? jobcateVO.name : "전체목록" } 구인</A> > 글 등록 </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right"  style="padding-bottom: 10px;">
    <A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=1">기본 목록형</A> 
    <span class='menu_divide' >│</span>   
    <A href="javascript:location.reload();">새로고침</A>

  </ASIDE>
  
  <DIV style="text-align: right; clear: both; ">  
    <form name='frm' id='frm' method='get' action='./list_by_jobcateno_search_paging.do'>
      <input type='hidden' name='jobcateno' value='${param.jobcateno }'>  <%-- 게시판의 구분 --%>
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
                     onclick="location.href='./list_by_cateno_search.do?jobcateno=${param.jobcateno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  
  
  <FORM name='frm' method='POST' action='./create_test.do' enctype="multipart/form-data">
  
      <div>
       <label>브랜드명</label>
       <input type='text' name='brand' value='CU' required="required" 
                 class="" style='width: 10%;'>
                 
       <label>업체명</label>
       <input type='text' name='name' value='CU 평양점' required="required" 
                 class="" style='width: 10%;'>
     </div>
     <div>          
       <label>주소　　</label>
       <input type='text' name='address' value='평양시 평양동' required="required" 
                 class="" style='width: 30%;'>
     </div>

       <div>          
        <label>전화번호</label>
       <input type='text' name='tel' value='010-0000-0000' required="required" 
                 class="" style='width: 20%;'>
        </div>         
        <div>          
        <label>이메일　</label>
       <input type='text' name='email' value='123@123' required="required" 
                 class="" style='width: 20%;'>
        
       </div>
      <div>
       <label>근무기간</label>
       <input type='text' name='period' value='10년' required="required" 
                 class="" style='width: 10%;'>
                 
       <label>근무요일</label>
       <input type='text' name='day' value='월화수' required="required" 
                 class="" style='width: 10%;'>

      </div>
      <div>
       <label>시급 (원)</label>
       <input type='number' name='wage' value='100' required="required"  min="0" step="100"
                 class="" style='width: 10%;'>
      </div>
       <label>썸네일</label>
       <input type='file' name='file1MF' id='file1MF' 
                 value='' placeholder="파일 선택">
    <br>

    

    
    <input type="hidden" name="memberno" value="1">
    <input type="hidden" name="file1" value="" id="file1">
    <input type="hidden" name="file1saved" value="" id="file1saved">
    <input type="hidden" name="size1" value=0 id="size1">
    <input type='hidden' name='jobcateno' value='${param.jobcateno }'> 
    
    
    
    
 
    <div>
    <br>
       <label>제목</label>
       <input type='text' name='title' value='' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' required="required" id="editor" > </textarea>
    </div>
    <div>
       <label>검색어</label>
       <input type='text' name='word' value='' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno}&now_page=${param.now_page }'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>

  
  <script src="/ckeditor/ckeditor.js"></script>
  <script>
  CKEDITOR.replace( 'editor', {
	    filebrowserUploadUrl: '/guin_c/test.do',
      height: '500px'
	}).on('fileUploadResponse', function (evt) {
          var xhr = evt.data.fileLoader.xhr;
          if (xhr.status === 200) {
            var responseJson = JSON.parse(xhr.responseText);
            // JSON 문자열 파싱 후 사용할 코드 작성
            console.log('이미지 업로드 결과:', responseJson.url);

            file1 = file1  + responseJson.file1 + "---";
            file1saved = file1saved + responseJson.file1saved + "---";
            size1 = size1  + responseJson.size1

            console.log('사이즈:', size1);

            
            $("#file1").val(file1); // 업로드된 이미지 정보를 input 태그에 저장
            $("#file1saved").val(file1saved); // 업로드된 이미지 정보를 input 태그에 저장
            $("#size").val(size1); // 업로드된 이미지 정보를 input 태그에 저장
          } else {
            console.error('이미지 업로드 실패:', xhr.status);
          }
        });
  </script>
  

  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
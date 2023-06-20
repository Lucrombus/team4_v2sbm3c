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
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>이력서 > 새 이력서 등록</DIV>

<DIV class='content_body'>
  
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="${sessionScope.memberno}">
    <input type="hidden" name="name" value="${member.name}">
    <input type="hidden" name="gender" value="${member.gender}">
    <input type="hidden" name="birth" value="${member.birth}">
    <input type="hidden" name="education" value="${member.education}">
    <input type="hidden" name="file1" value="" id="file1">
    <input type="hidden" name="file1saved" value="" id="file1saved">
    <input type="hidden" name="size1" value="0" id="size1">
    
    <div>
       <label>증명사진</label>
       <input type='file' class="form-control" name='file1MF' id='file1MF' 
                 value='' placeholder="파일 선택">
    </div>  

    <div>
       <label>제목</label>
       <input type='text' name='title' value='' required="required" 
              placeholder="ex) 언제나 일할 준비가 되어있는 신입입니다." 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>자기소개서</label>
       <textarea name='intro' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
    </div>
    <div>
       <label>희망 업무</label>
       <input type='text' name='wantjob' value='' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>   
    <div>
       <label>경력</label>
       <input type='text' name='career' value='' required="required" 
              placeholder="ex) 편의점 경력 3년" 
                  class="form-control" style='width: 100%;'></textarea>
    </div>  
    <div>
       <label>보유 기술</label>
       <input type='text' name='skills' value='' required="required" 
              placeholder="ex) 1종 보통 운전면허 보유" 
                  class="form-control" style='width: 100%;'></textarea>
    </div>  
    <div>
       <label>언어 능력</label>
       <input type='text' name='langskill' value='' required="required" 
              placeholder="ex) 영어회화 가능, 토익 650" 
                  class="form-control" style='width: 100%;'></textarea>
    </div>  
    
    <br>
    <div>
       <label>연락처</label>
       <input type='text' name='tel' value='010' required="required" 
                  class="form-control" style='width: 100%;'></textarea>
    </div>
    <div>
       <label>주소</label>
       <input type='text' name='address' value='' required="required" 
                  class="form-control" style='width: 100%;'></textarea>
    </div>  
    
    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_all.do??memberno=${sessionScope.memberno }'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


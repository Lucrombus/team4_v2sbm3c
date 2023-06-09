<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바 지옥몬 0.1</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'> 문의 글 등록</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="${param.memberno}"> <!-- 세션 멤버번호 -->
    
    <div>
       <label>문의명</label>
       <input type='text' name='inquiryTitle' maxlength='50' value='' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>문의 내용</label>
       <textarea name='inquiryReason' maxlength='333' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
    </div>
    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-info btn-sm">등록</button>
      <button type="button" onclick="history.back()" class="btn btn-info btn-sm">취소</button>
    </div>
    
    <input type="hidden" name="rdate" value="${sysdate}"> <!-- 세션 멤버번호 -->
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

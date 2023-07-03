<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>알바지옥몬 0.1</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head> 
  
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>
    회원 아이디 찾기
  </DIV>

  <DIV class='content_body'>
    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
    <div style='width: 40%; margin: 0px auto;'>  
    <FORM name='frm' id='frm' method='POST' action='./find_id.do' >      
        
      <div class="form-group">
        <br>
        <label>이름</label>    
        <input type='text' class="form-control" name='name' 
                    id='name' value='' required="required" style='width: 70%;' placeholder="이름">
      </div>   
                      
      <div class="form-group">
        <label>전화번호 </label>
        <input type='text' class="form-control" name='tel' id='tel' value='' required="required" style='width: 70%;' placeholder="전화번호"><br>
        휴대폰 번호를 - 사용하여 입력해 주세요.
      </div>   

      <div class="form_input">
        <button type="submit"  class="btn btn-info btn-sm">찾기</button>
        <button type="button" onclick="history.back()" class="btn btn-info btn-sm">취소</button>
      </div>   

    </FORM>
    </div>
  
</DIV> <%--  <DIV class='content_body'> END --%>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
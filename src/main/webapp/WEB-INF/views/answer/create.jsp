<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="inquiryno" value="${inquiryVO.inquiryno }" />
<c:set var="inquiryTitle" value="${inquiryVO.inquiryTitle }" />        
<c:set var="inquiryReason" value="${inquiryVO.inquiryReason }" />
<c:set var="rdate" value="${inquiryVO.rdate }" />


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
 
<DIV class='title_line'> 답변 등록</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>
  
  <fieldset class="fieldset_basic">
      <div class="li_none">
        <DIV style="width: 100%; word-break: break-all;">

          <span style="font-size: 1.5em; font-weight: bold;">제목 - ${inquiryTitle }</span><br>
          <div style="font-size: 1em;">${f.apply(inquiryVO.memberno) } / ${rdate }</div><br>
          ${inquiryReason }
        </DIV>
      </div>
      
  </fieldset>
  
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="${sessionScope.memberno}"> <!-- 세션 멤버번호 -->
    <input type="hidden" name="inquiryno" value="${param.inquiryno}"> <!-- 해당 문의 번호 -->
    
    <div>
       <label>답변 내용</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
    </div>
    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-info btn-sm">등록</button>
      <button type="button" onclick="history.back()" class="btn btn-info btn-sm">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


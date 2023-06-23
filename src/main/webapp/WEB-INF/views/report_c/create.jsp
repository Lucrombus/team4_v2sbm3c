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
 
<DIV class='title_line'>
<A href="./list_all.do?memberno=${sessionScope.memberno }&now_page=1" class='title_link'>내 신고내역 </a> > 새 신고 등록</DIV>

<DIV class='content_body'>
  
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="${sessionScope.memberno}"> <!-- 세션 멤버번호 -->
    <input type="hidden" name="contentsno" value="${param.contentsno}"> <!-- 콘텐츠 번호 -->

    <div>
       <label>신고할 컨텐츠</label><br>
       <A href="/contents/read.do?contentsno=${ContentsVO.contentsno }&boardno=${BoardVO.boardno }&now_page=${now_page }" class='title_link'>글 : ${contentsno }</A>
    </div>
    <br>
    <div>
       <label>신고 사유 :</label>
       <textarea name='reason' required="required" class="form-control" 
          autofocus="autofocus"  rows="12" style='width: 100%;'></textarea>
    </div>
    <li>*허위 신고 적발시 이용에 제한이 있을 수 있습니다.</li>
    
    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록하기</button>
      <button type="button" onclick="history.back()" class="btn btn-primary">돌아가기</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


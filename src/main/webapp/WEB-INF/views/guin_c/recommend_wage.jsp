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
<h4>${memberVO.name} 회원님을 위한 ${jobcateVO.name } 업종의 추천 회사 </h4> 
      
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
  
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.member_id != null }">
      <%--
      http://localhost:9093/guin_c/create.do?jobcateno=1
      http://localhost:9093/guin_c/create.do?jobcateno=2
      http://localhost:909#/guin_c/create.do?jobcateno=3
      --%>

      <span class='menu_divide' >│</span>
    </c:if>
  </ASIDE>
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./recommend_wage.do'>
      <input type='hidden' name='jobcateno' value='${jobcateVO.jobcateno }'>  <%-- 게시판의 구분 --%>
      
  
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
      <c:forEach var="guin_cVO" items="${list }" varStatus="status">
        <c:set var="title" value="${guin_cVO.title }" />
        <c:set var="content" value="${guin_cVO.content }" />
        <c:set var="jobcateno" value="${guin_cVO.jobcateno }" />
        <c:set var="guin_cno" value="${guin_cVO.guin_cno }" />
        <c:set var="thumb1" value="${guin_cVO.thumb1 }" />
        <c:set var="rdate" value="${guin_cVO.rdate }" />
        <c:set var="memberno" value="${guin_cVO.memberno }" />
        <c:set var="viewcnt" value="${guin_cVO.viewcnt }" />
        
      <%-- 하나의 행에 이미지를 5개씩 출력후 행 변경, index는 0부터 시작 --%>
      <c:if test="${status.index % 5 == 0 && status.index != 0 }"> 
        <HR class='menu_line'> <%-- 줄바꿈 --%>
      </c:if>
        
      <!-- 4기준 하나의 이미지, 24 * 4 = 96% -->
      <!-- 5기준 하나의 이미지, 19.2 * 5 = 96% -->
      <div onclick="location.href='./read.do?guin_cno=${guin_cno }&word=${param.word }&now_page=${param.now_page == null ? 1 : param.now_page }'" class='hover'  
             style='width: 19%; height: 216px; float: left; margin: 0.5%; padding: 0.1%; background-color: #EEEFFF; text-align: left;'>
        
        <c:choose> 
          <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
            <%-- registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
            <img src="/contents/storage/${thumb1 }" style="width: 100%; height: 140px;">
          </c:when>
          <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/contents/images/none1.png -->
            <IMG src="/contents/images/none1.png" style="width: 100%; height: 140px;">
          </c:otherwise>
        </c:choose>
        
        <strong>
          ${title}
        </strong>
        <br>
 
      </div>
      
    </c:forEach>
  </div>  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


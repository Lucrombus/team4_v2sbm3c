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
<A href="./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno }&now_page=1" class='title_link'>${param.jobcateno != 0 ? jobcateVO.name : "전체보기" } 구인</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right" style="padding-bottom: 10px;">
    <c:if test="${sessionScope.id != null}">
     <A href="./create.do?jobcateno=${param.jobcateno }&now_page=${param.now_page }">등록</A>
     <span class='menu_divide' >│</span>
    </c:if>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_jobcateno_search_paging.do'>
      <input type='hidden' name='jobcateno' value='${param.jobcateno }'>  <%-- 게시판의 구분 --%>
      <input type='hidden' name='now_page' value='1'>  <%-- 검색기본 시작 페이지 --%>
      
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
        <button type='button' class='btn btn-info btn-sm'
                     onclick="location.href='./list_by_jobcateno_search_paging.do?jobcateno=${param.jobcateno}&now_page=1&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 5%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 5%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>

    <thead>
      <tr >
        <th style='text-align: center;'>번호</th>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>기타</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>작성자</th>
      </tr>
    
    </thead>
    
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
            <a href="./read.do?guin_cno=${guin_cno}&jobcateno=${param.jobcateno}&now_page=${param.now_page}&word=${param.word}"><strong>${title}</strong>  
            </a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            <A href="/guin_c/map.do?jobcateno=${param.jobcateno }&guin_cno=${guin_cno}&now_page=${param.now_page}" title="지도"><IMG src="/contents/images/map.png" class="icon"></A>
            <c:choose>
              <c:when test= "${guin_cVO.getLike_w() eq 'Y' }">
                <A href="./like_n.do?jobcateno=${jobcateVO.getJobcateno() }&guin_cno=${guin_cno }" title="관심 구인 해제 하기"><IMG src="/like_guin/images/like_y.png" class="icon"></A>
              </c:when>
              <c:otherwise>
                <A href="./like_y.do?jobcateno=${jobcateVO.getJobcateno() }&guin_cno=${guin_cno }" title="관심 구인 등록 하기"><IMG src="/like_guin/images/like_n.png" class="icon"></A>
              </c:otherwise>
            </c:choose>
          </td>
          <td style='vertical-align: middle; text-align: center;'>
          ${rdate }
          </td>
           <td style='vertical-align: middle; text-align: center; font-weight:bold;'>
          ${f.apply(memberno) }
          </td>
        </tr>
        
      </c:forEach>


    </tbody>
  </table>
   <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
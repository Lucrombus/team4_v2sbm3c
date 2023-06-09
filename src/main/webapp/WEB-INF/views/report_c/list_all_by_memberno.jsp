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
<a href="/report_c/list_all_by_memberno.do?memberno=${memberno }"><span style="font-size:20px; font-weight:bold;">게시글 신고 조회 </span></a>
</DIV>
<!-- ------------------------------------------------------ -->
<DIV style='width: 50%; margin: 30px auto; text-align: center;'>
        <table class="table table-hover table-bordered table-sm" style="width: 100%;">
            <colgroup>
                <col style='width: 10%;' />
                <col style='width: 50%;' />
                <col style='width: 20%;' />
                <col style='width: 10%;' />
            </colgroup>

            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">신고된 게시글 제목</th>
                    <th scope="col">날짜</th>
                    <th scope="col">처리여부</th>
                </tr>
            </thead>


            <tbody>
            <c:if test="${list[0]== null}">
            <tr>
            <td colspan="5">
            게시글 신고 내역이 없습니다!
            </td>
            </tr>
            </c:if>
            
            <c:forEach var="report_cVO" items="${list }">
              <tr onclick="location.href='/report_c/read.do?reportno=${report_cVO.reportno }'" class="hover">
                <td>${report_cVO.reportno  }</td>
                <td>${f.apply(report_cVO.contentsno).title }</td>
                <td>${report_cVO.rdate }</td>
                <c:if test="${report_cVO.done == 'Y' }">
                  <td style="color: Green;">처리 완료</td>
                </c:if>
                <c:if test="${report_cVO.done == 'N' }">
                  <td style="color: Red;">대기중</td>
                </c:if>
              </tr>
            </c:forEach>
            
             
            </tbody>
        </table>
    </DIV>
<!-- ------------------------------------------------------ -->
  
  
  
   <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
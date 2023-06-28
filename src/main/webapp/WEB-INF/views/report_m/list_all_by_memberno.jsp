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
<a href="/report_m/list_all_by_memberno.do?memberno=${memberno }"><span style="font-size:20px; font-weight:bold;">내 신고 조회 </span></a>
<span class='menu_divide' >│</span>
<a href="/report_m/create.do"><span style="font-size:20px; color:#A4A4A4;">회원 신고하기 </span></a>
</DIV>
<!-- ------------------------------------------------------ -->
<DIV style='width: 50%; margin: 30px auto; text-align: center;'>
        <table class="table table-hover table-bordered table-sm" style="width: 100%;">
            <colgroup>
                <col style='width: 10%;' />
                <col style='width: 50%;' />
                <col style='width: 10%;' />
                <col style='width: 20%;' />
                <col style='width: 10%;' />
            </colgroup>

            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">신고대상</th>
                    <th scope="col">날짜</th>
                    <th scope="col">처리여부</th>
                </tr>
            </thead>


            <tbody>
            <c:if test="${list[0]== null}">
            <tr>
            <td colspan="5">
            회원 신고 내역이 없습니다!
            </td>
            </tr>
            </c:if>
            
            <c:forEach var="report_mVO" items="${list }">
              <tr onclick="location.href='/message/read.do?messageno=${MessageVO.messageno }'" class="hover">
                <td>${report_mVO.reportno  }</td>
                <td>${report_mVO.title}</td>
                <td>${(report_mVO.target_mno).id }</td>
                <td>${report_mVO.rdate }</td>
                <td>${report_mVO.done }</td>
              </tr>
            </c:forEach>
            
             
            </tbody>
        </table>
    </DIV>
<!-- ------------------------------------------------------ -->
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 5%;"></col>

    </colgroup>

    <thead>
      <tr >
        <th style='text-align: center;'>신고번호</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성일</th>
        <th style='text-align: center;'>신고된 회원번호</th>
        <th style='text-align: center;'>신고자</th>

      </tr>
    
    </thead>
    
    <tbody>
      <c:forEach var="report_mVO" items="${list }"> <!-- 값 불러오기!!!!!!!!!!!! -->
        <c:set var="reportno" value="${report_mVO.reportno }" />
        <c:set var="memberno" value="${report_mVO.memberno }" />
        <c:set var="target_mno" value="${report_mVO.target_mno }" />
        <c:set var="title" value="${report_mVO.title }" />
        <c:set var="reason" value="${report_mVO.reason }" />
        <c:set var="rdate" value="${report_mVO.rdate }" />




        
        <tr style="height:50px;">
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${reportno}
          </td>
          <td style='vertical-align: middle;  font-weight:bold;'>
            <a href="./read.do?reportno=${reportno}"><strong>${title }</strong></a> 
          </td>
          <td style='vertical-align: middle; text-align: center;'>
          ${rdate }
          </td>
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${target_mno }
          </td>
          <td style='vertical-align: middle; text-align: center; font-size: 17px;'>
          ${id }
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
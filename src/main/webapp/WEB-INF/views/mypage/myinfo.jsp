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
  
  <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="rankno" value ="${memberVO.rankno}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="name" value ="${memberVO.name}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="experience" value ="${memberVO.experience}" />
      <c:set var="gender" value ="${memberVO.gender}" />
      <c:set var="birth" value ="${memberVO.birth}" />
      <c:set var="rdate" value ="${memberVO.rdate}" />
  </c:forEach>
  
  <DIV class='title_line'>내 정보</DIV>
  <table class="table_myinfo" style='width: 50%;'>
    <tr>
      <th>아이디</th>
      <td>${memberVO.id}</td>
    </tr>
    <tr>
      <th>성명</th>
      <td>${memberVO.name}</td>
    </tr>
    </tr>
      <th>성별</th>
      <td>${memberVO.gender}</td>
    </tr>
    </tr>
      <th>생년월일</th>
      <td>${memberVO.birth.substring(0, 10)}</td>
    </tr>
    </tr>
      <th>전화번호</th>
      <td>${memberVO.tel}</td>
    </tr>
    </tr>
      <th>가입일</th>
      <td>${memberVO.rdate.substring(0, 10)}</td>
    </tr>
    </tr>
      <th>등급</th>
      <td>
        <c:choose>
          <c:when test="${memberVO.rankno == 1}">관리자</c:when> <%-- static 기준 --%>
          <c:when test="${memberVO.rankno == 2}">개인 회원</c:when>
          <c:when test="${memberVO.rankno == 3}">기업 회원</c:when>
        </c:choose>
      </td>
    </tr>
    </tr>
      <th>학력</th>
      <td>${memberVO.education}</td>
    </tr>
    </tr>
      <th>경력 여부</th>
      <td>${memberVO.experience}</td>
    </tr>
  </table>
  
  <div style=" text-align: center;">
    <button type='button' onclick="location.href='/member/read.do?memberno=${sessionScope.memberno }'" class="btn btn-info">수정하기</button>
    <button type='button' onclick="location.href='/mypage/mypage_main.do?memberno=${sessionScope.memberno }'" class="btn btn-info">뒤로가기</button>
    <button type='button' onclick="location.href='/member/delete_member.do?memberno=${sessionScope.memberno }'" class="btn btn-info">탈퇴하기</button>
  </div>
    
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
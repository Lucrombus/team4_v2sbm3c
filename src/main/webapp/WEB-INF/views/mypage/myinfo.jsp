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
  <DIV class='title_line'>내 정보</DIV>
  <table class="table_myinfo" style='width: 50%;'>
    <tr>
      <th>아이디</th>
      <td><A href="./passwd_update.do?memberno=${memberno}"></A></td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td>내용</td>
    </tr>
      <th>성명</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>성별</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>생년월일</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>전화번호</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>가입일</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>등급</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>학력</th>
      <td>내용</td>
    </tr>
    </tr>
      <th>경력 여부</th>
      <td>내용</td>
    </tr>
    
  </table>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
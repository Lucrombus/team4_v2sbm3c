<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="dev.mvc.jobcate.JobcateVO" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/cate/read.jsp?cateno=1</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<DIV style="font-size: 20px;">
<% JobcateVO jobcateVO = (JobcateVO) request.getAttribute("jobcateVO"); %>

 cateno:<%= jobcateVO.getJobcateno() %><br>
 name:<%= jobcateVO.getName() %><br>
</DIV>
</body>
</html>


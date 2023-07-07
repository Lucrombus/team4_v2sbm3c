<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
      <c:forEach var="guin_cVO" items="${list_wage }" varStatus="status">
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
      <div onclick="location.href='./guin_c/read.do?guin_cno=${guin_cno}&jobcateno=${jobcateno}'" class='hover'  
             style='width: 19%; height: 206px; float: left; margin: 0.5%; padding: 0.1%; background-color: #EEEFFF; text-align: left;'>
        
        <c:choose> 
          <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
            <%-- registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
            <img src="/guin_c/storage/${thumb1 }" style="width: 100%; height: 140px;">
          </c:when>
          <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/contents/images/none1.png -->
            <IMG src="/contents/images/none1.png" style="width: 100%; height: 140px;">
          </c:otherwise>
        </c:choose>
        
        <strong>
          <c:choose>
            <c:when test="${title.length() > 20 }"> <%-- 25 이상이면 25자만 출력, 공백:&nbsp; 6자 --%>
              ${title.substring(0, 20)}...
            </c:when>
            <c:when test="${title.length() <= 20 }">
              ${title}
            </c:when>
          </c:choose>
        </strong>
        <br>
 
      </div>
      
    </c:forEach>
  </div>  

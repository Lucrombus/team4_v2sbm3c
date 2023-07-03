<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="resumeno" value="${resumeVO.resumeno }" />
<c:set var="title" value="${resumeVO.title }" />        
<c:set var="file1" value="${resumeVO.file1 }" />
<c:set var="file1saved" value="${resumeVO.file1saved }" />
<c:set var="thumb1" value="${resumeVO.thumb1 }" />
<c:set var="intro" value="${resumeVO.intro }" />
<c:set var="tel" value="${resumeVO.tel }" />
<c:set var="address" value="${resumeVO.address }" />
<c:set var="career" value="${resumeVO.career }" />
<c:set var="skills" value="${resumeVO.skills }" />
<c:set var="langskill" value="${resumeVO.langskill }" />
<c:set var="wantjob" value="${resumeVO.wantjob }" />
<c:set var="size1_label" value="${resumeVO.size1_label }" />
<c:set var="rdate" value="${resumeVO.rdate.substring(0, 16) }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바지옥몬0.1</title>
 
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> <!-- top 메뉴 drop down 버튼 스크립트를 작동하게 함 -->
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
<A href="./list_by_memberno_search_paging.do?memberno=${sessionScope.memberno }&now_page=1" class='title_link'>내 이력서 </a> > 
<A href="./read.do?resumeno=${resumeno }" class='title_link'>${title }</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 회원 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.rankno == 2}">
      <A href="./create.do">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?resumeno=${resumeno}">글 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?resumeno=${resumeno}">파일 수정</A>  
      <span class='menu_divide' >│</span>
      <A href="./delete.do?resumeno=${resumeno}">삭제</A>  
      <span class='menu_divide' >│</span>
    </c:if>

    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <table class="table table-bordered" style="width: 100%; word-break: break-all;">
          <tr style="width: 100%">
            <td colspan="2" style="font-size: 1.5em; font-weight: bold;">${title }<br><div style="font-size: 0.75em">작성일자 ｜ ${rdate }</div></td>
            <td rowspan="1" style="width: 10%; vertical-align: top;">
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                  <%-- /static/resume/storage/ --%>
                  <img src="/resume/storage/${file1saved }" class="img-fluid">
                </c:when>
                <c:otherwise> <!-- 기본 이미지 출력 -->
                  <img src="/resume/images/none1.png" class="img-fluid">
                </c:otherwise>
              </c:choose>
            </td>
            
          </tr>

            

          <tr>
            <td style="width: 15%;">👨‍🦲 이름:</td>
            <td>${name }</td>
          </tr>
          <tr>
            <td>🚻 성별:</td>
            <td>${gender }</td>
          </tr>
          <tr>
            <td>👶 생일:</td>
            <td>${birth }</td>
          </tr>
          <tr>
            <td>‍👨‍🎓 학력:</td>
            <td>${education }</td>
          </tr>
          <tr>
            <td>📞 전화번호:</td>
            <td>${tel }</td>
          </tr>
          <tr>
            <td>🌏 주소:</td>
            <td>${address }</td>
          </tr>
          <tr>
            <td>👨‍🔧 희망직종:</td>
            <td>${wantjob }</td>
          </tr>
          <tr>
            <td>💪 경력:</td>
            <td>${career }</td>
          </tr>
          <tr>
            <td>🦾 보유기술(자격증):</td>
            <td>${skills }</td>
          </tr>
          <tr>
            <td>👄 언어능력:</td>
            <td>${langskill }</td>
          </tr>
          <tr>
            <td>😊 자기소개:</td>
            <td>${intro }</td>
          </tr>
      
          
        </table>
      </li>
            
      
      <div class='menu_line'></div>
      
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }"> <%-- ServletRegister.java: registrationBean.addUrlMappings("/download"); --%>
            첨부 파일: <a href='/download?dir=/resume/storage&filename=${file1saved}&downname=${file1}'>${file1}</a> (${size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>



<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>알바 지옥몬 0.1</title>
<%-- /static/css/style.css --%> 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head> 
<body>
<c:import url="/menu/top.do" />

<DIV class='title_line'>알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">${param.name }님(${param.id }) 회원 가입을 축하합니다.</span>
          </LI>  
          <LI class='li_none'>
            <button type='button' 
                         onclick="location.href='./login.do?id=${param.id}'"
                         class="btn btn-info btn-sm">로그인</button>
          </LI> 
        </c:when>
        
        <c:when test="${param.code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">회원 가입에 실패했습니다. 다시 시도해주세요.</span>
          </LI>                                                                      
        </c:when>
        
        <c:when test="${param.code == 'exist_id'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">이미 존재하는 아이디 입니다. 중복 확인 후 다시 시도해주세요.</span>
          </LI>                                                                      
        </c:when>
        
        <c:when test="${param.code == 'exist_tel'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">이미 회원 가입한 아이디 입니다. 전화번호는 하나만 사용하실 수 있습니다.</span>
          </LI>                                                                      
        </c:when>

        <c:when test="${param.code == 'update_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">${param.name }님(아이디: ${param.id }) 회원 정보를 변경했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
            <button type='button' 
                         onclick="location.href='/member/list.do'"
                         class="btn btn-info btn-sm">회원 목록</button>                   
          </LI>                                                                       
        </c:when>
                
        <c:when test="${param.code == 'update_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">${param.name }님(${param.id }) 회원 정보 수정에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        
        <c:when test="${param.code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">${param.name }님(${param.id }) 회원 정보 삭제에 성공했습니다.</span>
          </LI>   
          <LI class='li_none'>
            <button type='button' 
                         onclick="location.href='/member/list.do'"
                         class="btn btn-info btn-sm">회원 목록</button>
          </LI>                                                                     
        </c:when>    
            
        <c:when test="${code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">${param.name }님(${param.id }) 회원 정보 삭제에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        
        <c:when test="${param.code == 'passwd_update_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">${param.name }님(${param.id }) 패스워드를 변경했습니다.</span>
          </LI>   
          <LI class='li_none'>
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">확인</button>
          </LI>                                                                     
        </c:when>   
        
        <c:when test="${code == 'passwd_update_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">${param.name }님(${param.id }) 패스워드 변경에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>  
        
        <c:when test="${param.code == 'suspend_member_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">회원 정지에 성공했습니다.</span>
          </LI>
          <LI class='li_none'>  
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
          </LI>                                                                    
        </c:when>    
            
        <c:when test="${code == 'suspend_member_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">회원 정지에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        
        <c:when test="${param.code == 'find_id_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">${param.name }님의 아이디는 ${param.id }입니다.</span>
          </LI>
          <LI class='li_none'>  
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
          </LI>                                                                    
        </c:when>    
            
        <c:when test="${code == 'find_id_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">아이디 찾기에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        
        <c:when test="${param.code == 'find_passwd_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">${param.name }(${param.id })님의 비밀번호는 ${param.passwd }입니다.</span>
          </LI>
          <LI class='li_none'>  
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
          </LI>                                                                    
        </c:when>    
            
        <c:when test="${code == 'find_passwd_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">비밀번호 찾기에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        
        <c:when test="${param.code == 'delete_member_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">회원 탈퇴에 성공했습니다.</span>
          </LI>
          <LI class='li_none'>  
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
          </LI>                                                                    
        </c:when>    
            
        <c:when test="${code == 'delete_member_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">${param.name }님(${param.id }) 회원 탈퇴에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        
        <c:when test="${param.code == 'suspend_member'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">탈퇴 회원은 로그인 하실 수 없습니다.</span>
          </LI>
          <LI class='li_none'>  
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
          </LI>                                                                    
        </c:when>    
            
        <c:when test="${param.code == 'pause_member'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">정지 회원은 로그인 하실 수 없습니다.</span>
          </LI>
          <LI class='li_none'>  
            <button type='button' 
                         onclick="location.href='/'"
                         class="btn btn-info btn-sm">시작 화면</button>
          </LI>                                                                          
        </c:when> 
        
        
        
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
        
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${param.cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn btn-info btn-sm">다시 시도</button>    
            </c:when>
        </c:choose>
        
        <%-- <a href="./list_by_cateno.do?cateno=${param.cateno}" class="btn btn-primary">목록</a> --%>
        <%-- <button type='button' onclick="location.href='./list_by_cateno_search.do?cateno=${param.cateno}'" class="btn btn-primary">목록</button> --%>
        <%-- <button type='button' onclick="location.href='./list_by_cateno_search_paging.do?cateno=${param.cateno}'" class="btn btn-primary">목록</button> --%>

      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
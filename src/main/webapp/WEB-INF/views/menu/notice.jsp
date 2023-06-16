<%@ page contentType="text/html; charset=UTF-8" %>
 
  </DIV> <%-- content 내용 종료 --%>

  
  <%-- 공지사항 --%>
  <div style = 'text-align: center'><h1>공지사항</h1></div>
  <DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <c:choose>
        <c:when test="${sessionScope.admin_id != null }">
          <col style="width: 10%;"></col>
          <col style="width: 80%;"></col>
          <col style="width: 10%;"></col>        
        </c:when>
        <c:otherwise>
          <col style="width: 10%;"></col>
          <col style="width: 90%;"></col>
        </c:otherwise>
      </c:choose>
    </colgroup>

<!--     <thead>
      <tr>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    
    </thead> -->
    
    <tbody>
      <c:forEach var="contentsVO" items="${list}">
        <c:set var="title" value="${contentsVO.title }" />
        <c:set var="content" value="${contentsVO.content }" />
        <c:set var="cateno" value="${contentsVO.cateno }" />
        <c:set var="contentsno" value="${contentsVO.contentsno }" />
        <c:set var="thumb1" value="${contentsVO.thumb1 }" />
        
        <tr style="height: 112px;" onclick="location.href='./read.do?contentsno=${contentsno }&now_page=${param.now_page == null ? 1 : param.now_page}'" class='hover'>
          <td style='vertical-align: middle; text-align: center; '>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
                <%-- registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
                <img src="/contents/storage/${thumb1 }" style="width: 120px; height: 90px;">
              </c:when>
              <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/contents/images/none1.png -->
                <IMG src="/contents/images/none1.png" style="width: 120px; height: 90px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <div style='font-weight: bold;'>${title }</div>
            <c:choose> 
              <c:when test="${content.length() > 160 }"> <%-- 160자 이상이면 160자만 출력 --%>
                  ${content.substring(0, 160)}.....
              </c:when>
              <c:when test="${content.length() <= 160 }">
                  ${content}
              </c:when>
            </c:choose>
          </td>
          
          <c:choose>
            <c:when test="${sessionScope.admin_id != null }"> 
              <td style='vertical-align: middle; text-align: center;'>
                <A href="/contents/map.do?cateno=${cateno }&contentsno=${contentsno}&now_page=${param.now_page == null ? 1 : param.now_page}" title="지도"><IMG src="/contents/images/map.png" class="icon"></A>
                <A href="/contents/youtube.do?cateno=${cateno }&contentsno=${contentsno}&now_page=${param.now_page == null ? 1 : param.now_page}" title="Youtube"><IMG src="/contents/images/youtube.png" class="icon"></A>
                <A href="/contents/delete.do?cateno=${cateno }&contentsno=${contentsno}&now_page=${param.now_page == null ? 1 : param.now_page}" title="삭제"><IMG src="/contents/images/delete.png" class="icon"></A>
              </td>
            </c:when>
            <c:otherwise>
            
            </c:otherwise>
          </c:choose>
                    
        </tr>
        
      </c:forEach>

    </tbody>
  </table>
</DIV>
  
</DIV> <%-- container_main 종료 --%>


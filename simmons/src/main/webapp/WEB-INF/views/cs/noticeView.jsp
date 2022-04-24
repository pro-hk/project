<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<!-- main -->
    <main id="main">
      <div class="container">
        <!-- lnb -->
        <ul class="lnb">
          <li><a href="">HOME</a></li>
          <li><a href="">고객센터</a></li>
          <li><a href="">NOTICE VIEW</a></li>
        </ul>

		<div class="txtBox lineOff">
      <h1>고객센터</h1>
      <p>고객님의 질문에 성심껏 답변해 드리겠습니다</p>
    	</div>
	
		<div class="view">
			<div class="titleBox">
				<h2>${noticeDto.title }</h2>
				<p>${noticeDto.regDate.split(" ")[0] }</p>
			</div>
			<div class="contentsBox">
				${noticeDto.contents }
			</div>
	        <div class="pages">
	        		<c:if test="${not empty prevNoticeDto }">
	        		<div class="page">
	        			<div class="pageNav">
	        				<span class="material-icons">keyboard_arrow_up</span><span>이전</span>
	        			</div>
	        			<div class="pageTitle">
	        				<a href="NoticeView?no=${prevNoticeDto.no }&num=${param.num - 1}">${prevNoticeDto.title.split("]")[1] }</a>
	        			</div>
	        		</div>
	        		</c:if>
	        		<c:if test="${not empty nextNoticeDto }">
	        		<div class="page">
	        			<div class="pageNav">
	        				<span class="material-icons">keyboard_arrow_down</span><span>다음</span>
	        			</div>
	        			<div class="pageTitle">
	        				<a href="NoticeView?no=${nextNoticeDto.no }&num=${param.num + 1}">${nextNoticeDto.title.split("]")[1] }</a>
	        			</div>
	        		</div>
	        		</c:if>
	        </div>
	        <div class="btns">
	        	<a href="Notice" class="cancel">목록</a>
	        </div>
		</div>
      </div>
    </main>
    <!-- main end -->
    
<%@ include file="../include/footer.jsp" %>
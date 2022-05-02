<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main id="main">
	<div class="container">
	
	  <!-- 메인 화면 -->
	  <div class="txtBox lineOff managerTxtBox">
	    <h1>NOTICE</h1>
	  </div>
	
	  <!-- 상단 5개 선택 -->
	  <ul class="customerList managerList">
	    <li><a href="FaqList">FAQ</a></li>
	    <li><a href="QnaList">Q&A</a></li>
	    <li><a href="CounselList">1:1 전화상담 신청</a></li>
	    <li><a href="AsList">A/S 신청</a></li>
	    <li class="on"><a href="NoticeList">공지사항</a></li>
	  </ul>
	
	  <!-- contents / DB작업 -->
	  <div id="list">
  	<div class="list">
  		<div class="noReply">
  			<p>미답변 : ${noReply}</p>
  		</div>
		<div class="searchBox">
		  <select name="category" id="noticeListCategory">
		    <option value="" >선택</option>
	        <option value="title">제목</option>
	        <option value="contents">내용</option>
		  </select>
		  <input type="text" class="noticeListTxt" value="${param.txt }" placeholder="검색어를 입력하세요" />
		  <button class="noticeListSearch">검색</button>
		</div>
  	</div>
	    <table>
	      <colgroup>
	        <col style="width: 10%" />
	        <col />
	        <col style="width: 30%" />
	      </colgroup>
	      <tr>
	        <th>NO</th>
	        <th>TITLE</th>
	        <th>DATE</th>
	      </tr>
	      <c:forEach items="${noticeList}" var="noticeDto">
	      <tr>
	        <td>${noticeDto.num}</td>
	        <td class="left"><a href="NoticeView?no=${noticeDto.no }">${noticeDto.title}</a></td>
	        <fmt:parseDate value="${noticeDto.regDate}" var="regDate" pattern="yyyy-MM-dd HH:mm:ss"/>
	        <td><fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd"/></td>
	      </tr>
	      </c:forEach>
	    </table>
	    
	    <div class="write">
	    	<a href="NoticeWrite">글쓰기</a>
	    </div>
	    
	    <div class="page">
	      <span class="material-icons pageLeft"> arrow_left </span>
	      <ul>
	        <c:forEach items="${pageList }" var="pages">
      		<li class="${clickPage==pages? 'on' : '' }"><a href="NoticeList?page=${pages }&txt=${param.txt}&category=${param.option}">${pages }</a></li>
       		</c:forEach>
	      </ul>
	      <span class="material-icons pageRight"> arrow_right </span>
	    </div>
	  </div>
	  </div>
</main>
<!-- main end -->

<%@ include file="../include/footer.jsp" %>
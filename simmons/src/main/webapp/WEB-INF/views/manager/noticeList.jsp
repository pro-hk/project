<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main id="main">
	<div class="container">
	
	  <!-- 메인 화면 -->
	  <div class="txtBox lineOff">
	    <h1>고객센터</h1>
	  </div>
	
	  <!-- 상단 5개 선택 -->
	  <ul class="customerList">
	    <li><a href="FaqList">FAQ</a></li>
	    <li><a href="QnaList">Q&A</a></li>
	    <li><a href="CounselList">1:1 전화상담 신청</a></li>
	    <li><a href="AsList">A/S 신청</a></li>
	    <li class="on"><a href="NoticeList">공지사항</a></li>
	  </ul>
	
	  <!-- contents / DB작업 -->
	  <div class="customerContents notice">
	    <div class="searchBox">
	      <select name="" id="">
	        <option value="">선택</option>
	        <option value="title">제목</option>
	        <option value="contents">내용</option>
	      </select>
	      <input type="text" placeholder="검색어를 입력하세요" />
	      <button>검색</button>
	    </div>
	    <table>
	      <colgroup>
	        <col style="width: 70%" />
	        <col style="width: 30%" />
	      </colgroup>
	      <tr>
	        <th>제목</th>
	        <th>등록일</th>
	      </tr>
	      <c:forEach items="${noticeList}" var="noticeDto">
	      <tr>
	        <td class="left"><a href="NoticeView?no=${noticeDto.no }">${noticeDto.title}</a></td>
	        <td>${noticeDto.regDate }</td>
	      </tr>
	      </c:forEach>
	    </table>
	    
	    <div class="write">
	    	<a href="NoticeWrite">글쓰기</a>
	    </div>
	    
	    <div class="page">
	      <span class="material-icons"> arrow_left </span>
	      <ul>
	        <li class="on"><a href="">1</a></li>
	        <li><a href="">2</a></li>
	        <li><a href="">3</a></li>
	        <li><a href="">4</a></li>
	        <li><a href="">5</a></li>
	        <li><a href="">6</a></li>
	        <li><a href="">7</a></li>
	        <li><a href="">8</a></li>
	        <li><a href="">9</a></li>
	        <li><a href="">10</a></li>
	      </ul>
	      <span class="material-icons"> arrow_right </span>
	    </div>
	  </div>
	
	  <!-- 고객센터 하단 -->
	  <div class="customerCenter flex">
	    <div class="inner">
	      <h2>고객센터<span class="material-icons"> arrow_right </span><strong>1899-8182</strong></h2>
	      <p>평일 9시-18시 / 토요일.일요일.공휴일 휴무</p>
	    </div>
	    <div class="inner">
	      <h2>특판사업문의<span class="material-icons"> arrow_right </span><strong>1899-8182</strong></h2>
	      <p>E-mail : kbh@simmons.co.kr</p>
	    </div>
	  </div>
	</div>
	
	<!-- 탑 버튼 -->
	<div class="btnTop">
	  <a href=""><img src="../images/main/btn_top.png" alt="" /></a>
	</div>
</main>
<!-- main end -->

<%@ include file="../include/footer.jsp" %>
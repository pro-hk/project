<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<main id="main">
  <div class="container">
    <!-- lnb -->
    <ul class="lnb">
      <li><a href="">HOME</a></li>
      <li><a href="">고객센터</a></li>
    </ul>

    <!-- 메인 화면 -->
    <div class="txtBox lineOff">
      <h1>고객센터</h1>
      <p>고객님의 질문에 성심껏 답변해 드리겠습니다</p>
    </div>

    <!-- 상단 5개 선택 -->
    <ul class="customerList">
      <li><a href="Faq">FAQ</a></li>
      <li class="Qna"><a href="Qna">Q&A</a></li>
      <li><a href="Counsel">1:1 전화상담 신청</a></li>
      <li><a href="As">A/S 신청</a></li>
      <li class="on"><a href="Notice">공지사항</a></li>
    </ul>

    <!-- contents / DB작업 -->
    <div class="customerContents notice">
      <form action="Notice" method="get">
	      <div class="searchBox">
	        <select name="option" class="noticeOption">
	          <option value="">선택</option>
	          <option value="title" ${param.option=='title'? 'selected' : '' }>제목</option>
	          <option value="contents" ${param.option=='contents'? 'selected' : '' }>내용</option>
	        </select>
	        <input type="text" name="txt" class="noticeSearchTxt" value="${param.txt }" placeholder="검색어를 입력하세요" />
	        <button type="submit">검색</button>
	      </div>
      </form>
      <table id="noticeList">
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

      <div class="page">
        <span class="material-icons pageLeft"> arrow_left </span>
        <ul>
        	<c:forEach items="${pageList }" var="pages">
          		<li class="${clickPage==pages? 'on' : '' }"><a href="Notice?page=${pages }&txt=${param.txt}&option=${param.option}">${pages }</a></li>
        	</c:forEach>
        </ul>
        <span class="material-icons pageRight"> arrow_right </span>
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

<%@ include file="../include/login.jsp" %>
<%@ include file="../include/footer.jsp"%>

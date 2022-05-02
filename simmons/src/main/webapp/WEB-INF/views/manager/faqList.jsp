<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<main id="main">
  <div class="container">

  <!-- 메인 화면 -->
  <div class="txtBox lineOff managerTxtBox">
    <h1>FAQ</h1>
  </div>

  <!-- 상단 5개 선택 -->
  <ul class="customerList managerList">
    <li class="on"><a href="FaqList">FAQ</a></li>
    <li><a href="QnaList">Q&A</a></li>
    <li><a href="CounselList">1:1 전화상담 신청</a></li>
    <li><a href="AsList">A/S 신청</a></li>
    <li><a href="NoticeList">공지사항</a></li>
  </ul>

  <!-- contents / DB작업 -->
  <div id="list">
  <div class=list>
	<div class="searchBox">
	  <select id="faqListCategory">
	    <option value="">전체</option>
	    <option value="회원">회원</option>
	    <option value="상품문의">상품문의</option>
	    <option value="교환/환불/반품">교환/환불/반품</option>
	    <option value="주문/배송">주문/배송</option>
	    <option value="기타">기타</option>
	  </select>
	  <input type="text" class="faqListTxt" value="${param.txt }" placeholder="검색어를 입력하세요" />
	  <button class="faqListSearch">검색</button>
	</div>
	</div>
	<table>
	   <colgroup>
	    <col style="width: 10%" />
	    <col style="width: 20%" />
	    <col style="width: 70%" />
	  </colgroup>
	  <thead>
		  <tr class="listHead">
		    <th>NO</th>
		    <th>CATEGORY</th>
		    <th>QUESTION</th>
		  </tr>
	  </thead>
	  <tbody class="faqListContents">
		  <c:forEach items="${faqList}" var="faqDto" >
		  <tr>
		    <td>${faqDto.num}</td>
		    <td>${faqDto.category}</td>
		    <td><a href="FaqView?no=${faqDto.no}">${faqDto.question }</a></td>
		  </tr>
		  </c:forEach>
	  </tbody>
	</table>
	
	<div class="write">
    	<a href="FaqWrite">글쓰기</a>
    </div>
	
	<div class="page">
	  <span class="material-icons pageLeft"> arrow_left </span>
	  <ul>
	    <c:forEach items="${pageList }" var="pages">
      		<li class="${clickPage==pages? 'on' : '' }"><a href="FaqList?page=${pages }&txt=${param.txt}&category=${param.option}">${pages }</a></li>
       	</c:forEach>
	  </ul>
	  <span class="material-icons pageRight"> arrow_right </span>
	</div>
  </div>

  <!-- 고객센터 하단 -->
</div>
</main>


<%@ include file="../include/footer.jsp" %>
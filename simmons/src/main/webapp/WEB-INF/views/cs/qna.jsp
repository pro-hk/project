<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>

<!-- main -->
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
          <li class="on"><a href="Qna">Q&A</a></li>
          <li><a href="Counsel">1:1 전화상담 신청</a></li>
          <li><a href="As">A/S 신청</a></li>
          <li><a href="Notice">공지사항</a></li>
        </ul>

        <!-- contents / DB작업 -->
        <div class="customerContents qna">
          <form action="" method="">
            <table>
              <colgroup>
                <col style="width: 20%" />
                <col style="width: 60%" />
                <col style="width: 20%" />
              </colgroup>
              <thead>
                <tr>
                  <th>작성일</th>
                  <th>제목</th>
                  <th>답변상황</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                 <c:choose>
                 	<c:when test="${empty qnaList }">
                  		<td colspan="3">문의 내역이 존재하지 않습니다</td>
                 	</c:when>
                 	<c:otherwise>
                 		<c:forEach items="${qnaList}" var="qnaDto">
			                <tr>
			                  <td>${qnaDto.regDate }</td>
			                  <td><a href="QnaView?no=${qnaDto.no }">${qnaDto.title }</a></td>
			                  <td>${qnaDto.answer=='' or qnaDto.answer==null ? "X" : "O" }</td>
			                </tr>
                 		</c:forEach>
                 	</c:otherwise>
                 </c:choose>
              </tbody>
            </table>
            <a href="QnaWrite" class="apply">문의하기</a>
          </form>
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

<%@ include file="../include/footer.jsp"%>
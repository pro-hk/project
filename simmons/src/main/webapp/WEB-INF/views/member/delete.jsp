<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

 
<main id="main">
  <div class="container">
    <!-- lnb -->
    <ul class="lnb">
      <li><a href="">HOME</a></li>
      <li><a href="">로그인</a></li>
    </ul>

    <!-- 메인 화면 -->
    <div class="txtBox">
      <h1>회원탈퇴</h1>
      <p>시몬스를 방문해 주셔서 감사합니다.</p>
    </div>

    <!-- form -->
     <form action="DeleteProcess.do" method="post" id="login">
       <textarea class="deleteTextarea">사유를 작성해주세요</textarea>
       <div class="btns">
       		<button type="submit" class="confirm">신청하기</button>
       </div>
     </form>
     <!-- form end -->
    <!-- 고객센터 -->
    <div class="customerCenter">
      <h2>고객센터<span class="material-icons"> arrow_right </span><strong>1899-8182</strong></h2>
      <p>평일 9시-18시(점심 12-13시) / 토요일.일요일.공휴일 휴무</p>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp" %>
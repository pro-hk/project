<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

	<!-- main -->
	<main id="main">
	  <div class="container">
	    <!-- lnb -->
	<ul class="lnb">
	  <li><a href="">HOME</a></li>
	  <li><a href="">로그인</a></li>
	</ul>
	
	<!-- 메인 화면 -->
	<div class="txtBox">
	  <h1>로그인</h1>
	  <p>시몬스를 방문해 주셔서 감사합니다.</p>
	</div>
	
	<!-- form -->
	<form action="LoginProcess" method="post" id="login">
	  <input type="text" name="id" placeholder="아이디를 입력해주세요." />
	  <input type="password" name="password" placeholder="비밀번호를 입력해주세요." />
	  <button type="submit">로그인</button>
	
	  <!-- 아이디찾기/비밀번호찾기/회원가입 -->
	  <div class="etcLogin">
	    <a href="">아이디 찾기</a>
	    <a href="">비밀번호 찾기</a>
	    <a href="Join">회원가입</a>
	  </div>
	</form>
	<!-- form end -->
	<!-- 고객센터 -->
	    <div class="customerCenter">
	      <h2>고객센터<span class="material-icons"> arrow_right </span><strong>1899-8182</strong></h2>
	      <p>평일 9시-18시(점심 12-13시) / 토요일.일요일.공휴일 휴무</p>
	    </div>
	  </div>
	  
	  <!-- 탑 버튼 -->
      <div class="btnTop">
        <a href=""><img src="../images/main/btn_top.png" alt="" /></a>
      </div>
	</main>
	<!-- main end -->

<%@ include file="../include/footer.jsp" %>
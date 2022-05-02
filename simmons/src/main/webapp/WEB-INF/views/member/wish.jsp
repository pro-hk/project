<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<main>
  <div class="container" id="myPage">
    <ul class="home">
      <li>
        <a href="">HOME</a>
      </li>
      <li>
        <a href="">마이페이지</a>
      </li>
    </ul>
    <h2>마이페이지</h2>
    <p>회원님의 이용 현황을 한눈에 확인하실 수 있습니다.</p>
    <!-- 마이 서브 오더리스트 -->
    <div class="aaa">
    <div class="myInfo">
        <p>${loggedMemberDto.name } 님</p>
    </div>
    </div>
    <!-- 주문배송/위시/회원수정 -->
    <ul class="listGroup">
      <li>
          <a href="MyPage">주문/배송정보</a>
        </li>
        <li class="on">
          <a href="Wish">위시리스트</a>
        </li>
        <li>
          <a href="PwConfirm">회원정보 수정</a>
        </li>
    </ul>
    <div class="wishBox">
      <ul id="wishBox">
      	<c:forEach items="${wishList}" var="wish">
        <li>
          <a href="../product/Detail?no=${wish.no }">
          	<img class="imgBox" src="${wish.img }"  />
          </a>
          <input type="checkbox" class="delCheck" />
          <span class="name">${wish.pname }</span>
        </li>
      	</c:forEach>
      </ul>
    </div>
    <div class="btns del">
      <button class="confirm allSelect">전체 선택</button>	
      <button class="confirm wishDel">선택상품 삭제</button>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp" %>

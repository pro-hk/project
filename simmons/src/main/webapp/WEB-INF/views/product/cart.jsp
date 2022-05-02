<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ include file="../include/header.jsp" %>

<!-- main -->
<main id="main">
  <div class="container">
    <!-- lnb -->
    <ul class="lnb">
      <li><a href="">HOME</a></li>
      <li><a href="">CART</a></li>
    </ul>

    <!-- 메인 화면 -->
    <div class="txtBox lineOff">
      <h1>CART</h1>
      <p>고객님이 CART에 담은 상품입니다</p>
    </div>
    <p class="Cart">CART 내역</p>
    <div id="cart">
      <div id="cartList">
        <div class="top">
          <p><input type="checkbox" />전체</p>
          <p>상품정보</p>
          <p>상품금액</p>
          <p>수량</p>
          <p>주문금액</p>
        </div>
        <c:if test="${empty cartList }">
        	<p class="cartEmpty">장바구니에 담긴 상품이 없습니다.</p>
        </c:if>
		   <c:forEach items="${cartList}" var="cart">
		<ul class="cartContents">
		<li><input type="checkbox" /><a href="Detail?no=${cart.no }"><img src="${cart.img }" class="cartImg" /></a></li>
		<li><a href="Detail?no=${cart.no }">${cart.pname }</a></li>
		<li><span class="price">${cart.price }원</span></li>
		<li class="cartCount">
		  <div class="countBtn">
		   <button class="minusCart button">-</button>
		   <span>${cart.count }</span>
		   <button class="addCart button">+</button>
		  </div>
		  <button class="edit">수정</button>
		</li>
		<li><p>${price }원</p></li>
		</ul>
		</c:forEach>
        <div class="total">
	        <div>
	          <button class="cartDelete">선택 상품 삭제</button>
	        </div>
	        <div class="totalPrice">
	          <p>총 상품 금액 원 + 배송비 0원 =</p>
	          <p class="bottom">총 주문금액 <span><strong>3,340,000</strong>원</span></p>
	        </div>
      </div>
      <div class="btns">
        <button>계속 쇼핑</button>
        <button>선택상품 구매</button>
        <button>전체상품 구매</button>
      </div>
    </div>
  </div>
  </div>
</main>

<%@ include file="../include/footer.jsp" %>

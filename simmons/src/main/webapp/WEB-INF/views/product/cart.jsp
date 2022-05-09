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
          <p><input type="checkbox" class="cartAllCheck" />전체</p>
          <p>상품정보</p>
          <p>상품금액</p>
          <p>수량</p>
          <p>주문금액</p>
        </div>
        <c:set var="cartSum" value="0" />
		<ul class="cartContents">
        <c:if test="${empty cartList }">
        	<li class="cartEmpty">장바구니에 담긴 상품이 없습니다.</li>
        </c:if>
	    <c:forEach items="${cartList}" var="cart">
        <fmt:formatNumber value="${cart.price }" pattern="###,###,###" var="cartPrice" />	
        <fmt:formatNumber value="${cart.price * cart.count }" pattern="###,###,###" var="cartTotalPrice" />	
		<li>
			<div>
				<input type="checkbox" name="cart" />
				<a href="Detail?no=${cart.no }">
					<img src="${cart.img }" class="cartImg" />
				</a>
			</div>
			<div class="cartLink">
				<a href="Detail?no=${cart.no }">
					<span class="cartPname">${cart.pname }</span><br>
					<span class="cartSizes">${cart.sizes }</span>
				</a>
			</div>
			<div class="cartPrice">${cartPrice }원</div>
			<div class="cartCounts">
			   <button class="minusCart button">-</button>
			   <span class="cartNum">${cart.count }</span>
			   <button class="plusCart button">+</button>
			   <button class="cartEdit">수정</button>
			</div>
			<div class="cartTotalPrice">${cartTotalPrice }원</div>
		<input type="hidden" class="cartNo" value="${cart.no }" />
		<c:set var="cartSum" value="${cartSum + cart.price * cart.count }" />
		</li>
		</c:forEach>
		</ul>
        <div class="total">
	        <div>
	          <button class="cartDelete">선택 상품 삭제</button>
	        </div>
	        <div class="totalPrice">
	          <fmt:formatNumber value="${cartSum }" pattern="###,###,###" var="Sum" />
	          <p>총 상품 금액 <Strong>${Sum }</Strong>원 + 배송비 0원 =</p>
	          <p class="bottom">총 주문금액 <span><strong>${Sum }</strong>원</span></p>
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

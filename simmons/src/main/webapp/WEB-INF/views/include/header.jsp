<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>시몬스 침대(3조)</title>
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
    <link href="../css/reset.css" rel="stylesheet" />
    <link href="../css/swiper-bundle.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../summernote/summernote.min.css" rel="stylesheet" />
    <link href="../css/layout.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/aboutus.css" rel="stylesheet" />
    <link href="../css/product.css" rel="stylesheet" />
    <link href="../css/gallery.css" rel="stylesheet" />
    <link href="../css/factorium.css" rel="stylesheet" />
    <link href="../css/manager.css" rel="stylesheet" />
    <link href="../css/black.css" rel="stylesheet" />
    <link href="../css/collection.css" rel="stylesheet" />
    <link href="../css/find.css" rel="stylesheet" />
    <link href="../css/form.css" rel="stylesheet" />
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d020193b78b81197938ee704a364270&libraries=services"></script>
    <script src="../js/swiper-bundle.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../summernote/summernote.min.js"></script>
    <script src="../js/main.js" defer></script>
  </head>
  <body>
    <!-- a링크 주소 미입력 -->
    <header id="header">
      <!-- 좌측 메뉴 -->
      <div id="menu">
        <img src="../images/layout/header_menu.png" />
        <span>메뉴</span>
      </div>

      <!-- 숨겨진 좌측 메뉴 -->
      <div id="gnb">
        <ul class="gnbList">
          <!-- #lnb 이벤트 효과 다시 지정해야됨 -->
          <li>
            <a href="" class="openA">
              <span>Beautyrest BLACK</span>
              <img src="../images/layout/lnb_plus.png" class="imgOff" />
              <img src="../images/layout/lnb_minus.png" class="imgOn" />
            </a>
            <ul class="depth02">
              <li><a href="../black/Black">the BLACK</a></li>
              <li><a href="../black/Mattress">MATTRESS</a></li>
              <li><a href="../black/Foundation">FOUNDATION</a></li>
            </ul>
          </li>
          <li>
            <a href="" class="openA">
              <span>COLLECTION</span>
              <img src="../images/layout/lnb_plus.png" class="imgOff" />
              <img src="../images/layout/lnb_minus.png" class="imgOn" />
            </a>
            <ul class="depth02">
              <li><a href="../collection/Beautyrest">Beautyrest</a></li>
              <li><a href="../collection/N32">N32</a></li>
              <li><a href="../collection/Kenosha">KENOSHA</a></li>
            </ul>
          </li>
          <li>
            <a href="" class="openA">
              <span>PRODUCT</span>
              <img src="../images/layout/lnb_plus.png" class="imgOff" />
              <img src="../images/layout/lnb_minus.png" class="imgOn" />
            </a>
            <ul class="depth02">
              <li><a href="../product/Mattress">MATTRESS</a></li>
              <li><a href="../product/Frame">FRAME</a></li>
              <li><a href="../product/RoomSet">ROOM SET</a></li>
              <li><a href="../product/Foundation">FOUNDATION</a></li>
              <li><a href="../product/Furniture">FURNITURE</a></li>
              <li><a href="../product/Bedding">BEDDING</a></li>
              <li><a href="../product/Fragrance">FRAGRANCE</a></li>
            </ul>
          </li>
          <li><a href="">ONLINE STORE</a></li>
          <li><a href="">OUTLET</a></li>

          <!-- 가운데 밑줄 -->
          <div class="line"></div>

          <li>
            <a href="" class="openA">
              <span>ABOUT US</span>
              <img src="../images/layout/lnb_plus.png" class="imgOff" />
              <img src="../images/layout/lnb_minus.png" class="imgOn" />
            </a>
            <ul class="depth02">
              <li><a href="../aboutus/Heritage">HERITAGE</a></li>
              <li><a href="../aboutus/MediaTvc">MEDIA</a></li>
              <li><a href="../aboutus/Hotel">SIMMONS IN HOTEL</a></li>
            </ul>
          </li>
          <li>
            <a href="" class="openA">
              <span>SIMMONS Factorium</span>
              <img src="../images/layout/lnb_plus.png" class="imgOff" />
              <img src="../images/layout/lnb_minus.png" class="imgOn" />
            </a>
            <ul class="depth02">
              <li><a href="../factorium/Intro">INTRO</a></li>
              <li><a href="../factorium/Rnd">R&D</a></li>
              <li><a href="../factorium/Terrace">TERRACE</a></li>
              <li><a href="../factorium/Come">오시는길</a></li>
            </ul>
          </li>
          <li><a href="../Gallery/">SIMMONS GALLERY</a></li>
          <li><a href="../Map/">매장 찾기</a></li>
        </ul>

        <!-- 기타 / DB작업 -->
        <c:choose>
	        <c:when test="${empty loggedMember}">
	        <div class="etc">
	          <a href="../member/Login">로그인</a>
	          <a href="../product/Order">주문내역</a>
	          <a href="../cs/Faq">고객센터</a>
	        </div>
	        </c:when>
	        <c:otherwise>
	        <div class="etc">
	          <a href="../member/Logout">로그아웃</a>
	          <a href="../member/MyPage">MY PAGE</a>
	          <a href="../cs/Faq">고객센터</a>
	        </div>
	        </c:otherwise>
        </c:choose>

        <!-- 찾기 / DB작업 -->
        <div class="searchBox">
          <input type="text" name="search" class="search" />
          <a href="" class="btnSearch">
            <img src="../images/layout/gnb_search.png" />
          </a>
        </div>

        <!-- sns링크 -->
        <div class="sns">
          <a href=""><img src="../images/layout/gnb_sns01.png" /></a>
          <a href=""><img src="../images/layout/gnb_sns02.png" /></a>
          <a href=""><img src="../images/layout/gnb_sns03.png" /></a>
          <a href=""><img src="../images/layout/gnb_sns04.png" /></a>
        </div>

        <!-- banner링크 -->
        <div class="banner">
          <a href="">
            <img src="../images/layout/gnb_n32_banner.jpg" />
          </a>
          <a href="">
            <img src="../images/layout/gnb_2022_Wedding.jpg" />
          </a>
        </div>

        <!-- 닫기버튼 -->
        <div class="gnbClose">
          <img src="../images/layout/gnb_close.png" />
        </div>
      </div>
      <!-- 좌측 메뉴 end -->

      <!-- 로고 -->
      <div id="logo">
        <a href="../"><img src="../images/layout/header_logo.png" /></a>
      </div>

      <!-- 우측 메뉴 -->
      <div id="RightMenu">
	    <!-- 관리자 페이지 -->
		<c:if test="${loggedMember.grade=='관리자'}">
		<!-- 관리자 페이지 -->
		<div id="managerLink">
			<a href="../manager/">
		  	<img src="../images/layout/manage.png" />
		  	<span>관리자</span>
			</a>
		</div>
		</c:if>
        <div id="cart">
        	<img id="cartImg" src=${cartCount==0 ? "../images/layout/icon_cart.png" : "../images/layout/icon_cart_on.png" } />
        	<span>카트</span>
      	</div>
      </div>

      <!-- 숨겨진 우측 메뉴(카트) / DB작업  -->
      <div class="cartBox">
        <!-- 메뉴 리스트 -->
        <div class="allCount">
          <h2 class="count cart on">CART <span class="cartCount">(${cartCount==0 ? 0 : cartCount })</span></h2>
          <h2 class="count recent">RECENT <span class="recentCount">(${recentCount==0 ? 0 : recentCount })</span></h2>
        </div>

        <!-- 카트 리스트 -->
        <div class="cartList">
           <ul class="list cartProduct on">
           	<c:if test="${empty cartList }">
           	<li>카트에 담긴 상품이 없습니다.</li>
           	</c:if>
           	<c:forEach items="${cartList}" var="cart">
           	<li>
           		<a href="../product/Detail?no=${cart.no }">
           			<div class="Title">
           				<h2 id="cartName">${cart.pname } ${cart.sizes }</h2>
           				<img class="cartDelete" alt="카트 삭제" src="../images/layout/del.png">
           			</div>
           			<div class="Contents">
           				<div class="cartImg">
           					<img alt="카트 제품 이미지" src="${cart.img }">
           				</div>
           				<div class="cartTxt">
           					<p>수량: ${cart.count }개</p>
           					<fmt:formatNumber value="${cart.price }" pattern="###,###,###" var="price"></fmt:formatNumber>
           					<p class="cartPrice">￦ ${price }</p>
           				</div>
           			</div>
           		</a>
           	</li>
           	</c:forEach>
           </ul>
           	<div class="cartLink on"><a href="#">CART 바로가기</a></div>
          <ul class="list recentProduct">
          <c:if test="${empty recentList }">
            <li>최근 본 상품이 없습니다.</li>
           	</c:if>
           	<c:forEach items="${recentList}" var="recent">
           	<li>
           		<a href="../product/Detail?no=${recent.no }">
           			<div class="Title">
           				<h2 id="recentName">${recent.pname } ${recent.sizes }</h2>
           				<img class="recentDelete" alt="recentDelete" src="../images/layout/del.png">
           			</div>
           			<div class="Contents">
           				<div class="recentImg">
           					<img alt="카트 제품 이미지" src="${recent.img }">
           				</div>
           			</div>
           		</a>
           	</li>
           	</c:forEach>
          </ul>
        </div>

        <!-- CARTLIST DB -->
        <c:choose>
	        <c:when test="${empty loggedMember}">
	        <div class="etc">
	          <a href="../member/Login">로그인</a>
	          <a href="../product/Order">주문내역</a>
	          <a href="../cs/Faq">고객센터</a>
	        </div>
	        </c:when>
	        <c:otherwise>
	        <div class="etc">
	          <a href="../member/Logout">로그아웃</a>
	          <a href="../member/MyPage">MY PAGE</a>
	          <a href="../cs/Faq">고객센터</a>
	        </div>
	        </c:otherwise>
        </c:choose>

        <!-- 닫기 -->
        <div class="cartClose">
          <img src="../images/layout/gnb_close.png" />
        </div>
      </div>
      <!-- 우측 메뉴 end -->

      <!-- 블러 처리 / 좌, 우측 메뉴 닫기 -->
      <div class="closePage"></div>
    </header>
    <!-- header end -->
  </body>
</html>

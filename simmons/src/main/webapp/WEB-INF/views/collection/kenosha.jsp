<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<main>
	<div id="collection">
		<div class="proTop">
		  <ul class="firstMenu">
		    <li class="firstLi"><a href="">HOME</a></li>
		    <li class="firstLi">
		      <a href="">COLLECTION</a>
		      <ul class="secondMenu">
		     	  <li><a href="../black/Black">Beautyrest BLACK</a></li>
				  <li><a href="../collection/Beautyrest">COLLECTION</a></li>
				  <li><a href="../product/Mattress"">PRODUCT</a></li>
				  <li><a href="">ONLINE STORE</a></li>
				  <li><a href="">OUTLET</a></li>
				  <li><a href="../aboutus/Heritage">ABOUT US</a></li>
				  <li><a href="../factorium/Intro">FACTORIUM</a></li>
				  <li><a href="../Gallery/">SIMMONS GALLERY</a></li>
				  <li><a href="../Map/">매장 찾기</a></li>
		      </ul>
		    </li>
		    <li class="firstLi">
		      <a href="">KENOSHA</a>
		      <ul class="secondMenu">
		        <li><a href="../collection/Beautyrest">Beautyrest</a></li>
                <li><a href="../collection/N32">N32</a></li>
                <li><a href="../collection/Kenosha">KENOSHA</a></li>
		      </ul>
		    </li>
		  </ul>
		</div>
		<div class="slider">
		  <!--풀페이지로 좌우스크립 만들기-->
		  <div class="sliderBox">
		    <a href="" class="galleryLeft">Prev</a>
		    <ul  class="swiper-wrapper">
		      <li class="swiper-slide"><img src="../images/collection/kenosha/kenosha_furniture1.jpg" /></li>
		      <li class="swiper-slide"><img src="../images/collection/kenosha/kenosha_home1.jpg" /></li>
		      <li class="swiper-slide"><img src="../images/collection/kenosha/kenosha_fragrance.jpg" /></li>
		      <li class="swiper-slide"><img src="../images/collection/kenosha/kenosha_furniture2.jpg" /></li>
		      <li class="swiper-slide"><img src="../images/collection/kenosha/kenosha_home2.jpg" /></li>
		      <li class="swiper-slide"><img src="../images/collection/kenosha/kenosha_home3.jpg" /></li>
		    </ul>
		    <div class="sliderBtn">
            <div class="bullet"></div>
            <div class="btn">
              <button class="start on"></button>
              <button class="stop"></button>
            </div>
          </div>
		    <a href="" class="galleryRight">Next</a>
		  </div>
		</div>
		<!-- 제품선택 자바스크립으로 화면 온오프작업 -->
		  <ul>
		    <li><a href=""></a>ALL</li>
		    <li><a href=""></a>FURNITURE</li>
		    <li><a href=""></a>BEDDING</li>
		    <li><a href=""></a>FRAGRANCE</li>
		  </ul>
		</div>
</main>

<%@ include file="../include/footer.jsp" %>
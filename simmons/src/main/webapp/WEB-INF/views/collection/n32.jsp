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
	        <li><a href="#">Beautyrest BLACK</a></li>
	        <li><a href="#">COLLECTION</a></li>
	        <li><a href="#">PRODUCT</a></li>
	        <li><a href="#">ONLINE STORE</a></li>
	        <li><a href="#">OUTLET</a></li>
	        <li><a href="#">ABOUT US</a></li>
	        <li><a href="#">FACTORIUM</a></li>
	        <li><a href="#">SIMMONS GALLERY</a></li>
	        <li><a href="#">매장 찾기</a></li>
	      </ul>
	    </li>
	    <li class="firstLi">
	      <a href="">N32</a>
	      <ul class="secondMenu">
	        <li><a href="#">Beautyrest</a></li>
	        <li><a href="#">N32</a></li>
	        <li><a href="#">KENOSHA</a></li>
	      </ul>
	    </li>
	  </ul>
	</div>
	<div class="slider">
	  <!--풀페이지로 좌우스크립 만들기-->
	  <div class="sliderBox">
	    <a href="" class="galleryLeft">Prev</a>
	    <ul class="swiper-wrapper">
	      <li class="swiper-slide"><img src="../images/collection/n32/N32_1.jpg" /></li>
	      <li class="swiper-slide"><img src="../images/collection/n32/N32_2.jpg" /></li>
	      <li class="swiper-slide"><img src="../images/collection/n32/N32_3.jpg" /></li>
	      <li class="swiper-slide"><img src="../images/collection/n32/N32_4.jpg" /></li>
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
	
	<div class="sns">
	  <a href="">공유하기</a>
	  <ul>
	    <li class="sns01"><a href="" id="Facebook"></a></li>
	    <li class="sns02"><a href="" id="Pinterest"></a></li>
	    <li class="sns03"><a href="" id="KakaoStory"></a></li>
	    <li class="sns04"><a href="" id="Url"></a></li>
	  </ul>
	</div>
	
	<h2>PRODUCT</h2>
	<div class="proList">
	  <div class="option">
	    <a href="" class="mGuide">
	      <img src="../images/collection/btn_emotion.png" alt="EMOTION SCIENCE 내 몸에 맞는 매트리스를 찾아보세요." title />
	    </a>
	    <dl class="mat">
	      <dt class="size"><a href="(?이미지)+팝업"></a></dt>
	      <dd>
	        <div class="select select2">
	          <label for="matSize">전체사이즈</label>
	          <select name="matSize" id="sized" class="select">
	            <option value>전체사이즈</option>
	            <option value="QE">QE / 퀸</option>
	            <option value="SS">SS / 슈퍼싱글</option>
	          </select>
	        </div>
	      </dd>
	      <dt class="firm"><a href="(?이미지)+팝업"></a></dt>
	      <dd>
	        <div class="select select2">
	          <label for="wgpFlag">전체경도</label>
	          <select name="wgpFlag" id="wgpFlag" class="select select2">
	            <option value key="전체경도">전체경도</option>
	            <option value="P" key="P CLASS">P CLASS / 하드 타입</option>
	            <option value="G" key="G CLASS">G CLASS / 레귤러 타입</option>
	            <option value="W" key="W CLASS">W CLASS / 소프트 타입</option>
	          </select>
	        </div>
	      </dd>
	      <dd>
	        <div class="select">
	          <label>판매처</label>
	          <select name="matket" class="select">
	            <option>판매처</option>
	            <option value="O">온라인</option>
	          </select>
	        </div>
	      </dd>
	    </dl>
	  </div>
	</div>
	
	<!-- 제품사진 자바스크립으로 슬라이더작업 -->
	  <div class="SliderScrollBox">
	    <ul class="swiper-wrapper">
	      <li class="itemList swiper-slide">
	        <a href="상품 상세페이지">
	          <img src="../images/collection/n32/1.jpg" alt="" />
	          <span class="black"></span>
	          <span class="cover">
	            <span class="box">온라인</span>
	            <span class="name">
	              <p>Topper Mattress</p>
	            </span>
	            <span class="bogi">
	              <i>더보기</i>
	            </span>
	          </span>
	        </a>
	      </li>
	      <li class="itemList swiper-slide">
	        <a href="상품 상세페이지">
	          <img src="../images/collection/n32/2.jpg" alt="" />
	          <span class="black"></span>
	          <span class="cover">
	            <span class="box">온라인</span>
	            <span class="name">
	              <p>Topper Mattress</p>
	              <p>Check Sleeve</p>
	            </span>
	            <span class="bogi">
	              <i>더보기</i>
	            </span>
	          </span>
	        </a>
	      </li>
	      <li class="itemList swiper-slide">
	        <a href="상품 상세페이지">
	          <img src="../images/collection/n32/3.jpg" alt="" />
	          <span class="black"></span>
	          <span class="cover">
	            <span class="box">온라인</span>
	            <span class="name">
	              <p>Topper Mattress</p>
	              <p>Stripe Sleeve</p>
	            </span>
	            <span class="bogi">
	              <i>더보기</i>
	            </span>
	          </span>
	        </a>
	      </li>
	      <li class="itemList swiper-slide">
	        <a href="상품 상세페이지">
	          <img src="../images/collection/n32/4.jpg" alt="" />
	          <span class="black"></span>
	          <span class="cover">
	            <span class="box">온라인</span>
	            <span class="name">
	              <p>Topper Mattress</p>
	              <p>Waterproof Sleeve</p>
	            </span>
	            <span class="bogi">
	              <i>더보기</i>
	            </span>
	          </span>
	        </a>
	      </li>
	    </ul>
	  </div>
	</div>
</main>

<%@ include file="../include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<main>
	<div id="blackContents">
		<div class="proTop">
			<ul class="miniMenu">
			    <li class="miniLi"><a href="">HOME</a></li>
			    <li class="miniLi">
			        <a href="">Beautyrest BLACK</a>
			        <ul class="miniSub">
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
			    <li class="miniLi">
			        <a href="">MATTRESS</a>
			        <ul class="miniSub">
			            <li><a href="../black/Black">the BLACK</a></li>
			            <li><a href="">MATTRESS</a></li>
			            <li><a href="">FOUNDATION</a></li>
			        </ul>
			    </li>
			</ul>
		</div>
		<div class="mainSlider">
			<!--풀페이지로 좌우스크립 만들기-->
			<div class="mainSliderBox">
				<button class="galleryLeft">Prev</button>
				<div class="mask">
					<ul class="swiper-wrapper">
						<li class="visual01 swiper-slide"></li>
						<li class="visual02 swiper-slide"></li>
						<li class="visual03 swiper-slide"></li>
						<li class="visual04 swiper-slide"></li>
					</ul>
				</div>
				<div class="sliderBtn">
					<div class="bullet"></div>
				</div>
				<button class="galleryRight">Next</button>
			</div>
		</div>
	<div>
	    <!--Swiper (HITOP) 좌우버튼-->
	<!--하단 pagenation (neoforet) 메인  참조-->
	    <ul class="sliderBtn">
	        <li></li>
	        <li></li>
	        <li></li>
	        <li></li>
	    </ul>
	</div>
	<div class="sns">
	    <a href="">공유하기</a>
	</div>
	<h2>PRODUCT</h2>
	<div class="proList">
	    <div class="option">
	        <dl class="mat">
	            <dt class="size"><a href="(?이미지)+팝업"></a></dt>
	            <dd>
	                <div class="select select2">
	                    <label for="matSize">전체사이즈</label>
	                    <select name="matSize" id="sized" class="select">
	                        <option value>전체사이즈</option>
	                        <option value="GK">GK / 그레이트킹</option>
	                        <option value="KK">KK / 킹오브킹</option>
	                        <option value="LK">LK / 라지킹</option>
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
	                        <option value="DI">직영</option>
	                    </select>
	                </div>
	            </dd>
	        </dl>
	    </div>
	</div>
	<!-- Swiper (슈퍼마리오)  -->
      <div class="SliderScrollBox">
        <ul class="swiper-wrapper">
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/black/Kelly.jpg" alt="" />
			        <div class="hoverBox">
                <span class="cover">
                  <span class="box">직영</span>
                  <span class="name">
                    <p>Kelly</p>
                  </span>
                  <span class="bogi">
                    <i>더보기</i>
                  </span>
              </span>
			</div>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/black/Deborah.jpg" alt="" />
			<div class="hoverBox">
              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Deborah</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
			</div>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/black/Marion.jpg" alt="" />
			<div class="hoverBox">
              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Marion</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
			</div>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/black/Lucile.jpg" alt="" />
			        <div class="hoverBox">
                <span class="cover">
                  <span class="box">직영</span>
                  <span class="name">
                    <p>Lucile</p>
                  </span>
                  <span class="bogi">
                    <i>더보기</i>
                  </span>
                </span>
			      </div>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/black/Brigitte.jpg" alt="" />
			<div class="hoverBox">
              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Brigitte</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
			</div>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/black/Loren_pc.jpg" alt="" />
			        <div class="hoverBox">
                <span class="cover">
                  <span class="box">직영</span>
                  <span class="name">
                    <p>Loren</p>
                  </span>
                  <span class="bogi">
                    <i>더보기</i>
                  </span>
                </span>
			        </div>
            </a>
          </li>
        </ul>
        <div class="swiper-scrollbar"></div>
      </div>
	</div>
</main>
<%@ include file="../include/footer.jsp" %>
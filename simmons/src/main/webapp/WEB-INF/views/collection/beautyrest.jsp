<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<main>
	<div id="collection">
      <div class="proTop">
        <ul class="firstMenu">
          <li class="firstLi"><a href="../index.html">HOME</a></li>
          <li class="firstLi">
            <a href="" class="collection">COLLECTION</a>
            <ul class="secondMenu collectionMenu">
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
            <a href="" class="Beautyrest">Beautyrest</a>
            <ul class="secondMenu BeautyrestMenu">
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
          <button class="galleryLeft">Prev</button>
          <ul class="swiper-wrapper">
            <li class="visual01 swiper-slide"></li>
            <li class="visual02 swiper-slide"></li>
            <li class="visual03 swiper-slide"></li>
            <li class="visual04 swiper-slide"></li>
            <li class="visual05 swiper-slide"></li>
            <li class="visual06 swiper-slide"></li>
          </ul>
          <div class="sliderBtn">
            <div class="bullet"></div>
            <div class="btn">
              <button class="start on"></button>
              <button class="stop"></button>
            </div>
          </div>
          <button class="galleryRight">Next</button>
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
            <dt class="size">
              <a href="(?이미지)+팝업"></a>
            </dt>
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
              <div class="select select3">
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
              <img src="../images/collection/beautyrest/beautyrest_01.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Zalmon</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_02.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Edison</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_03.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Helen</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_04.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>William</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_05.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Henry</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_06.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Eleanor</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_07.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Giselle</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_08.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Vive</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_09.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Musk</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_10.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Bernard</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_11.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Jamine</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
          <li class="itemList swiper-slide">
            <a href="상품 상세페이지">
              <img src="../images/collection/beautyrest/beautyrest_12.jpg" alt="" />

              <span class="cover">
                <span class="box">직영</span>
                <span class="name">
                  <p>Barbara</p>
                </span>
                <span class="bogi">
                  <i>더보기</i>
                </span>
              </span>
            </a>
          </li>
        </ul>
        <div class="swiper-scrollbar"></div>
      </div>
    </div>
</main>

<%@ include file="../include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<main>
 <div id="blackContents">
      <div class="proTop">
        <ul class="miniMenu">
          <li><a href="">HOME</a></li>
          <li>
            <a href="">Beautyrest BLACK</a>
            <ul class="miniSub">
              <li><a href="">Beautyrest BLACK</a></li>
              <li><a href="">COLLECTION</a></li>
              <li><a href="">PRODUCT</a></li>
              <li><a href="">ONLINE STORE</a></li>
              <li><a href="">OUTLET</a></li>
              <li><a href="">ABOUT US</a></li>
              <li><a href="">FACTORIUM</a></li>
              <li><a href="">SIMMONS GALLERY</a></li>
              <li><a href="">매장 찾기</a></li>
            </ul>
          </li>
          <li>
            <a href="">MATTRESS</a>
            <ul class="miniSub2">
              <li><a href="">the BLACK</a></li>
              <li><a href="">MATTRESS</a></li>
              <li><a href="">FOUNDATION</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="Slider">
        <!--풀페이지로 좌우스크립 만들기-->
        <ul class="visual">
          <li><img src="../images/black/collection_banner1.jpg" /></li>
          <li><img src="../images/black/collection_banner2.jpg" /></li>
          <li><img src="../images/black/collection_banner3.jpg" /></li>
          <li><img src="../images/black/collection_banner4.jpg" /></li>
        </ul>
      </div>
      <div>
        <!--좌우스크립 버튼-->
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
      <!-- 침대사진 자바스트립으로  -->
      <div class="sliderBox">
        <ul>
          <li class="itemList">
            <a href="상품 상세페이지">
              <img src="../images/black/FD_Thumbnail.jpg" />
              <span class="cover">
                <span class="btn online">직영</span>
                <span class="btn sub">Beautyrest BLACK Foundation</span>
              </span>
              <span class="bogi">
                <i>더보기</i>
              </span>
            </a>
          </li>
        </ul>
      </div>
    </div>
</main>

<%@ include file="../include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>
<main>
  <nav class="banner factoriumBanner">
    <ul class="firstMenu">
      <li class="firstLi"><a href="">HOME</a></li>
      <li class="firstLi">
        <a href="">SIMMONS Factorium</a>
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
        <a href="">오시는길</a>
        <ul class="secondMenu">
          <li><a href="#">INTRO</a></li>
          <li><a href="#">R&D</a></li>
          <li><a href="#">TERRACE</a></li>
          <li><a href="#">오시는 길</a></li>
        </ul>
      </li>
    </ul>
    <div class="d">
      <h1>BUILT FOR SLEEP</h1>
      <p>시몬스 팩토리움은 한국 시몬스의 시대를 이어온 본질이자 기록이며 진심을 갖춘 심장부입니다</p>
    </div>
  </nav>
  <div class="root">
    <div class="line">
      <ul>
        <li><a href="Intro">INTRO</a></li>
        <li><a href="Rnd">R&D</a></li>
        <li><a href="Terrace">TERRACE</a></li>
        <li class="on"><a href="Comed">오시는 길</a></li>
      </ul>
    </div>
  </div>
  <div class="container">
    <div class="factorium">
      <h3 class="title">SIMMONS Factorium</h3>
    </div>
    <div id="map" style="width: 1000px; height: 563px"></div>
    <p>
      주소 : 경기도 이천시 모가면 사실로 988 <br />
      운영시간 : 11:00 ~ 21:00
    </p>
  </div>
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cda21a94ea9f6b1ffc88cbb98dc7961"></script>

<script>
  var container = document.getElementById("#map");
  var options = {
    center: new kakao.maps.LatLng(37.197793717412225, 127.4463083421439),
    level: 3,
  };

  var map = new kakao.maps.Map(container, options);
</script>
<script>
  // 마커가 표시될 위치입니다
  var markerPosition = new kakao.maps.LatLng(37.197793717412225, 127.4463083421439);

  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
    position: markerPosition,
  });
</script>

<%@ include file="../include/footer.jsp" %>

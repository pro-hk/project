<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>

<main>
  <nav class="banner mediaBanner">
    <ul class="firstMenu">
      <li class="firstLi"><a href="">HOME</a></li>
      <li class="firstLi">
        <a href="">ABOUT US</a>
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
        <a href="">MEDIA</a>
        <ul class="secondMenu">
          <li><a href="../aboutus/Heritage">HERITAGE</a></li>
          <li><a href="../aboutus/MediaTvc">MEDIA</a></li>
          <li><a href="../aboutus/Hotel">SIMMONS IN HOTEL</a></li>
        </ul>
      </li>
    </ul>
    <div class="d">
      <h1>MEDIA</h1>
    </div>
  </nav>
  <div class="container">
    <ul class="threeTap">
      <li><a href="MediaTvc">TVC</a></li>
      <li><a href="MediaPrint">Print</a></li>
      <li class="on"><a href="MediaArticle">Article</a></li>
    </ul>
    <div class="searchBox">
      <select name="arti" id="arti">
        <option value>전체</option>
        <option value="">언론보도</option>
        <option value="">공지사항</option>
      </select>
      <select name="key" id="key">
        <option value="">전체</option>
        <option value="">제목</option>
        <option value="">내용</option>
      </select>
      <input type="text" id="keyword" placeholder="검색어를 입력하세요" />
      <a href="">검색</a>
    </div>
    <table class="articleList">
      <caption>
        ARTICLE
      </caption>
      <colgroup>
        <col class="col1" />
        <col class="col2" />
      </colgroup>
      <thead>
        <tr>
          <th>제목</th>
          <th>등록일</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="sub">
            <a href="">[언론보도] "명품은 명품으로"…샤넬 출신 조현정 시몬스 점장</a>
          </td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] '특급호텔 침대'에 꽂힌 예비 신혼부부</a></td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 여기가 인생샷 맛집이네… 성탄 트리 점등한 ‘시몬스 테라스’</a></td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 시몬스 침대, 2021 인간공학 디자인상(EDA) 특별상 수상</a></td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 시몬스 침대, '시몬스 테라스' 초대형 트리 점등</a></td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 시몬스 ‘소방의날’ 맞아 소방관 위한 난연매트리스 기부 선행</a></td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 시몬스침대, 소방관 복지증진 위해 1억원 상당 난연매트리스 기부</a></td>
          <td>2021-12-13</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] "합리적인 MZ세대, 렌탈보다 신 구독모델 시몬스페이 선택"</a></td>
          <td>2021-11-17</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 시몬스 침대, 환절기 숙면 돕는 '케노샤' 구스 베딩 추천</a></td>
          <td>2021-11-17</td>
        </tr>
        <tr>
          <td class="sub"><a href="">[언론보도] 시몬스, '케노샤' 2021 가을·겨울 베딩 신제품 출시</a></td>
          <td>2021-11-17</td>
        </tr>
      </tbody>
    </table>
    <div class="paging">
      <div id="pageNavi">
        <a class="prev" href="#"></a>
        <ol>
          <li><a class="on">1 </a></li>
          <li><a href="">2</a></li>
          <li><a href="">3</a></li>
          <li><a href="">4</a></li>
          <li><a href="">5</a></li>
          <li><a href="">6</a></li>
          <li><a href="">7</a></li>
          <li><a href="">8</a></li>
          <li><a href="">9</a></li>
          <li><a href="">10</a></li>
        </ol>
        <a class="next" href="#"></a>
      </div>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp" %>

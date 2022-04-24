<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>

<main id="find">
  <div class="visualSub">
    <div class="locationBox">
      <ul class="location">
        <li>
          <a href="/">HOME</a>
        </li>
        <li>
          <a href="">매장 찾기</a>
          <ul class="locationSub"></ul>
          <!--javascript사용-->
        </li>
      </ul>
      <h2>매장 찾기</h2>
    </div>
  </div>
  <div class="mainContent">
    <h3>지역별 매장 찾기</h3>
    <div class="findStore">
      <div class="search">
        <select name="area_gb" id="area_gb">
          <option value="">전체</option>
          <option value="">전북</option>
          <option value="">경기</option>
          <option value="">제주</option>
          <option value="">경남</option>
        </select>
        <input type="text" id="agency_nm" name="agency_nm" placeholder="매장/지역 명을 입력하세요" />
        <a href="">검색</a>
      </div>
    </div>
    <div class="gallery03">
      <div class="mySub findStore">
        <table class="myTable01" summaary="상품정보, 상품금액, 수량, 주문금액, 배송비 정보 제공">
          <colgroup>
            <col class="col1" />
            <col class="col2" />
            <col class="col3" />
            <col class="col4" style="width: 15%" />
            <col class="col4" style="width: 20%" />
          </colgroup>
          <thead>
            <tr>
              <th>매장 명</th>
              <th>주소</th>
              <th>전화번호</th>
              <th>영업시간</th>
              <th class="offDay">휴무일</th>
            </tr>
          </thead>
          <tbody id="tbl_list">
            <tr>
              <td>시몬스 테라스점</td>
              <td>17406) 경기 이천시 모가면 사실로 988</td>
              <td class="num">031-631-4071</td>
              <td class="time">
                11:00 ~ 20:00
                <br />
                (금-토 11:00~21:00)
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 강동둔촌점</td>
              <td>05375) 서울 강동구 양재대로99길 4 (성내동)</td>
              <td class="num">02-488-9193</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 기흥점</td>
              <td>17086) 경기 용인시 기흥구 신고매로 59 (고매동) 리빙파워센터 지하 1~2층</td>
              <td class="num">031-281-4070</td>
              <td class="time">
                10:00 ~ 20:00
                <br />
                (금~일 10:00 ~ 21:00)
              </td>
              <td class="offDay">명절 당일만 휴무(설날/추석)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 논현점</td>
              <td>06040) 서울 강남구 논현로 741 (논현동)</td>
              <td class="num">02-515-9747</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 대구점</td>
              <td>42006) 대구 수성구 달구벌대로 2331 (수성동4가) 한영빌딩 1~2층</td>
              <td class="num">053-756-7932</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 부산김해점</td>
              <td>50940) 경남 김해시 김해대로 2324 (봉황동)</td>
              <td class="num">055-338-9702</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 부산좌천점</td>
              <td>48727) 부산 동구 중앙대로 456 (좌천동) 1층~4층</td>
              <td class="num">051-987-2595</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 부산해운대점</td>
              <td>48082) 부산 해운대구 좌동로53번길 40 (중동) 1층~4층</td>
              <td class="num">051-741-1293</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 부천중동점</td>
              <td>14555) 경기 부천시 길주로 428 (춘의동) 1층</td>
              <td class="num">032-668-9072</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
            <tr>
              <td>시몬스 갤러리 분당점</td>
              <td>13552) 경기 성남시 분당구 대왕판교로 167 (금곡동)</td>
              <td class="num">031-786-0845</td>
              <td class="time">
                10:30 ~ 20:30
                <br />
              </td>
              <td class="offDay">연중무휴(명절휴무시 별도공지)</td>
            </tr>
          </tbody>
        </table>
        <div class="pagin">
          <div id="pageNavi">
            <a class="prev" href="#" alt="1"></a>
            <ol>
              <li class="on">
                <a class="on">1</a>
              </li>
              <li>
                <a href="" alt="2">2</a>
              </li>
            </ol>
            <a class="next" href="#" alt="2"></a>
          </div>
        </div>
        <p id="p_agencynm">[시몬스 갤러리 분당점]</p>
        <div class="stroeMap">
          <div id="map" style="width: 100%; height: 570px"></div>
        </div>
        <!--지도뷰-->
        <div class="stroeMap">
          <div id="storemap"></div>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="../include/footer.jsp" %>

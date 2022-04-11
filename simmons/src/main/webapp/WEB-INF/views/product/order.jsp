<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- main -->
<main id="main">
  <div class="container">
    <!-- lnb -->
    <ul class="lnb">
      <li><a href="">HOME</a></li>
      <li><a href="">주문/배송</a></li>
    </ul>

    <!-- 메인 화면 -->
    <div class="txtBox lineOff">
      <h1>주문/배송 조회</h1>
      <p>주문/배송 정보를 안전하게 조회하실 수 있습니다</p>
    </div>

    <!-- form -->
    <form action="" method="post" id="order">
      <div class="formTxt">
        <h2>주문자정보로 조회하기</h2>
        <p>* 비회원 구매 시 입력했던 주문자명/휴대전화/이메일로 조회해주세요.</p>
      </div>
      <table>
        <colgroup>
          <col style="width: 20%" />
          <col style="width: 80%" />
        </colgroup>
        <tbody>
          <tr class="top">
            <th class="top">주문자명</th>
            <td><input type="text" /></td>
          </tr>
          <tr>
            <th>휴대전화 / 일반전화</th>
            <td>
              <input type="text" class="phone" />
              <span>-</span>
              <input type="text" class="phone" />
              <span>-</span>
              <input type="text" class="phone" />
            </td>
          </tr>
          <tr class="bottom">
            <th class="bottom">이메일</th>
            <td>
              <input type="text" />
              <span>@</span>
              <!-- 직접 입력시 readonly 풀기 -->
              <input type="text" class="domain" readonly />
              <span></span>
              <select class="email">
                <option value="">직접 입력</option>
                <option value="naver.com">naver.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="hotmail.com">hotmail.com</option>
                <option value="nate.com">nate.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="daum.net">daum.net</option>
              </select>
            </td>
          </tr>
        </tbody>
      </table>
      <button type="submit" class="btn orderSearch">주문조회</button>
    </form>
    <!-- form end -->
  </div>

  <!-- 탑 버튼 -->
  <div class="btnTop">
    <a href=""><img src="../images/main/btn_top.png" alt="" /></a>
  </div>
</main>
<!-- main end -->

<%@ include file="../include/footer.jsp" %>
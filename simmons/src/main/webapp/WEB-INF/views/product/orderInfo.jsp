<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<main>
	<div id="orderInfo">
		<div class="formTxt">
		  <h2>주문/배송 정보</h2>
		  <p>회원님께서 구매하신 상품의 주문/배송 정보입니다.</p>
		</div>
		<table>
		  <h2>주문정보</h2>
		  <tr>
		    <th>주문번호</th>
		    <th>주문시간</th>
		    <th>결제방식</th>
		    <th>결제상태</th>
		    <th>결제정보</th>
		  </tr>
		  <tr>
		    <td>9999(주문번호)</td>
		    <td>2022-02-22</td>
		    <td>무통장입금</td>
		    <td>입금대기</td>
		    <td>카드</td>
		  </tr>
		</table>
		<table>
		  <h2>주문내역확인</h2>
		  <tr>
		    <th colspan="2">상품정보</th>
		    <th>상품금액</th>
		    <th>수량</th>
		    <th>주문금액</th>
		    <th>적립 예정 적립금</th>
		  </tr>
		  <tr>
		    <td>상품이미지</td>
		    <td>9999(주문번호)</td>
		    <td>1,200,000원</td>
		    <td>1</td>
		    <td>1,200,000원</td>
		    <td>0원</td>
		  </tr>
		</table>
		<table>
		  <h2>결제금액</h2>
		  <tr>
		    <th>상품총금액</th>
		    <th>배송비</th>
		    <th>할인총금액</th>
		    <th>최종결제금액</th>
		    <th>결제수단</th>
		  </tr>
		  <tr class="bk">
		    <td>1,200,000원</td>
		    <td>0원</td>
		    <td>0원</td>
		    <td>1,200,000원</td>
		    <td>카드</td>
		  </tr>
		</table>
		<h2>주문하신분</h2>
		<div class="Boxline">
		  <table>
		    <tr>
		      <th>이름</th>
		      <td>아무개</td>
		    </tr>
		    <tr>
		      <th>이메일</th>
		      <td>sdf@sdfs.com</td>
		    </tr>
		    <tr>
		      <th>휴대전화</th>
		      <td>010-0000-0000</td>
		    </tr>
		    <tr>
		      <th>일반전화</th>
		      <td></td>
		    </tr>
		  </table>
		</div>
		<h2>배송받으시는 분</h2>
		<div class="Boxline">
		  <table>
		    <tr>
		      <th>이름</th>
		      <td>아무개</td>
		    </tr>
		    <tr>
		      <th>주소</th>
		      <td>서울시 여러구 아무동</td>
		    </tr>
		    <tr>
		      <th>휴대전화</th>
		      <td>010-0000-0000</td>
		    </tr>
		    <tr>
		      <th>일반전화</th>
		      <td></td>
		    </tr>
		    <tr>
		      <th>배송 유의사항</th>
		      <td></td>
		    </tr>
		  </table>
		</div>
		<div class="listbogi">목록보기</div>
	</div>
</main>

<%@ include file="../include/footer.jsp" %>
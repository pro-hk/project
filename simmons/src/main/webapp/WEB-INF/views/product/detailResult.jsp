<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
			

<!-- main -->
	<main id="main">
	  <div class="container">
	    <!-- lnb -->
		<ul class="lnb">
		  <li><a href="">HOME</a></li>
		  <li><a href="">구매내역</a></li>
		</ul>

	<!-- form -->
	<form action="DetailResultProcess" method="post" id="order">
	  <div class="formTxt">
	    <h2>구매 확인</h2>
	  </div>
	  <table>
	    <colgroup>
	      <col style="width: 20%" />
		  <col style="width: 80%" />
	</colgroup>
	<tbody>
	  <tr class="top">
	    <th>이름</th>
	    <td><input type="text" class="name" name="name" value="${loggedName}"/></td>
	  </tr>
	  <tr>
	    <th>아이디</th>
	    <td><input type="text" class="name" name="id" value="${loggedId }" /></td>
	  </tr>
	  <tr>
	    <th>제품이름</th>
	    <td><input type="text" class="name" name="pname" value="${buyListDto.pname }" /></td>
	  </tr>
	  <tr>
	    <th>사이즈</th>
	    <td><input type="text" class="name" name="sizes" value="${buyListDto.sizes }" /></td>
	  </tr>
	  <tr>
	    <th>가격</th>
	    <td><input type="text" class="name" name="price" value="${buyListDto.price }" /></td>
	  </tr>
	   <tr>
	    <th>주소</th>
	    <td><input type="text" class="name" name="address" value="${address }" /></td>
	  </tr>
	  <tr>
	    <th>이메일</th>  
		    <td>
		      <input name="email" value="${email}">
		    </td>
	  </tr>
	      <tr>
	        <th>휴대전화</th>
	        <td>
	          <input name="phone" value="${phone }">
	        </td>
	      </tr>
	      <tr class="bottom">
	        <th>갯수</th>
	        <td><input name="count" value="1"></td>
	      </tr>
	    </tbody>
	  </table>
	  <div class="btns">
	    <button type="submit" class="comfirm">구매</button>
	    <a href="../" class="cancel btn">취소</a>
	  </div>
	</form>
	<!-- form end -->
	  </div>
	</main>
	<!-- main end -->

<%@ include file="../include/footer.jsp" %>
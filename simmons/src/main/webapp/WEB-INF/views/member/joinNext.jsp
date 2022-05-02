<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<main>
    <div class="box">
      <div class="title">
        <h1>회원가입이 완료 되었습니다.</h1>
        <p>시몬스에 가입해주셔서 진심으로 감사드립니다</p>
      </div>
      <div class="contents">
        <div class="wrap">
          <table>
            <colgroup>
              <col style="width: 20%" />
              <col style="width: 80%" />
            </colgroup>
            <tbody>
				<%-- <c:forEach items="${loginMember}" var="memberDto"> --%>
	            	<tr>
	            		<th>이름</th>
	            		<td>${sessionMemberDto.name}</td>
	            	</tr>
	            	<tr>
	            		<th>아이디</th>
	            		<td>${sessionMemberDto.id}</td>
	            	</tr>
	                <tr>
	                  <th>주소</th>
	                  <td>
	                    <p>${sessionMemberDto.zipCode}</p>
	                    <p>${sessionMemberDto.address01} ${sessionMemberDto.address03}</p>
	                  </td>
	                </tr>
	            	<tr>
	            		<th>이메일</th>
	            		<td>${sessionMemberDto.email01}@${sessionMemberDto.email02}</td>
	            	</tr>
	            	<tr>
	            		<th>휴대전화</th>
	            		<td>${sessionMemberDto.phone01}-${sessionMemberDto.phone02}-${sessionMemberDto.phone03}</td>
	            	</tr>
	            	<tr>
	            		<th>일반전화</th>
	            		<td>${sessionMemberDto.homePhone01}-${sessionMemberDto.homePhone02}-${sessionMemberDto.homePhone03}</td>
	            	</tr>
	            	<tr>
	            		<th>생일</th>
	            		<td>${sessionMemberDto.birthdayYear}-${sessionMemberDto.birthdayMonth}-${sessionMemberDto.birthdayDay}</td>
	            	</tr>
	            	<tr>
	            		<th>직업</th>
	            		<td>${sessionMemberDto.job}</td>
	            	</tr>
	            	<tr>
	            		<th>SMS 수신</th>
	            		<td>${sessionMemberDto.sms}</td>
	            	</tr>
	            	<tr>
	            		<th>이벤트 정보 수신</th>
	            		<td>${sessionMemberDto.event}</td>
	            	</tr>
	            	<tr>
	            		<th>주문정보 수신</th>
	            		<td>${sessionMemberDto.delivery}</td>
	            	</tr>
	            	<tr>
	            		<th>전문가와의 전화상담</th>
	            		<td>${sessionMemberDto.serviceCall}</td>
	            	</tr>
	            	<tr>
	            		<th>결혼여부</th>
	            		<td>${sessionMemberDto.married}</td>
	            	</tr>
            	
            	<%-- </c:forEach> --%>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <a href="../">메인으로 이동</a>
    <a href="Login">회원 로그인</a>
</main>

<%@ include file="../include/footer.jsp" %>

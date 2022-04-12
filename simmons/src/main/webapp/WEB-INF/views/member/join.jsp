<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- main -->
	<main id="main">
	  <div class="container">
	    <!-- lnb -->
		<ul class="lnb">
		  <li><a href="">HOME</a></li>
		  <li><a href="">회원가입</a></li>
		</ul>
		
	<!-- form -->
	<form action="JoinProcess" method="post" id="order">
	  <div class="formTxt">
	    <h2>회원가입 양식</h2>
	    <p>* 항목은 필수 입력해주세요</p>
	  </div>
	  <table>
	    <colgroup>
	      <col style="width: 20%" />
	  <col style="width: 80%" />
	</colgroup>
	<tbody>
	  <tr class="top">
	    <th>이름 *</th>
	    <td><input type="text" class="name" name="name" /></td>
	  </tr>
	  <tr>
	    <th>아이디 *</th>
	    <td>
	      <input type="text" class="id" name="id" />
	    </td>
	  </tr>
	  <tr>
	    <th>비밀번호 *</th>
	    <td>
	      <input type="password" class="password" name="password" />
	    </td>
	  </tr>
	  <tr>
	    <th>비밀번호 확인*</th>
	    <td>
	      <input type="password" class="passwordCheck" />
	    </td>
	  </tr>
	  <tr>
	    <th rowspan="3">주소 *</th>
	    <td>
	      <input type="number" class="zipcode" name="zipCode" />
	      <button id="address">우편번호 찾기</button>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <input type="text" class="address addr01" name="addr01" placeholder="도로명주소" />
	      <input type="text" class="address addr03" name="addr03" placeholder="상세주소" />
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <input type="text" class="address addr02"  name="addr02" placeholder="지번주소" />
	      <input type="text" class="address addr04" readonly />
	    </td>
	  </tr>
	  <tr>
	    <th>이메일 *</th>
	    <td>
	      <input type="text" name="email01" />
	      <span>@</span>
	      <!-- 직접 입력시 readonly 풀기 -->
	          <input type="text" class="domain" readonly />
	          <span></span>
	          <select class="email" name="email02" >
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
	      <tr>
	        <th>휴대전화 *</th>
	        <td>
	          <input type="text" class="phone01 phone" name="phone01" />
	          <span>-</span>
	          <input type="text" class="phone02 phone" name="phone02" />
	          <span>-</span>
	          <input type="text" class="phone03 phone" name="phone03" />
	        </td>
	      </tr>
	      <tr>
	        <th>일반전화 *</th>
	        <td>
	          <select class="phone" name="homePhone01">
	            <option value="">직접 입력</option>
	            <option value="02">서울 (02)</option>
	            <option value="031">경기 (031)</option>
	            <option value="032">인천 (032)</option>
	            <option value="033">강원 (033)</option>
	            <option value="041">충남 (041)</option>
	            <option value="042">대전 (042)</option>
	            <option value="043">충북 (043)</option>
	            <option value="044">세종 (044)</option>
	            <option value="051">부산 (051)</option>
	            <option value="052">울산 (052)</option>
	            <option value="053">대구 (053)</option>
	            <option value="054">경북 (054)</option>
	            <option value="055">경남 (055)</option>
	            <option value="061">전남 (061)</option>
	            <option value="062">광주 (062)</option>
	            <option value="063">전북 (063)</option>
	            <option value="064">제주 (064)</option>
	            <option value="05">평생번호 (05)</option>
	            <option value="0505">평생번호 (0505)</option>
	          </select>
	          <span>-</span>
	          <input type="text" class="phone02 phone"  name="homePhone02" />
	          <span>-</span>
	          <input type="text" class="phone03 phone"  name="homePhone03" />
	        </td>
	      </tr>
	      <tr>
	        <th>생일</th>
	        <td>
	          <input type="text" class="date year" name="year" />
	          <span>년</span>
	          <input type="text" class="date month" name="month" />
	          <span>월</span>
	          <input type="text" class="date day" name="day" />
	          <span>일</span>
	        </td>
	      </tr>
	      <tr>
	        <th>직업</th>
	        <td>
	          <select name="job" id="job">
	            <option value="900">기타</option>
	            <option value="901">중·고등학생</option>
	            <option value="902">대학(원)생</option>
	            <option value="903">기획/관리/총무</option>
	            <option value="904">영업/마케팅</option>
	            <option value="905">광고/홍보</option>
	            <option value="906">제조/생산/기술</option>
	            <option value="907">전산개발/관리</option>
	            <option value="908">연구직</option>
	            <option value="909">일반서비스업종</option>
	            <option value="910">공무원/군인</option>
	            <option value="911">대학교수,강사</option>
	            <option value="912">초중등교사</option>
	            <option value="913">언론,출판</option>
	            <option value="914">농,축,수산,임업</option>
	            <option value="915">의료계</option>
	            <option value="916">법조인</option>
	            <option value="917">종교</option>
	            <option value="918">방송,연예,예술</option>
	            <option value="919">전업주부</option>
	            <option value="920">단순노무,일용직</option>
	            <option value="921">자영업</option>
	            <option value="922">무직</option>
	          </select>
	        </td>
	      </tr>
	      <tr>
	        <th>결혼여부</th>
	        <td>
	          <label>
	            <input type="radio" name="married" value="미혼" checked />
	            <span>미혼</span>
	          </label>
	          <label>
	            <input type="radio" name="married" value="기혼" />
	            <span>기혼</span>
	          </label>
	        </td>
	      </tr>
	      <tr>
	        <th>SMS 수신</th>
	        <td>
	          <label>
	            <input type="radio" name="sms" value="수신" checked />
	            <span>수신</span>
	          </label>
	          <label>
	            <input type="radio" name="sms" value="수신거부" />
	            <span>수신거부</span>
	          </label>
	        </td>
	      </tr>
	      <tr>
	        <th>이벤트 정보 수신</th>
	        <td>
	          <label>
	            <input type="radio" name="event" value="수신" checked/>
	            <span>수신</span>
	          </label>
	          <label>
	            <input type="radio" name="event" value="수신거부" />
	            <span>수신거부</span>
	          </label>
	        </td>
	      </tr>
	      <tr>
	        <th>주문정보 수신</th>
	        <td>
	          <label>
	            <input type="radio" name="delivery" value="수신" checked/>
	            <span>수신</span>
	          </label>
	          <label>
	            <input type="radio" name="delivery" value="수신거부" />
	            <span>수신거부</span>
	          </label>
	        </td>
	      </tr>
	      <tr>
	        <th>전문가와의 전화상담 *</th>
	        <td>
	          <label>
	            <input type="radio" name="serviceCall" value="신청" checked />
	            <span>신청</span>
	          </label>
	          <label>
	            <input type="radio" name="serviceCall" value="미신청" />
	            <span>미신청</span>
	          </label>
	        </td>
	      </tr>
	    </tbody>
	  </table>
	  <div class="btns">
	    <button type="submit" class="comfirm btn">회원가입</button>
	    <a href="Login" class="cancel btn">취소</a>
	  </div>
	</form>
	<!-- form end -->
	  </div>
	</main>
	<!-- main end -->

<%@ include file="../include/footer.jsp" %>
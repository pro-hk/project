<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- main -->
<main id="main">
  <div class="container">
    <!-- lnb -->
    <ul class="lnb">
      <li><a href="">HOME</a></li>
      <li><a href="">고객센터</a></li>
    </ul>

    <!-- 메인 화면 -->
    <div class="txtBox lineOff">
      <h1>고객센터</h1>
      <p>고객님의 질문에 성심껏 답변해 드리겠습니다</p>
    </div>

    <!-- 상단 5개 선택 -->
    <ul class="customerList">
      <li><a href="Faq">FAQ</a></li>
      <li class="Qna"><a href="Qna">Q&A</a></li>
      <li class="on"><a href="Counsel">1:1 전화상담 신청</a></li>
      <li><a href="As">A/S 신청</a></li>
      <li><a href="Notice">공지사항</a></li>
    </ul>

    <!-- contents / DB작업 -->
    <div class="customerContents counsel">
    	<!-- form -->
      <form action="CounselWriteProcess" method="post" id="order">
      <div class="contentsBox">
        <h2><span>개인정보수집 및 이용에 대한 안내</span></h2>
        <p>
          ■ 수집하는 개인정보의 항목 및 수집방법<br /><br />
          회사는 회원가입, 비회원구매, 상담, 서비스 신청 등을 위해 아래와 같은 방법에 따라 개인정보를 수집하고 있습니다. <br /><br />
          <회원가입 시><br />
          ο 필수항목 :이름, ID, 비밀번호, 주소, 이메일, 휴대전화번호, 성별, 아이핀 인증결과, 상담신청여부,쿠키, 결제기록<br />
          ο 선택항목 :자택 전화번호, 생년월일, 성별, 결혼여부, 직업, SMS 수신, 이벤트정보수신, 주문정보수신, 추천인ID<br /><br />
          <비회원 구매 시><br />
          ο 필수항목 :주문자 이름, 주문자 휴대전화번호, 수령자 이름, 수령자 휴대전화번호, 배송지 주소, 결제정보(은행계좌정보, 휴대폰결제 정보, 현금영수증정보)<br />
          ο 선택항목 : 없음<br />
          ο 비회원 주문 시에는 적립혜택을 받으실 수 없습니다.<br /><br />
          <상담 시><br />
          ο 필수항목 :이름, 휴대전화번호<br />
          ο 선택항목 :자택 전화번호, 통화가능시간, 거주지역, 나이, 침대경험정도, 이메일<br /><br />
          ■ 개인정보의 수집 및 이용목적<br /><br />
          회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br />
          ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br />
          ο 회원관리<br />
          회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달<br />
          ο 마케팅 및 광고에 활용<br />
          이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br /><br />
          ■ 개인정보의 보유 및 이용기간<br /><br />
          원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 상법 및 ‘전자상거래등에서 소비자보호에 관한 법률’ 등 관련 법령의 규정에 의하여 다음과 같이 거래
          관련 관리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.<br />
          ο 상업장부와 영업에 관한 중요서류: 10년(상법)<br />
          ο 전표 또는 이와 유사한 서류: 5년(상법)<br />
          ο 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br />
          ο 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br />
          ο 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)<br />
          ο 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등의 종료 시점
        </p>
      </div>
      <div class="agreeBox">
        <span>위의 개인정보취급방침에 동의하십니까?(필수)</span>
        <input type="checkbox" name="privacy" id="privacy" value="동의" />
      </div>
      <div class="contentsBox">
        <h2><span>마케팅 및 광고에 활용</span></h2>
        <p>
          이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 위해 활용합니다.<br />
          귀하는 개인정보 수집·이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 마케팅 활동 및 이벤트 참여기회 제공 등 사이트 서비스 이용에 제한될 수 있습니다.
        </p>
      </div>
      <div class="agreeBox">
        <span>위의 마케팅 및 광고 활용 이용에 동의하십니까?(선택)</span>
        <input type="checkbox" name="marketing" id="marketing" value="동의"  />
      </div>
      <div class="contentsBox">
        <p>※귀하는 개인정보 수집·이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 회원가입을 통한 상품 구매, 고객상담, 이벤트 참여기회 제공 등 사이트 서비스 이용에 제한될 수 있습니다.</p>
      </div>

        <div class="formTxt">
          <h2>신청서 작성</h2>
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
              <td><input type="text" class="name" name="name"  value="${empty loggedMember?'':loggedMember.name }" /></td>
            </tr>
            <tr>
              <th>제목 *</th>
              <td>
                <input type="text" class="title" name="title" />
              </td>
            </tr>
            <tr>
              <th>연락처 *</th>
              <td>
                <input type="text" class="phone01 phone" name="phone01" value="${empty loggedMember?'':loggedMember.phone01 }" />
                <span>-</span>
                <input type="text" class="phone02 phone" name="phone02" value="${empty loggedMember?'':loggedMember.phone02 }" />
                <span>-</span>
                <input type="text" class="phone03 phone" name="phone03" value="${empty loggedMember?'':loggedMember.phone03 }" />
              </td>
            </tr>
            <tr>
              <th>통화가능시간 *</th>
              <td>
                <input type="text" class="callTime" name="callTime" placeholder="예) 오후 1시" />
                <span>* 평일 9시-17시 / 토요일.일요일.공휴일 휴무</span>
              </td>
            </tr>
            <tr>
              <th>거주지역 *</th>
              <td>
                <select name="city" class="city">
                  <option value="">지역을 선택하세요</option>
                  <option value="서울">서울</option>
                  <option value="인천">인천</option>
                  <option value="경기">경기</option>
                  <option value="강원">강원</option>
                  <option value="충남">충남</option>
                  <option value="충북">충북</option>
                  <option value="대전">대전</option>
                  <option value="대구">대구</option>
                  <option value="경북">경북</option>
                  <option value="울산">울산</option>
                  <option value="부산">부산</option>
                  <option value="경남">경남</option>
                  <option value="전북">전북</option>
                  <option value="광주">광주</option>
                  <option value="전남">전남</option>
                  <option value="제주">제주</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>이메일 *</th>
              <td>
                <input type="text" name="email01" value="${empty loggedMember?'':loggedMember.email01 }" />
                <span>@</span>
                <input type="text" name="email02" class="email02"value="${empty loggedMember?'':loggedMember.email02 }" />
                <span></span>
                <select class="domain">
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
            <tr class="bottom">
              <th>상세내용(전화상담이 필요한 부분) *</th>
              <td class="textarea">
                <textarea name="contents" id="conentsTxt"></textarea>
                <p><span class="txtCount">0</span> / 4000자</p>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="btns"><button type="submit" class="btn">신청하기</button></div>
      </form>
      <!-- form end -->
    </div>

    <!-- 고객센터 하단 -->
    <div class="customerCenter flex">
      <div class="inner">
        <h2>고객센터<span class="material-icons"> arrow_right </span><strong>1899-8182</strong></h2>
        <p>평일 9시-18시 / 토요일.일요일.공휴일 휴무</p>
      </div>
      <div class="inner">
        <h2>특판사업문의<span class="material-icons"> arrow_right </span><strong>1899-8182</strong></h2>
        <p>E-mail : kbh@simmons.co.kr</p>
      </div>
    </div>
  </div>

  <!-- 탑 버튼 -->
  <div class="btnTop">
    <a href=""><img src="../images/main/btn_top.png" alt="" /></a>
  </div>
</main>
<!-- main end -->
<%@ include file="../include/qna.jsp" %> <%@ include file="../include/footer.jsp"%>

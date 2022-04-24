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
      <li><a href="Counsel">1:1 전화상담 신청</a></li>
      <li class="on"><a href="As">A/S 신청</a></li>
      <li><a href="Notice">공지사항</a></li>
    </ul>

    <!-- contents / DB작업 -->
    <div class="customerContents as">
      <div class="asFlow">
        <h2>A/S 처리 흐름도</h2>
        <ul>
          <li>01. A/S 접수</li>

          <li>02. 고객카드 작성</li>

          <li>03. A/S 담당 통보</li>

          <li>04. 방문 일정 조정</li>

          <li class="end">05. A/S 일정 회의</li>
          <li>06. 고객 방문 처리</li>

          <li>07. 처리 결과 회의</li>

          <li>08. 고객 만족확인 (Happy Call)</li>
          <li class="img"></li>
          <li class="end">처리완료</li>
        </ul>
      </div>
         <!-- form -->
      <form action="AsWrite" method="post" id="as" enctype="multipart/form-data" >
      <div class="contentsBox">
        <h2><span>개인정보수집 및 이용동의</span></h2>
        <p>
          ■ 수집하는 개인정보의 항목<br /><br />
          (주)시몬스는 A/S와 관련하여 아래와 같은 개인정보를 수집하고 있습니다.<br />
          ο 필수항목: 이름, 주소, 연락처, A/S 신청내용, 정보(서비스 접수정보, 서비스 처리결과 정보 등) 수신 여부<br />
          ο 선택항목: 생년월일, 성별, 결혼여부, 직업<br /><br />
          ■ 개인정보의 수집 및 이용목적<br /><br />
          (주)시몬스는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br />
          ο A/S 업무<br />
          ο 마케팅 및 광고에 활용: 이벤트 등 광고성 정보 전달<br /><br />
          ■ 개인정보의 보유 및 이용기간<br /><br />
          원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.<br />
          위와 같은 개인정보 수집 및 이용에 동의하시면 아래 네모 칸에 “V” 표시를 하여 주시기 바랍니다.
        </p>
      </div>
      <div class="agreeBox">
        <span>위의 개인정보취급방침에 동의하십니까?(필수)</span>
        <input type="checkbox" name="privacy" value="동의" id="privacy" />
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
        <input type="checkbox" name="marketing" id="marketing" />
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
              <td><input type="text" class="name" name="name" value="${empty loggedMember?'':loggedMember.name }" /></td>
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
              <th rowspan="3">주소 *</th>
              <td>
                <input type="text" name="zipCode" class="zipcode" name="zipcode" value="${empty loggedMember?'':loggedMember.zipCode }" />
                <button id="address">우편번호 찾기</button>
              </td>
            </tr>
            <tr>
              <td>
                <input type="text" class="address address01" name="address01" placeholder="도로명주소" value="${empty loggedMember?'':loggedMember.address01 }" />
                <input type="text" class="address address03" name="address03" placeholder="상세주소" value="${empty loggedMember?'':loggedMember.address03 }" />
              </td>
            </tr>
            <tr>
              <td>
                <input type="text" class="address address02" name="address02" placeholder="지번주소"  value="${empty loggedMember?'':loggedMember.address02 }" />
                <input type="text" class="address address04" readonly value="${empty loggedMember?'':loggedMember.address03 }" />
              </td>
            </tr>
            <tr>
              <th>이메일 *</th>
              <td>
                <input type="text" class="email01" name="email01" value="${empty loggedMember?'':loggedMember.email01 }" />
                <span>@</span>
                <input type="text" class="email02" name="email02" value="${empty loggedMember?'':loggedMember.email02 }" />
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
            <tr>
              <th>구입일자</th>
              <td><input type="text" name="buyDate" /></td>
            </tr>
            <tr>
              <th>구입처</th>
              <td><input type="text" name="buyPlace" /></td>
            </tr>
            <tr>
              <th>분류</th>
              <td>
                <select class="category" name="category">
                  <option value="">선택</option>
                  <option value="프레임">프레임</option>
                  <option value="매트리스">매트리스</option>
                  <option value="기타">기타</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>규격</th>
              <td><input type="text" name="standard" placeholder="규격을 입력하세요" /></td>
            </tr>
            <tr>
              <th rowspan="2">모델</th>
              <td><input type="text" name="pname" /></td>
            </tr>
            <tr>
              <td>
                <span>
                  * 모델은 머리판 뒤쪽에 붙어있는 품질보증서에서 확인하실 수 있습니다. 매트리스는 상면에 있는 라벨에서 확인하실 수 있습니다.<br />
                  (라벨에 대한 자세한 설명은 제품 > 매트리스에서 확인하실 수 있습니다.)</span
                >
              </td>
            </tr>
            <tr>
              <th>제목 *</th>
              <td><input type="text" class="title" name="title" /></td>
            </tr>
            <tr>
              <th>신청내용 *</th>
              <td class="textarea">
                <textarea name="contents" id="conentsTxt"></textarea>
                <p><span class="txtCount">0</span> / 4000자</p>
              </td>
            </tr>
            <tr>
              <th rowspan="2" class="bottom">첨부파일</th>
              <td class="fileBox">
                <input type="text" class="fileName" />
                <label><input type="file" name="multipartFile" id="file">파일선택</label>
              </td>
            </tr>
            <tr class="bottom">
              <td><span>* 파일 첨부는 1개만 가능하므로, 복수의 사진파일 업로드를 희망할 경우 압축파일 형태로 업로드 해주시기 바랍니다</span></td>
            </tr>
          </tbody>
        </table>
        <div class="btns">
          <button class="btn" type="submit">신청하기</button>
        </div>
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

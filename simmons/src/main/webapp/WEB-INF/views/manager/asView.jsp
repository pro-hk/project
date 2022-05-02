<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>

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
      <h1>AS VIEW</h1>
    </div>

    <!-- 상단 5개 선택 -->
    <ul class="customerList managerList">
      <li><a href="FaqList">FAQ</a></li>
      <li><a href="QnaList">Q&A</a></li>
      <li><a href="CounselList">1:1 전화상담 신청</a></li>
      <li class="on"><a href="AsList">A/S 신청</a></li>
      <li><a href="NoticeList">공지사항</a></li>
    </ul>

    <div class="view">
      <table>
        <colgroup>
          <col style="width: 20%" />
          <col style="width: 80%" />
        </colgroup>
        <tbody>
          <tr class="top">
            <th>이름</th>
            <td>${asDto.name}</td>
          </tr>
          <tr>
            <th>제목</th>
            <td>${asDto.title}</td>
          </tr>
          <tr>
            <th>휴대전화</th>
            <td>${asDto.phone01}-${asDto.phone02}-${asDto.phone03}</td>
          </tr>
          <tr>
            <th>우편번호</th>
            <td>${asDto.zipCode}</td>
          </tr>
          <tr>
            <th>주소</th>
            <td>${asDto.address01} ${asDto.address03}</td>
          </tr>
          <tr>
            <th>email</th>
            <td>${asDto.email01}@${asDto.email02 }</td>
          </tr>
          <tr>
            <th>구입일자</th>
            <td>${asDto.buyDate }</td>
          </tr>
          <tr>
            <th>구입처</th>
            <td>${asDto.buyPlace }</td>
          </tr>
          <tr>
            <th>분류</th>
            <td>${asDto.category }</td>
          </tr>
          <tr>
            <th>규격</th>
            <td>${asDto.standard }</td>
          </tr>
          <tr>
            <th>모델</th>
            <td>${asDto.pname }</td>
          </tr>
          <tr>
            <th>문의내용</th>
            <td>${asDto.contents }</td>
          </tr>
          <tr>
            <th>마켓팅동의</th>
            <td>${asDto.marketing }</td>
          </tr>
          <tr>
            <th>등록일</th>
            <td>${asDto.regDate }</td>
          </tr>
          <tr>
            <th>첨부사진</th>
            <td><img src="${asDto.fileName }" /></td>
          </tr>
          <tr>
            <th>처리일</th>
            <td>${asDto.replyRegDate }</td>
          </tr>
          <tr class="bottom">
            <th>처리내용</th>
            <td><textarea class="asAnswer">${asDto.answer }</textarea></td>
          </tr>
        </tbody>
      </table>
      <div class="btns">
        <a class="delete asDelete">AS처리삭제</a>
        <a class="confirm asReply">AS처리입력</a>
        <a href="AsList" class="cancel">목록</a>
      </div>
    </div>
  </div>

  <!-- 탑 버튼 -->
  <div class="btnTop">
    <a href=""><img src="../images/main/btn_top.png" alt="" /></a>
  </div>
</main>
<!-- main end -->

<%@ include file="../include/footer.jsp"%>

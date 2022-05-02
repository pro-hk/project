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
      <h1>COUNSEL VIEW</h1>
    </div>

    <!-- 상단 5개 선택 -->
    <ul class="customerList managerList">
      <li><a href="FaqList">FAQ</a></li>
      <li><a href="QnaList">Q&A</a></li>
      <li class="on"><a href="CounselList">1:1 전화상담 신청</a></li>
      <li><a href="AsList">A/S 신청</a></li>
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
            <td>${counselDto.name}</td>
          </tr>
          <tr>
            <th>제목</th>
            <td>${counselDto.title}</td>
          </tr>
          <tr>
            <th>휴대전화</th>
            <td>${counselDto.phone01}-${counselDto.phone02}-${counselDto.phone03}</td>
          </tr>
          <tr>
            <th>연락희망시간</th>
            <td>${counselDto.callTime}</td>
          </tr>
          <tr>
            <th>도시</th>
            <td>${counselDto.city}</td>
          </tr>
          <tr>
            <th>email</th>
            <td>${counselDto.email01}@${counselDto.email02 }</td>
          </tr>
          <tr>
            <th>문의내용</th>
            <td>${counselDto.contents }</td>
          </tr>
          <tr>
            <th>마켓팅동의</th>
            <td>${counselDto.marketing }</td>
          </tr>
          <tr>
            <th>등록일</th>
            <td>${counselDto.regDate }</td>
          </tr>
          <tr>
            <th>통화일</th>
            <td>${counselDto.replyRegDate }</td>
          </tr>
          <tr class="bottom">
            <th>통화내용</th>
            <td><textarea class="counselAnswer">${counselDto.answer }</textarea></td>
          </tr>
        </tbody>
      </table>
      <div class="btns">
        <a class="delete counselDelete">통화내용삭제</a>
        <a class="confirm counselReply">통화내용입력</a>
        <a href="CounselList" class="cancel">목록</a>
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

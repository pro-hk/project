<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <li class="on"><a href="Faq">FAQ</a></li>
    <li class="Qna"><a href="Qna">Q&A</a></li>
    <li><a href="Counsel">1:1 전화상담 신청</a></li>
    <li><a href="As">A/S 신청</a></li>
    <li><a href="Notice">공지사항</a></li>
  </ul>

  <!-- contents / DB작업 -->
  <div class="customerContents faq">
    <!-- as선택시 없어야함 -->
    <div class="searchBox">
      <input type="text" placeholder="검색어를 입력하세요" class="faqTxt" />
      <button class="faqSearch">검색</button>
    </div>
    <div class="faqTab">
      <label>
        <input type="radio" name="faqTap" value="1" checked />
        <span>회원</span>
      </label>
      <label>
        <input type="radio" name="faqTap" value="2" />
        <span>상품문의</span>
      </label>
      <label>
        <input type="radio" name="faqTap" value="3" />
        <span>교환/환불/반품</span>
      </label>
      <label>
        <input type="radio" name="faqTap" value="4" />
        <span>AS/품질보증</span>
      </label>
      <label>
        <input type="radio" name="faqTap" value="5" />
        <span>주문/배송</span>
      </label>
      <label>
        <input type="radio" name="faqTap" value="6" />
        <span>기타</span>
      </label>
    </div>
    <ul class="faqContents">
      <li class="on">
        <ul id="faqList01">
        <c:forEach items="${faqList01 }" var="faqDto">
          <li>
            <div class="question">
              <h2>Q. ${faqDto.question }</h2>
              <span class="material-icons on">expand_more</span>
              <span class="material-icons off">expand_less</span>
            </div>
            <div class="answer">
              <h2>A</h2>
              <p>
                ${faqDto.answer }
              </p>
            </div>
          </li>
        </c:forEach>
        </ul>
      </li>
      <li>
        <ul id="faqList02">
      	<c:forEach items="${faqList02 }" var="faqDto">
          <li>
            <div class="question">
              <h2>Q. ${faqDto.question }</h2>
              <span class="material-icons on">expand_more</span>
              <span class="material-icons off">expand_less</span>
            </div>
            <div class="answer">
              <h2>A</h2>
              <p>
                ${faqDto.answer }
              </p>
            </div>
          </li>
        </c:forEach>
        </ul>
      </li>
      <li>
        <ul id="faqList03">
          <c:forEach items="${faqList03 }" var="faqDto">
          <li>
            <div class="question">
              <h2>Q. ${faqDto.question }</h2>
              <span class="material-icons on">expand_more</span>
              <span class="material-icons off">expand_less</span>
            </div>
            <div class="answer">
              <h2>A</h2>
              <p>
                ${faqDto.answer }
              </p>
            </div>
          </li>
        </c:forEach>
        </ul>
      </li>
      <li class="warranty">
        <div class="txtBox">
          <div>
            <img src="../images/main/cs_warranty.jpg" alt="" />
          </div>
          <div>
            <h2>
              15 Years Warranty<br />
              업계 최초 포켓스프링 15년 무상보증.
            </h2>
            <p>
              시몬스의 품질 자부심, 고객서비스로 이어갑니다. <br />
              시몬스는 포켓스프링 무상보증정책을 통해 제품의 우수성과 품질관리를 증명하고 있습니다.<br />
              공의적인 파손이나 과실로 인한 하자를 제외하고는 15년간 발생하는 스프링 하자에 대하여 무상 서비스를 원칙으로 합니다.<br /><br />
              ※ 사업자가 인정하는 제조상의 문제로 발생하는 하자에 한해서 포켓스프링은 15년, 오픈스프링은 5년 무상보증정책을 적용하며, 그 외 일반적인 사항에 대해서는 1년 보증을 원칙으로 합니다.
            </p>
          </div>
        </div>
        <table>
          <colgroup>
            <col style="width: 25%" />
            <col style="width: 15%" />
            <col style="width: 25%" />
            <col style="width: 35%" />
          </colgroup>
          <thead>
            <tr>
              <th>보증항목</th>
              <th>보증기간</th>
              <th>보상기준</th>
              <th>비고</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>일반적 사항(모터포함)</td>
              <td>1년</td>
              <td>무상수리</td>
              <td rowspan="15">
                <h2>※ 보증기간 경과 시에는 유상 수리</h2>
                <p>
                  보증기간은 구입일을 기준으로 하며 구입일 확인이<br />
                  불가능한 경우에 제조일로부터 3개월이 경과된 시점을<br />
                  구입일로 합니다.
                </p>
                <h2>※ 부품 보유기간</h2>
                <p>부품보유기간은 해당 모델의 생산중기 후 5년 입니다.</p>
                <h2>※ 매트리스 보증</h2>
                <p>
                  사업자가 인정하는 제조상의 문제로 발생하는<br />
                  하자(스프링꺼짐, 스프링 파손, 스프링 소음 등)에 한해서<br />
                  포켓스프링은 15년, 오픈스프링은 5년 보증을 적용하고 그<br />
                  외 일반적인 사항에 대해서는 1년 보증을 원칙으로 합니다.
                </p>
                <table class="innerTable">
                  <tr>
                    <th>구분</th>
                    <th>보증기간</th>
                  </tr>
                  <tr>
                    <td>포켓스프링</td>
                    <td>15년</td>
                  </tr>
                  <tr>
                    <td>오픈스프링</td>
                    <td>5년</td>
                  </tr>
                </table>
                <h2>※ 비용부담</h2>
                <p>
                  1. 무상수리: 수리에 소요되는 부품가 및 원자재 비용 등<br />
                  제비용을 사업자가 부담.
                </p>
                <p>
                  2. 유상수리: 수리에 소요되는 순수 부품대, 원자재 비용,<br />
                  소정의 출장비 및 수리비를 소비자가 부담.
                </p>
                <h2>※ 교환 및 환불기준</h2>
                <p>
                  1. 제품 교환의 경우 동일제품으로 교환을 원칙으로 하며,<br />
                  동일제품 교환이 불가능 할 때에는 동종의 유사제품으로<br />
                  교환합니다.
                </p>
                <p>
                  2. 교환 또는 환불의 경우 구입가격(증서 또는 영수증에<br />
                  기재된 금액)을 기준으로 하며, 다만 구입가격의 입증이<br />
                  불가능할 때에는 판매가격을 구입가격으로 봅니다.
                </p>
              </td>
            </tr>
            <tr>
              <td rowspan="3">좀 등 벌레발생</td>
              <td>10일 이내</td>
              <td>제품교환 또는 구입가 환불</td>
            </tr>
            <tr>
              <td>2년 이내</td>
              <td>무상수리 또는 부품교환</td>
            </tr>
            <tr>
              <td>동일하자 재발생</td>
              <td>제품교환</td>
            </tr>
            <tr>
              <td rowspan="4">좀 등 벌레발생</td>
              <td>10일 이내</td>
              <td>제품교환 또는 구입가 환불</td>
            </tr>
            <tr>
              <td>6개월 이내</td>
              <td>제품교환</td>
            </tr>
            <tr>
              <td>3년 이내</td>
              <td>무상수리 또는 부품교환</td>
            </tr>
            <tr>
              <td>동일하자 재발생</td>
              <td>제품교환</td>
            </tr>
            <tr>
              <td>색상의 차이</td>
              <td>1개월 이내</td>
              <td>제품교환 (동일색상이 없을 경우 구입가 환불)</td>
            </tr>
            <tr>
              <td>악취 등 자극성 냄새(화학약품 등)</td>
              <td>6개월 이내</td>
              <td>제품 교환 또는 구입가 환불</td>
            </tr>
            <tr>
              <td>규격치수 허용오차</td>
              <td></td>
              <td>제품교환</td>
            </tr>
            <tr>
              <td rowspan="2">침대품질 불량(스프링, 매트리스)</td>
              <td>10일 이내</td>
              <td>제품교환 또는 구입가 환불</td>
            </tr>
            <tr>
              <td>5년 이내</td>
              <td>부품교환 또는 무상수리</td>
            </tr>
            <tr>
              <td>제조 또는 신제품 인도 시 생긴 흠집</td>
              <td>15일 이내</td>
              <td>제품교환</td>
            </tr>
            <tr class="line">
              <td>
                품질보증 기간 내에 2회 수리를 받았으나<br />
                3회 동일하자 발생
              </td>
              <td></td>
              <td>제품교환 또는 구입가 환불</td>
            </tr>
          </tbody>
        </table>
      </li>
      <li>
        <ul id="faqList05">
          <c:forEach items="${faqList05 }" var="faqDto">
          <li>
            <div class="question">
              <h2>Q. ${faqDto.question }</h2>
              <span class="material-icons on">expand_more</span>
              <span class="material-icons off">expand_less</span>
            </div>
            <div class="answer">
              <h2>A</h2>
              <p>
                ${faqDto.answer }
              </p>
            </div>
          </li>
        </c:forEach>
        </ul>
      </li>
      <li>
        <ul id="faqList06">
          <c:forEach items="${faqList06 }" var="faqDto" varStatus="index">
          <li>
            <div class="question">
              <h2>Q. ${faqDto.question }</h2>
              <span class="material-icons on">expand_more</span>
              <span class="material-icons off">expand_less</span>
            </div>
            <div class="answer">
              <h2>A</h2>
              <p>
                ${faqDto.answer }
              </p>
            </div>
          </li>
        </c:forEach>
        </ul>
      </li>
    </ul>
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

<%@ include file="../include/login.jsp" %>
<%@ include file="../include/footer.jsp" %>
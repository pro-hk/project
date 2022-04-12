<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- main -->
    <main id="main">
      <div class="container">
        <!-- lnb -->
        <ul class="lnb">
          <li><a href="">HOME</a></li>
          <li><a href="">고객센터</a></li>
          <li><a href="">FAQ 등록</a></li>
        </ul>

		<div class="txtBox lineOff">
		    <h1>FAQ 등록</h1>
		</div>

        <!-- form -->
        <form action="FaqUpdateProcess" method="post">
          <input type="hidden" name="no" value=${param.no }>
          <table>
            <colgroup>
              <col style="width: 20%" />
              <col style="width: 80%" />
            </colgroup>
            <tbody>
                <tr class="top">
            	<th>카테고리</th>
            	<td>
            		<select name="category" class="category">
            			<option value="회원" ${faqDto.category=='회원'? "selected":"" }>회원</option>
            			<option value="상품문의" ${faqDto.category=='상품문의'? "selected":"" }>상품문의</option>
            			<option value="교환/환불/반품" ${faqDto.category=='교환/환불/반품'? "selected":"" }>교환/환불/반품</option>
            			<option value="주문/배송" ${faqDto.category=='주문/배송'? "selected":"" }>주문/배송</option>
            			<option value="기타" ${faqDto.category=='기타'? "selected":"" }>기타</option>
            		</select>
            	</td>
        		</tr>
            	<tr>
                <th>질문</th>
                <td><input type="text" name="question" class="question" value="${faqDto.question }" /></td>
              </tr>
              <tr class="bottom">
                <th>답변</th>
                <td class="textarea">
                  <textarea name="answer" class="answer" >${faqDto.answer }</textarea>
                </td>
              </tr>              
            </tbody>
          </table>
          <div class="btns">
            <button type="submit" class="comfirm btn">수정</button>
            <a href="FaqView?no=${faqDto.no }" class="cancel btn">취소</a>
          </div>
        </form>
        <!-- form end -->
      </div>
    </main>
    <!-- main end -->
    
<%@ include file="../include/footer.jsp" %>
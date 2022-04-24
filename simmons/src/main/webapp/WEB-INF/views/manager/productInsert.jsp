<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp" %>

<main>
	<div class="container">
  <div class="txtBox" style="margin-top: 100px">
    <h2>제품등록</h2>
  </div>
  <form action="ProductInsertProcess" method="post" enctype="multipart/form-data">
    <table>
      <colgroup>
        <col style="width: 30%" />
        <col style="width: 14%" />
        <col style="width: 14%" />
        <col style="width: 14%" />
        <col style="width: 14%" />
        <col style="width: 14%" />
      </colgroup>
      <tbody>
        <!-- 카테고리 -->
        <tr>
          <th class="Category">카테고리 *</th>
          <td>
            <select name="category">
              <option value="MATTRESS">MATTRESS</option>
              <option value="FRAME">FRAME</option>
              <option value="ROOM SET">ROOM SET</option>
              <option value="FOUNDATION">FOUNDATION</option>
              <option value="FURNITURE">FURNITURE</option>
              <option value="BEDDING">BEDDING</option>
              <option value="FRAGRANCE">FRAGRANCE</option>
            </select>
          </td>
        </tr>
        <!-- 품명 -->
        <tr>
          <th class="Name">품명 *</th>
          <td colspan="3"><input type="text" name="pname" /></td>
        </tr>
        <!-- 구성품 -->
        <tr>
          <th class="Component">구성품 *</th>
          <td class="textarea"><textarea name="component"></textarea></td>
        </tr>
        <!-- 주요소재 -->
        <tr>
          <th class="Material">주요소재 *</th>
          <td class="textarea"><textarea name="material"></textarea></td>
        </tr>
        <!--제조사/원산지 -->
        <tr>
          <th class="Productor">제조사/원산지 *</th>
          <td><textarea name="productor"></textarea></td>
        </tr>
        <!-- 배송,설치비용 -->
        <tr>
          <th class="Delivery">배송,설치비용</th>
          <td>
            <select name="delivery">
              <option value="">배송선택</option>
              <option value="no">배송, 설치비용 없음</option>
              <option value="free">무료배송</option>
            </select>
          </td>
        </tr>
        <!-- 품질보증기준 -->
        <!-- <tr>
          <th class="Guarantee">품질보증기준</th>
          <td> -->
          	<input type="hidden" name="guarantee" value="공정거래위원회 고시(소비자분쟁해결기준)에 의거하여 보상해드립니다" />
          <!-- </td>
        </tr> -->
        <!-- 취급주의사항 -->
        <tr>
          <th class="Precaution">취급주의사항</th>
          <td><textarea type="text" name="precaution" ></textarea></td>
        </tr>
        <!-- 자가검사번호 -->
        <tr>
          <th class="Test">자가검사번호</th>
          <td><input type="text" name="test"/></td>
        </tr>
        <!-- 사진 -->
        <tr>
          <th class="Img">사진</th>
          <td><input multiple="multiple" type="file" name="multipartFile" placeholder="이미지파일" id="Img" /></td>
        </tr>
        <!-- 본문내용 -->
        <tr>
          <th class="Content">본문내용 *</th>
          <td class="textarea"><textarea placeholder="내용을 입력해주세요" name="contents" id="summernote"></textarea></td>
        </tr>
        <tr>
          <th class="Color">색상</th>
          <td><input type="text" name="color01" /></td>
          <td><input type="text" name="color02" /></td>
          <td><input type="text" name="color03" /></td>
          <td><input type="text" name="color04" /></td>
          <td><input type="text" name="color05" /></td>
        </tr>
        <tr>
          <th>사이즈</th>
          <td><input type="text" name="sizes01" /></td>
          <td><input type="text" name="sizes02" /></td>
          <td><input type="text" name="sizes03" /></td>
          <td><input type="text" name="sizes04" /></td>
          <td><input type="text" name="sizes05" /></td>
        </tr>
        <tr>
          <th>스펙</th>
          <td><input type="text" name="spec01" /></td>
          <td><input type="text" name="spec02" /></td>
          <td><input type="text" name="spec03" /></td>
          <td><input type="text" name="spec04" /></td>
          <td><input type="text" name="spec05" /></td>
        </tr>
        <tr>
          <th>가격</th>
          <td><input type="text" name="price01" /></td>
          <td><input type="text" name="price02" /></td>
          <td><input type="text" name="price03" /></td>
          <td><input type="text" name="price04" /></td>
          <td><input type="text" name="price05" /></td>
        </tr>
        <tr>
          <th>경도</th>
          <td><input type="text" name="hardness" /></td>
        </tr>
        <tr>
          <th>타입</th>
          <td>
            <input type="text" name="type" />
	      	<label><input type="checkbox" name="pattern" value="A" checked />A</label>
	      	<label><input type="checkbox" name="pattern" value="B" />B</label>
	      </td>
        </tr>
      </tbody>
    </table>
    <div class="btns">
      <button type="submit" class="btn confirm">작성</button>
    </div>
  </form>
	</div>
</main>

<%@ include file="../include/footer.jsp" %>

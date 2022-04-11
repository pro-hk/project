<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
    
<main>
<h2>상품수정</h2>
    <ul>
      <li>
        MATTRESS
        <!-- 제품상세시작 -->
        <table>
          <div>
            <tr>
              <caption>
                <input type="checkbox" />제품명
              </caption>
              <span class="material-icons-outlined">
                import_export
                </span>
              <th>size</th>
              <th>color</th>
              <th>수량</th>
              <th>품절</th>
              <td rowspan="4"><button>수정</button></td>
              <td rowspan="4"><button>취소</button></td>
            </tr>
            <tr>
              <td rowspan="3">kk</td>
              <td>bk</td>
              <td><input /></td>
              <td><input type="checkbox" /></td>
            </tr>
            <tr>
              <td>red</td>
              <td><input /></td>
              <td><input type="checkbox" /></td>
            </tr>
            <tr>
              <td>white</td>
              <td><input /></td>
              <td><input type="checkbox" /></td>
            </tr>
          </div>
        </table>
        <!-- 두번째 제품 -->
        <table>
          <div>
            <tr>
              <caption>
                <input type="checkbox" />제품명
              </caption>
              <span class="material-icons-outlined">
                import_export
                </span>
              <td>size</td>
              <td>color</td>
              <td>수량</td>
              <td>품절</td>
              <td rowspan="4"><button>수정</button></td>
              <td rowspan="4"><button>취소</button></td>
            </tr>
            <tr>
              <td rowspan="3">qq</td>
              <td>bk</td>
              <td><input /></td>
              <td><input type="checkbox" /></td>
            </tr>
            <tr>
              <td>red</td>
              <td><input /></td>
              <td><input type="checkbox" /></td>
            </tr>
            <tr>
              <td>white</td>
              <td><input /></td>
              <td><input type="checkbox" /></td>
            </tr>
          </div>
        </table>
      </li>
      <!-- 제품상세끝 -->
      <li>
          FRAME
          <!-- 제품상세시작 -->
        <table>
            <div>
              <tr>
                <caption>
                  <input type="checkbox" />제품명
                </caption>
                <th>size</th>
                <th>color</th>
                <th>수량</th>
                <th>품절</th>
                <td rowspan="4"><button>수정</button></td>
                <td rowspan="4"><button>취소</button></td>
              </tr>
              <tr>
                <td rowspan="3">kk</td>
                <td>bk</td>
                <td><input /></td>
                <td><input type="checkbox" /></td>
              </tr>
              <tr>
                <td>red</td>
                <td><input /></td>
                <td><input type="checkbox" /></td>
              </tr>
              <tr>
                <td>white</td>
                <td><input /></td>
                <td><input type="checkbox" /></td>
              </tr>
            </div>
          </table>
          <!-- 두번째 제품 -->
          <table>
            <div>
              <tr>
                <caption>
                  <input type="checkbox" />제품명
                </caption>
                <td>size</td>
                <td>color</td>
                <td>수량</td>
                <td>품절</td>
                <td rowspan="4"><button>수정</button></td>
                <td rowspan="4"><button>취소</button></td>
              </tr>
              <tr>
                <td rowspan="3">qq</td>
                <td>bk</td>
                <td><input /></td>
                <td><input type="checkbox" /></td>
              </tr>
              <tr>
                <td>red</td>
                <td><input /></td>
                <td><input type="checkbox" /></td>
              </tr>
              <tr>
                <td>white</td>
                <td><input /></td>
                <td><input type="checkbox" /></td>
              </tr>
            </div>
          </table>
        </li>
        <!-- 제품상세끝 -->
        </li>
      <li>ROOM SET</li>
      <li>FOUNDATION</li>
      <li>FURNITURE</li>
      <li>BEDDING</li>
      <li>FRAGRANCE</li>
    </ul>
    <div>
      <button>제품삭제</button>
    </div>
</main>
<%@ include file="../include/footer.jsp" %>
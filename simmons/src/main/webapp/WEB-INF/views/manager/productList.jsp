<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<main id="main">
	<div class="container">
	
	  <!-- 메인 화면 -->
	  <div class="txtBox lineOff">
	    <h1>PRODUCT LIST</h1>
	  </div>
	
	  <!-- contents / DB작업 -->
	  <div class="customerContents notice">
	    <div class="searchBox">
	      <select name="" id="">
	        <option value="">선택</option>
	        <option value="title">제목</option>
	        <option value="contents">내용</option>
	      </select>
	      <input type="text" placeholder="검색어를 입력하세요" />
	      <button>검색</button>
	    </div>
	  </div>
	    
		<h2>상품수정</h2>
	   <ul>
	     <li>
	       MATTRESS
	       <!-- 제품상세시작 -->
	       <table>
	           <tr>
	             <caption>
	               <input type="checkbox" />제품명
	             </caption>
	             <span class="material-icons-outlined">import_export</span>
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
	       </table>
	       <!-- 두번째 제품 -->
	       <table>
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
	       </table>
	     </li>
	     <!-- 제품상세끝 -->
	     <li>
	         FRAME
	         <!-- 제품상세시작 -->
	       <table>
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
	         </table>
	         <!-- 두번째 제품 -->
	         <table>
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
	         </table>
	       </li>
	       <!-- 제품상세끝 -->
	     <li>ROOM SET</li>
	     <li>FOUNDATION</li>
	     <li>FURNITURE</li>
	     <li>BEDDING</li>
	     <li>FRAGRANCE</li>
	   </ul>
	   <div>
	     <button>제품삭제</button>
	   </div>
	    
	    <div class="write">
	    	<a href="ProductInsert">제품등록</a>
	    </div>
	    
	    <div class="page">
	      <span class="material-icons"> arrow_left </span>
	      <ul>
	        <li class="on"><a href="">1</a></li>
	        <li><a href="">2</a></li>
	        <li><a href="">3</a></li>
	        <li><a href="">4</a></li>
	        <li><a href="">5</a></li>
	        <li><a href="">6</a></li>
	        <li><a href="">7</a></li>
	        <li><a href="">8</a></li>
	        <li><a href="">9</a></li>
	        <li><a href="">10</a></li>
	      </ul>
	      <span class="material-icons"> arrow_right </span>
	    </div>
	  </div>
</main>

<%@ include file="../include/footer.jsp"%>
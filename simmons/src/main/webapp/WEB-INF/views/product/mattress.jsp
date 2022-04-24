<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<main>
	<div id="contents">
		<div class="proTop">
		    <ul class="miniMenu">
		        <li><a href="/">HOME</a></li>
		        <li>
		            <a href="/">PRODUCT</a>
		            <ul class="miniSub">
		                <li><a href="">Beautyrest BLACK</a></li>
		                <li><a href="">COLLECTION</a></li>
		                <li><a href="">PRODUCT</a></li>
		                <li><a href="">ONLINE STORE</a></li>
		                <li><a href="">OUTLET</a></li>
		                <li><a href="">ABOUT US</a></li>
		                <li><a href="">BFACTORIUM</a></li>
		                <li><a href="">SIMMONS GALLERY</a></li>
		                <li><a href="">매장 찾기</a></li>
		            </ul>
		        </li>
		        <li>
		            <a href="/">MATTRESS</a>
		            <ul class="miniSub2">
		                <li><a href="">MATTRESS</a></li>
		                <li><a href="">FRAME</a></li>
		                <li><a href="">ROOM SET</a></li>
		                <li><a href="">FOUNDATION</a></li>
		                <li><a href="">FURNITURE</a></li>
		                <li><a href="">BEDDING</a></li>
		                <li><a href="">FRAGRANCE</a></li>
		            </ul>
		        </li>
		    </ul>
		    <h2>MATTRESS</h2>
		</div>
		<div class="proList">
		    <div class="option">
		        <a href="" class="mGuide">
		            <img src="../images/product/mattress/btn_emotion.png" alt="EMOTION SCIENCE 내 몸에 맞는 매트리스를 찾아보세요." title />
		        </a>
		        <dl class="mat">
		            <dt class="size"><a href="(?이미지)+팝업"></a></dt>
		            <dd>
		                <div class="select select2">
		                    <label for="matSize">전체사이즈</label>
		                    <select name="matSize" id="sizes" class="select">
		                        <option value="">전체사이즈</option>
		                        <option value="GK">GK / 그레이트킹</option>
		                        <option value="KK">KK / 킹오브킹</option>
		                        <option value="LK">LK / 라지킹</option>
		                        <option value="QE">QE / 퀸</option>
		                        <option value="SS">SS / 슈퍼싱글</option>
		                    </select>
		                </div>
		            </dd>
		            <dt class="firm"><a href="(?이미지)+팝업"></a></dt>
		            <dd>
		                <div class="select select2">
		                    <label for="wgpFlag">전체경도</label>
		                    <select name="wgpFlag" id="hardness" class="select select2">
		                        <option value key="전체경도">전체경도</option>
		                        <option value="P" key="P CLASS">P CLASS / 하드 타입</option>
		                        <option value="G" key="G CLASS">G CLASS / 레귤러 타입</option>
		                        <option value="W" key="W CLASS">W CLASS / 소프트 타입</option>
		                    </select>
		                </div>
		            </dd>
		            <dd>
		                <div class="select">
		                    <label>판매처</label>
		                    <select name="matket" class="select">
		                        <option>판매처</option>
		                        <option value="DI">직영</option>
		                        <option value="O">온라인</option>
		                        <option value="S">아울렛</option>
		                    </select>
		                </div>
		            </dd>
		        </dl>
		    </div>
		</div>
		<!-- 제품사진 자바스크립으로 슬라이더작업 -->
	    <div class="SliderBox">
	        <ul id="items">
	            <c:forEach items="${productList }" var="items" varStatus="itemsIdx">
	            <li class="itemList">
	                <a id="productDetail${itemsIdx.index }" href="Detail?no=${items.no }">
	                    <img src="${items.img.split(',')[0] }" alt="" />
	                    <div class="hoverBox">
	                        <span class="cover">
	                            <span class="box">직영</span>
	                            <span class="name">
	                            	<c:forTokens items="${items.pname }" delims=" " var="pname" varStatus="idx">
	                                <p class="pname${idx.index }">${pname }</p>
	                            	</c:forTokens>
	                            </span>
	                            <span class="bogi">
	                                <i>더보기</i>
	                            </span>
	                        </span>
	                    </div>
	                </a>
	            </li>
	            </c:forEach>
	        </ul>
	    </div>
	</div>
</main>

<%@ include file="../include/footer.jsp" %>
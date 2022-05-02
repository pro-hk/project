<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<main>
	<div class="detailTop">
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
	</div>
	<div id="view" class="product">
	    <div class="left">
	        <div class="leftVisual">
						<button class="visualLeft">Prev</button>
	            <ul class="visual swiper-wrapper">
	            	<c:forTokens items="${productDto.img }" delims="," var="img">
	            		<li class="swiper-slide"><img class="pname" src="${img}" /></li>
	            	</c:forTokens>
	            </ul>
						<button class="visualRight">Next</button>
	        </div>
	        <div class="emotion">
	            <div class="title">
	                <h3>EMOTION SCIENCE</h3>
	                <p class="prodview">수면 습관과 체형 등 사용자 개인의 기준에 따라 느껴지는 정도에 차이가 있을 수 있습니다</p>
	            </div>
	            <div class="content">
	                <div class="move">
	                    <ul>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li></li>
	                        <li></li>
	                        <img src="../images/product/mattress/view/emotion_move_bg.png" />
	                    </ul>
	                    <dl>
	                        <dt>Move Free</dt>
	                        <dd>
	                            <p>흔들리지 않는 편안함을</p>
	                            <p>정량적으로 풀어낸 진동 방지 값</p>
	                        </dd>
	                    </dl>
	                </div>
	                <div class="firm">
	                    <ul>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <img src="../images/product/mattress/view/emotion_firm_bg.png" />
	                    </ul>
	                    <dl>
	                        <dt>Firmness</dt>
	                        <dd>
	                            <p>매트리스의 소프트∙레귤러∙하드함의 경도</p>
	                        </dd>
	                    </dl>
	                </div>
	                <div class="eco">
	                    <ul>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <li class="on"></li>
	                        <img src="../images/product/mattress/view/emotion_eco_bg.png" />
	                    </ul>
	                    <dl>
	                        <dt>Eco-friendly</dt>
	                        <dd>
	                            <p>친환경 소재의 제품 적용률</p>
	                            <span>
	                                <p>국내 자체 생산 매트리스 모든 제품에</p>
	                                <p>국가 공인 친환경 인증 획득</p>
	                            </span>
	                        </dd>
	                    </dl>
	                </div>
	                <div class="touch">
	                    <ul>
	                        <li class="on"></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <li></li>
	                        <img src="../images/product/mattress/view/emotion_touch_bg.png" />
	                    </ul>
	                    <dl>
	                        <dt>Touch</dt>
	                        <dd>
	                            <p>매트리스 원단 촉감의 부드러운 정도</p>
	                        </dd>
	                    </dl>
	                </div>
	            </div>
	        </div>
	        <div class="productContents">
	            ${productDto.contents}
	        </div>
	        <div class="details">
	            <p>
	                <img src="../images/product/mattress/view/de.jpeg" alt="" />
	            </p>
	            <table class="edit">
	                <tbody>
	                    <tr>
	                        <td>품명</td>
	                        <td><p id="pname">${productDto.pname }</p></td>
	                    </tr>
	                    <tr>
	                        <td>경도</td>
	                        <td>
	                            <p>${productDto.hardness } CLASS</p>
	                            <p>${hardnessContents }</p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>구성품</td>
	                        <td><p>${productDto.component}</p></td>
	                    </tr>
	                    <tr>
	                        <td>주요소재</td>
	                        <td>
	                            ${productDto.material }
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>크기</td>
	                        <td>
	                        	<c:forEach items="${sizeList}" var="sizeItem">
		                            <p>${sizeItem.sizes} ${sizeItem.spec}</p>
	                        	</c:forEach>
	                            <br />
	                            <p>더욱 커진 LK(라지킹)사이즈로 여유롭고 쾌적한 수면 환경을 만들어보세요</p>
	                            <span>※침대와 프레임은 브랜드별 사이즈가 상이하오니 세트 구매를 권장합니다</span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>제조사/원산지</td>
	                        <td><p>${productDto.productor }</p></td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	    <div class="right">
	        <div class="top">
	            <ul>
	                <li>직영</li>
	                <li><a href="사이즈 팝업" class="size">해당 제품 규격</a></li>
	            </ul>
	            	<h2>
	            	<c:forTokens items="${productDto.pname }" delims=" " var="pname">
	            		${pname}<br>
	            	</c:forTokens>
	            	</h2>
	            <div id="optwrap">
	                <dl>
	                    <dt>사이즈</dt>
	                    <dd>
	                        <select name="sizeOption" id="sizeOption">
	                            <option value="">선택하세요</option>
	                            <c:forEach items="${sizeList}" var="sizeItem">
		                            <option value="${sizeItem.sizes} / ${sizeItem.sizeName}">${sizeItem.sizes} / ${sizeItem.sizeName}</option>
	                        	</c:forEach>
	                        </select>
	                    </dd>
	                </dl>
	            </div>
	        </div>
	        <div class="bottom">
	            <dl class="sum">
	                <dt>판매가</dt>
	                <dd>
	                    <p id="orderprice">￦ 0</p>
	                </dd>
	            </dl>
	            <p>* 구매는 오프라인 매장에 문의해주세요</p>
	            <button id="buyButton">BUY</button>
	            <ul class="menu">
	                <li>
	                    <a class="addCart">
	                        <img src="../images/product/mattress/view/menu01.png" alt="" />
	                        <span>카트</span>
	                    </a>
	                </li>
	                <li>
	                    <a class="addWish" href="#">
	                        <img src="../images/product/mattress/view/menu02.png" alt="" />
	                        <span>위시리스트</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="공유하기 페이지">
	                        <img src="../images/product/mattress/view/menu03.png" alt="" />
	                        <span>공유하기</span>
	                    </a>
	                </li>
	            </ul>
	            <div class="nav">
	                <ul>
	                    <li><a href="룩북 스크롤">LOOKBOOK</a></li>
	                    <li><a href="스프링 스크롤">SPRING</a></li>
	                    <li><a href="레이어링 스크롤">LAYERING</a></li>
	                    <li><a href="디테일 스크롤">DETAIL</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
</main>

<script>
	const loggedMember = "<%=session.getAttribute("loggedId")%>";
	console.log(loggedMember);
	//product wish 추가
	$(".addWish").on("click", function () {
		const no = location.search.split("=")[1];
		const sendData = {
	    	no: no,
	    	pname: $("#pname").text(),
	    	img: $(".visual>li:first").children("img").attr("src"),
		};
		console.log("no=="+sendData.no);
		console.log("pname=="+sendData.pname);
		console.log("nimgo=="+sendData.img);
		if(loggedMember==null){
			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
				location.href="../member/Login";
				return false;
			} else {
				return false;
			}
		} else {
			console.log("클릭");
			$.ajax({
			    url: "WishAdd",
			    data: sendData,
			    method: "post",
			    success: function (res) {
			    	if (res == 1) {
			        	if (confirm("해당 상품이 위시리스트에 추가되었습니다.\r\n지금 위시리스트 페이지로 이동하시겠습니까?")) {
			        		location.href = "../member/Wish";
			        	} else {
			        		return false;
			      		}
			    	} else if (res == 2) {
			        	alert("이미 등록된 위시리스트 입니다");
			    	} else {
			        	alert("알 수 없는 오류");
			    	}
		    	},
			});
			return false;
		}
	});
</script>

<script>
	$("#buyButton").on("click", function() {
		if ($("#sizeOption").val() == "" || $("#sizeOption").text() == null) {
		    alert("옵션을 모두 선택해주셔야 합니다");
		    return false;
		  }
		  const sendData = {
			price:$("#orderprice").text(),
		    pname:$("#pname").text(),
		    sizes:$("#sizeOption").val(),
		  };
		  $.ajax({
		    url:"BuyProduct",
		    data:sendData,
		    dataType:"json", 
		    method:"POST",
		    success:function(result) {
				console.log(result);
		        const pname = result.pname;
		        const sizes = result.sizes;
		        const price = result.price;
		      	location.replace("../product/DetailResult?pname="+pname+"&sizes="+sizes+"&price="+price);
		    },
		  });
		});
	</script>

<%@ include file="../include/footer.jsp" %>
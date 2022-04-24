// 메뉴 클릭 - 숨겨진 메뉴 열기 & 좌측 메뉴 닫기 & 전체화면 블러
$("#menu").on("click", () => {
  $("#gnb").addClass("on");
  $(".cartBox").removeClass("on");
  $(".closePage").addClass("on");
});

// 메뉴 닫기 클릭 - 메뉴 닫기 & 전체화면 블러 삭제
$(".gnbClose").on("click", () => {
  $("#gnb").removeClass("on");
  $(".closePage").removeClass("on");
});

// 카트 클릭 - 숨겨진 메뉴 열기 & 우측 메뉴 닫기 & 전체화면 블러
$("#cart").on("click", () => {
  $("#gnb").removeClass("on");
  $(".cartBox").addClass("on");
  $(".closePage").addClass("on");
});

// 카트 닫기 클릭 - 메뉴 닫기 & 전체화면 블러 삭제
$(".cartClose").on("click", () => {
  $(".cartBox").removeClass("on");
  $(".closePage").removeClass("on");
});

// 블러된 화면 누르기 - 좌,우측 메뉴 닫기 & 전체화면 블러 삭제
$(".closePage").on("click", () => {
  $("#gnb").removeClass("on");
  $(".cartBox").removeClass("on");
  $(".closePage").removeClass("on");
});

// (메뉴) + 표시있는 글 클릭 - + -> - & 다른 li 닫기 & depth02 열기
$("#gnb .gnbList >li").on("click", function () {
  $(this).toggleClass("on").siblings().removeClass("on");
});

// (카트) CART 클릭 - 글자색 변경 & CARTLIST 불러오기
$(".cartBox .cart").on("click", function () {
  $(this).addClass("on").siblings().removeClass("on");
  $(".cartList .cartProduct").addClass("on");
  $(".cartList .cartLink").addClass("on");
  $(".cartList .recentProduct").removeClass("on");
});

// (카트) RECENT 클릭 - 글자색 변경 & RECENTLIST 불러오기
$(".cartBox .recent").on("click", function () {
  $(this).addClass("on").siblings().removeClass("on");
  $(".cartList .cartProduct").removeClass("on");
  $(".cartList .cartLink").removeClass("on");
  $(".cartList .recentProduct").addClass("on");
});

// cart 삭제
$(".cartProduct").on("click", ".cartDelete", function () {
  console.log("삭제클릭");
  const cartName = $(this).siblings("#cartName").text();
  const sendData = {
    pname: cartName.split(" ")[0],
    sizes: cartName.split(" ")[1] + " / " + cartName.split(" ")[3],
  };
  let output = "";
  let count = "";
  $.ajax({
    url: "../product/CartDelete",
    data: sendData,
    method: "post",
    success: function (res) {
      alert("카트 정보가 삭제되었습니다.");
      count = res.length;
      res.forEach(function (item) {
        let price = item.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        output += `
        <li>
          <a href="../product/Detail?no=${item.no}">
            <div class="Title">
              <h2 id="cartName">${item.pname} ${item.sizes}</h2>
              <img class="cartDelete" alt="카트 삭제" src="../images/layout/del.png">
            </div>
            <div class="Contents">
              <div class="cartImg">
                <img alt="카트 제품 이미지" src="${item.img}">
              </div>
              <div class="cartTxt">
                <p>수량: ${item.count}개</p>
                <p class="cartPrice">￦ ${price}</p>
              </div>
            </div>
          </a>
        </li>
        `;
      });
      $(".cartProduct").html(output);
      $(".cartCount").text("(" + count + ")");
      if (count == 0) {
        $(".cartProduct").html("<li>카트에 담긴 상품이 없습니다.</li>");
        $("#cart #cartImg").attr("src", "../images/layout/icon_cart.png");
      }
    },
  });
  return false;
});

// recent 삭제
$(".recentProduct").on("click", ".recentDelete", function () {
  const recentName = $(this).siblings("#recentName").text();
  const sendData = {
    pname: recentName.split(" ")[0],
  };
  let output = "";
  let count = "";
  $.ajax({
    url: "../product/RecentDelete",
    data: sendData,
    method: "post",
    success: function (res) {
      count = res.length;
      res.forEach(function (item) {
        output += `
        <li>
          <a href="product/Detail?no=${item.no}">
            <div class="Title">
              <h2 id="recentName">${item.pname}</h2>
              <img class="recentDelete" alt="삭제" src="../images/layout/del.png">
            </div>
            <div class="Contents">
              <div class="recentImg">
                <img alt="카트 제품 이미지" src="${item.img}">
              </div>
            </div>
          </a>
        </li>
        `;
      });
      $(".recentProduct").html(output);
      $(".recentCount").text("(" + count + ")");
      if (count == 0) {
        $(".recentProduct").html("<li>최근 본 상품이 없습니다.</li>");
      }
    },
  });
  return false;
});

// collection js
const swiper1 = new Swiper("#collection .sliderBox", {
  speed: 1000,
  //effect: "fade",
  loop: true,
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  pagination: {
    el: "#collection .bullet",
    type: "bullets",
    clickable: "true",
  },
  navigation: {
    prevEl: "#collection .galleryLeft",
    nextEl: "#collection .galleryRight",
  },
});

$("#collection .start").on("click", function () {
  swiper1.autoplay.start();
  $("#collection .start").removeClass("on");
  $("#collection .stop").addClass("on");
  return false;
});
$("#collection .stop").on("click", function () {
  swiper1.autoplay.stop();
  $("#collection .stop").removeClass("on");
  $("#collection .start").addClass("on");
  return false;
});

$("#collection .firstLi .collection").on("click", function () {
  $("#collection .BeautyrestMenu").removeClass("on");
  $("#collection .collectionMenu").toggleClass("on");
  return false;
});

$("#collection .firstLi .Beautyrest").on("click", function () {
  $("#collection .collectionMenu").removeClass("on");
  $("#collection .BeautyrestMenu").toggleClass("on");
  return false;
});

$("#collection .sns a").on("click", function () {
  $("#collection .sns ul").toggleClass("on");
  return false;
});

const scrollBox1 = new Swiper("#collection .SliderScrollBox", {
  speed: 500,
  direction: "horizontal",
  slidesPerView: "auto",
  spaceBetween: 10,
  mousewheel: true,
  debugger: true,
  scrollbar: {
    el: "#collection .swiper-scrollbar",
    draggable: true,
  },
});

// collection 클릭 - collection 열기
$("#mainSlider .btnCollection").on("click", () => {
  $("#banner").addClass("on");
  swiper.disable();
});

// 고객센터 faqContents question 클릭
$("#main").on("click", ".faqContents ul li", function () {
  $(this).toggleClass("on").siblings().removeClass("on");
});

// 고객센터 faqTab 클릭
$(".faqTab label input").on("change", function () {
  $(".faqTxt").val("");
  const num = $(this).val();
  faqSearch();
  if (num == 4) {
    $(".searchBox").addClass("off");
  } else {
    $(".searchBox").removeClass("off");
  }
  $(".faqContents >li:nth-of-type(" + num + ")")
    .addClass("on")
    .siblings()
    .removeClass("on");
  $(".faqContents ul li").removeClass("on");
});

// faq 검색(버튼클릭 & 엔터)
$(".faqSearch").on("click", faqSearch);
$(".faqTxt").on("keydown", function (e) {
  if (e.key == "Enter") {
    faqSearch();
  }
});

// faq 검색 함수
function faqSearch() {
  let output = "";
  const sendData = {
    txt: $(".faqTxt").val(),
    category: $("input[name='faqTap']:checked").val(),
  };
  const num = sendData.category;
  $.ajax({
    url: "FaqSearch",
    data: sendData,
    method: "post",
    success: function (res) {
      res.forEach(function (item, idx) {
        output += `<li>
            <div class="question">
              <h2>Q. ${item.question}</h2>
              <span class="material-icons on">expand_more</span>
              <span class="material-icons off">expand_less</span>
            </div>
            <div class="answer">
              <h2>A</h2>
              <p>
                ${item.answer}
              </p>
            </div>
          	</li>`;
      });
      $(`#faqList0${num}`).html(output);
    },
  });
}

// // notice search
// $("#btnNoticeSearch").on("click", noticeSearch);
// $(".noticeSearchTxt").on("keydown", function (e) {
//   if (e.key == "Enter") {
//     noticeSearch();
//   }
// });

// function noticeSearch() {
//   console.log("search클릭");
//   let output = "";
//   const sendData = {
//     option: $(".noticeOption").val(),
//     txt: $(".noticeSearchTxt").val(),
//   };
//   console.log(sendData.option + sendData.txt);
//   if (sendData.option == "" && sendData.txt.trim() == "") {
//     return false;
//   }
//   $.ajax({
//     url: "NoticeSearch",
//     data: sendData,
//     method: "post",
//     success: function (res) {
//       console.log(res);
//       output += `<tr>
//       <th>제목</th>
//       <th>등록일</th>
//       </tr>`;
//       res.forEach(function (item, idx) {
//         output += `
//         <tr>
//         <td class="left"><a href="NoticeView?no=${item.no}">${item.title}</a></td>
//         <td>${item.regDate}</td>
// 	      </tr>
//         `;
//       });
//       console.log("output==" + output);
//       $("#noticeList").html(output);
//     },
//   });
// }

// 탑 버튼
// $("#main").on("wheel", (e) => {
//   console.log(e.originalEvent);
// });

// summernote
$("#summernote").summernote({
  height: 300,
  callbacks: {
    onImageUpload: function (files) {
      // files : 배열
      // 여러개 업로드를 원할 때
      for (let i = 0; i < files.length; i++) {
        uploadImage(files[i], this);
      }
    },
  },
});

function uploadImage(file, editor) {
  const sendData = new FormData();
  sendData.append("summerNoteImage", file); // summerNoteImage : controller에서 MultipartFile 이름과 같아야함
  $.ajax({
    url: "SummerNoteFileUpload",
    type: "post",
    data: sendData,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (res) {
      $(editor).summernote("editor.insertImage", res.url);
    },
    error: function () {
      alert("파일 업로드 실패");
    },
  });
}

//갤러리 swiper
const gallerySwiper = new Swiper(".gallerySwipe", {
  speed: 1000,
  //effect: "fade",
  loop: true,
  pagination: {
    el: ".bullet",
    type: "bullets",
    clickable: "true",
  },
  navigation: {
    prevEl: ".galleryLeft",
    nextEl: ".galleryRight",
  },
});

const swiperImg = new Swiper(".slider_wrap", {
  speed: 1000,
  //effect: "fade",
  loop: true,

  navigation: {
    prevEl: ".galleryLeft",
    nextEl: ".galleryRight",
  },
});

/*$(".btnTop").on("click", function () {
  gsap.to("html,body", { scrollTop: 0, duration: 0.5 });
});*/

/*// 갤러리 Map
var mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 1, // 지도의 확대 레벨
  };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("경기 이천시 모가면 사실로 988", function (result, status) {
  // 정상적으로 검색이 완료됐으면
  if (status === kakao.maps.services.Status.OK) {
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    //alert(coords);

    var imageSrc = "../images/layout/header_logo.png", // 마커이미지의 주소입니다
      imageSize = new kakao.maps.Size(64, 64), // 마커이미지의 크기입니다
      imageOption = { offset: new kakao.maps.Point(32, 64) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
      markerPosition = coords; // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition,
      image: markerImage, // 마커이미지 설정
    });

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content = `<div class="customOverlay">
                    <a href="https://map.kakao.com/link/map/11394059" target="_blank">                        
                    </a>
                   </div>`;

    // 커스텀 오버레이가 표시될 위치입니다
    var position = coords;

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
      map: map,
      position: position,
      content: content,
      yAnchor: 1,
    });

    map.setCenter(coords);
  }
});*/

// select 변경시..
$("#sizeOption").on("change", function () {
  const sendData = {
    size: $(this).val(),
    pname: $("#pname").text(),
  };
  if (sendData.size === "" || sendData.size === null) {
    $("#orderprice").text("￦ 0");
  } else {
    $.ajax({
      url: "Size",
      type: "post",
      data: sendData,
      success: function (result) {
        console.log("result==" + result);
        const price = result.toLocaleString(); // 숫자 콤마 추가
        $("#orderprice").text("￦ " + price);
      },
    });
  }
});

// mattress select 변경
$("#sizes").on("change", mattress);
$("#hardness").on("change", mattress);

function mattress() {
  let output = "";
  const sendData = {
    sizes: $("#sizes").val(),
    hardness: $("#hardness").val(),
  };
  $.ajax({
    url: "MattressList",
    type: "post",
    data: sendData,
    success: function (result) {
      console.log(result);
      $("#items").html("");
      result.forEach(function (item, idx) {
        const img = item.img.split(",")[0];
        const name01 = item.pname.split(" ")[0];
        const name02 = item.pname.split(" ")[1];
        output += `<li class="itemList">
	                <a href="Detail?no=${item.no}">
	                    <img src=${img} alt="" />
	                    <div class="hoverBox">
	                        <span class="cover">
	                            <span class="box">직영</span>
	                            <span class="name">
	                                <p>${name01}</p>
	                                <p>${name02}</p>
	                            </span>
	                            <span class="bogi">
	                                <i>더보기</i>
	                            </span>
	                        </span>
	                    </div>
	                </a>
	            </li>`;
      });
      $("#items").html(output);
    },
  });
}

// counsel option 변경
$("form .domain").on("change", function () {
  const email = $(this).val();
  $("form .email02").val(email);
  if (email != "") {
    $("form .email02").attr("readonly", true);
  } else {
    $("form .email02").attr("readonly", false);
  }
});

// qna 작성일
let today = new Date();
let year = today.getFullYear();
let month = today.getMonth() + 1;
let day = today.getDate();
$(".regDate").val(year + "-" + addZero(month) + "-" + addZero(day));
function addZero(data) {
  if (data < 10) {
    data = "0" + data;
  }
  return data;
}

// qna 등록 * 처리
$("#qnaWrite .confirm").on("click", function () {
  if ($("#qnaWrite .title").val() == "") {
    alert("제목을 입력하세요");
    $("#qnaWrite .title").focus();
    return false;
  } else if ($("#qnaWrite .contents").val() == "") {
    alert("내용을 입력하세요");
    $("#qnaWrite .contents").focus();
    return false;
  }
});

// counsel 등록 * 처리
$("#order .btn").on("click", function () {
  if (!$("#privacy").is(":checked")) {
    alert("개인정보수집 및 이용에 동의해야 가입이 가능합니다");
    $("#privacy").focus();
    return false;
  } else if ($(".name").val() == "") {
    alert("이름을 입력하세요");
    $(".name").focus();
    return false;
  } else if ($(".title").val() == "") {
    alert("제목을 입력하세요");
    $(".title").focus();
    return false;
  } else if ($(".phone01").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone01").focus();
    return false;
  } else if ($(".phone02").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone02").focus();
    return false;
  } else if ($(".phone03").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone03").focus();
    return false;
  } else if ($(".callTime").val() == "") {
    alert("통화가능시간을 입력하세요ㅌ");
    $(".callTime").focus();
    return false;
  } else if ($(".city").val() == "") {
    alert("지역을 선택하세요");
    return false;
  } else if ($(".email01").val() == "") {
    alert("이메일을 정확히 입력하세요");
    $(".email01").focus();
    return false;
  } else if ($(".email02").val() == "") {
    alert("이메일을 정확히 입력하세요");
    $(".email02").focus();
    return false;
  } else if ($("#conentsTxt").val() == "") {
    alert("상담 내용을 입력하세요");
    $("#conentsTxt").focus();
    return false;
  }
});
// as 등록 * 처리
$("#as .btn").on("click", function () {
  if (!$("#privacy").is(":checked")) {
    alert("개인정보수집 및 이용에 동의해야 가입이 가능합니다");
    $("#privacy").focus();
    return false;
  } else if ($(".name").val() == "") {
    alert("이름을 입력하세요");
    $(".name").focus();
    return false;
  } else if ($(".phone01").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone01").focus();
    return false;
  } else if ($(".phone02").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone02").focus();
    return false;
  } else if ($(".phone03").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone03").focus();
    return false;
  } else if ($(".callTime").val() == "") {
    alert("통화가능시간을 입력하세요ㅌ");
    $(".callTime").focus();
    return false;
  } else if ($(".zipcode").val() == "") {
    alert("우편번호를 입력하세요");
    $(".zipcode").focus();
    return false;
  } else if ($(".address01").val() == "") {
    alert("주소를 입력하세요");
    $(".address01").focus();
    return false;
  } else if ($(".address02").val() == "") {
    alert("주소를 입력하세요");
    $(".address02").focus();
    return false;
  } else if ($(".address03").val() == "") {
    alert("주소를 입력하세요");
    $(".address03").focus();
    return false;
  } else if ($(".email01").val() == "") {
    alert("이메일을 정확히 입력하세요");
    $(".email01").focus();
    return false;
  } else if ($(".email02").val() == "") {
    alert("이메일을 정확히 입력하세요");
    $(".email02").focus();
    return false;
  } else if ($(".title").val() == "") {
    alert("제목을 입력하세요");
    $(".title").focus();
    return false;
  } else if ($("#conentsTxt").val() == "") {
    alert("신청내용을 입력하세요");
    $("#conentsTxt").focus();
    return false;
  }
});

// counsel textarea 글자수
$("#conentsTxt").on("keydown", function (e) {
  const count = $(this).val().length;
  if (count > 4000) {
    alert("4000자를 넘길 수 없습니다");
  }
  $(".txtCount").text(count);
});

// file 업로드
$("#file").on("change", function () {
  const fileName = $(this).val();
  $(".fileName").val(fileName);
});

// address 추가
$(".address03").on("change", function () {
  const addr = $(this).val();
  $(".address04").val(addr);
});

// 주소검색
$("#as #address").on("click", function () {
  postCode();
  return false;
});

function postCode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      let extraRoadAddr = ""; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if (data.buildingName !== "" && data.apartment === "Y") {
        extraRoadAddr += extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName;
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== "") {
        extraRoadAddr = " (" + extraRoadAddr + ")";
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      $(".zipcode").val(data.zonecode);
      $(".address01").val(data.roadAddress);
      $(".address02").val(data.jibunAddress);
      $(".address03").focus();
    },
  }).open();
}

// product 카트 추가
$(".addCart").on("click", function () {
  const no = location.search.split("=")[1];
  if ($("#sizeOption").val() == "" || $("#sizeOption").text() == null) {
    alert("사이즈를 선택하세요");
    return false;
  }
  const sendData = {
    no: no,
    pname: $("#pname").text().split(" ")[1],
    img: $(".visual>li:first").children("img").attr("src"),
    // count: $("#count").val(),
    count: 1,
    price: $("#orderprice").text(),
    sizes: $("#sizeOption").val(),
  };
  let output = "";
  let count = "";
  $.ajax({
    url: "CartAdd",
    data: sendData,
    method: "post",
    success: function (res) {
      count = res.length;
      res.forEach(function (item) {
        console.log(item);
        let price = item.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        console.log("price==" + price);
        output += `
        <li>
          <a href="../product/Detail?no=${item.no}">
            <div class="Title">
              <h2 id="cartName">${item.pname} ${item.sizes}</h2>
              <img class="cartDelete" alt="카트 삭제" src="../images/layout/del.png">
            </div>
            <div class="Contents">
              <div class="cartImg">
                <img alt="카트 제품 이미지" src="${item.img}">
              </div>
              <div class="cartTxt">
                <p>수량: ${item.count}개</p>
                <p class="cartPrice">￦ ${price}</p>
              </div>
            </div>
          </a>
        </li>
        `;
      });
      $(".cartProduct").html(output);
      $(".cartCount").text("(" + count + ")");
      $("#cart #cartImg").attr("src", "../images/layout/icon_cart_on.png");
      if (confirm("해당 상품이 카트에 담겼습니다.\r\n지금 카트 페이지로 이동하시겠습니까?")) {
        location.href = "#";
      } else {
        return false;
      }
    },
  });
});

//product recent 추가
$("#items").on("click", "[id^=productDetail]", function () {
  const no = $(this).attr("href").split("=")[1];
  const img = $(this).children("img").attr("src");
  const sendData = {
    no: no,
    img: img,
  };
  let output = "";
  let count = "";
  $.ajax({
    url: "RecentAdd",
    data: sendData,
    method: "post",
    success: function (res) {
      console.log("res==" + res);
      count = res.length;
      res.forEach(function (item) {
        output += `
      <li>
        <a href="../product/Detail?no=${item.no}">
          <div class="Title">
            <h2 id="cartName">${item.pname}</h2>
            <img class="recentDelete" alt="카트 삭제" src="../images/layout/del.png">
          </div>
          <div class="Contents">
            <div class="recentImg">
              <img alt="카트 제품 이미지" src="${item.img}">
            </div>
          </div>
        </a>
      </li>
      `;
      });
      $(".recentProduct").html(output);
      $(".recent").text("(" + count + ")");
    },
  });
});

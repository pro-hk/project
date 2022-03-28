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
  $(this).toggleClass("on");
  $(this).siblings().removeClass("on");
});

// (카트) CART 클릭 - 글자색 변경 & CARTLIST 불러오기
$(".cartBox .cart").on("click", function () {
  $(this).addClass("on");
  $(this).siblings().removeClass("on");
  $(".cartList .cartProduct").addClass("on");
  $(".cartList .recentProduct").removeClass("on");
});

// (카트) RECENT 클릭 - 글자색 변경 & RECENTLIST 불러오기
$(".cartBox .recent").on("click", function () {
  $(this).addClass("on");
  $(this).siblings().removeClass("on");
  $(".cartList .cartProduct").removeClass("on");
  $(".cartList .recentProduct").addClass("on");
});

// 팝업창 닫기
$(".popupClose").on("click", () => {
  $("#popup").addClass("off");
});

// 메인 슬라이더 - loop 적용시 li:nth-child 수정해야됨(각각 클래스명 지정해서 사진 등록)
const swiper = new Swiper("#mainSlider", {
  autoplay: true,
  //speed: 5000,
  //loop: true,
  pagination: {
    el: "#mainSlider .page",
    type: "bullets",
    clickable: "true",
  },
  navigation: {
    nextEl: ".pageRight",
    prevEl: ".pageLeft",
  },
});

// collection 클릭 - collection 열기
$("#mainSlider .btnCollection").on("click", () => {
  $("#mainBanner").addClass("on");
});

// home 클릭 - home 열기 & footer 닫기
$("#mainBanner .btnHome").on("click", () => {
  $("#mainBanner").removeClass("on");
  $("#footer").removeClass("on");
});

// 휠 다운 - banner 열기 / footer 열기
// 휠 업 - footer 닫기 / collection 닫기
$("#main").on("wheel", (e) => {
  if (e.originalEvent.wheelDelta < 0) {
    if ($("#banner").hasClass("on")) {
      $("#footer").addClass("on");
    }
    $("#banner").addClass("on");
  }
});

$(".footer").on("wheel", (e) => {
  if (e.originalEvent.wheelDelta < 0) {
    $("#footer").addClass("on");
  }
});

// footer에 포커스있을 때 휠 업 - footer 닫기 & banner 닫기
$(".footer").on("wheel", (e) => {
  if (e.originalEvent.wheelDelta > 0) {
    if (!$("#footer").hasClass("on")) {
      $("#banner").removeClass("on");
    }
    $("#footer").removeClass("on");
  }
});

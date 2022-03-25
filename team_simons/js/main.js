$("#menu").on("click", () => {
  $("#gnb").addClass("on");
  $(".cartBox").removeClass("on");
  $(".closePage").addClass("on");
});

$(".gnbClose").on("click", () => {
  $("#gnb").removeClass("on");
  $(".closePage").removeClass("on");
});

$("#cart").on("click", () => {
  $("#gnb").removeClass("on");
  $(".cartBox").addClass("on");
  $(".closePage").addClass("on");
});

$(".cartClose").on("click", () => {
  $(".cartBox").removeClass("on");
  $(".closePage").removeClass("on");
});

$(".closePage").on("click", () => {
  $("#gnb").removeClass("on");
  $(".cartBox").removeClass("on");
  $(".closePage").removeClass("on");
});

$("#gnb .lnb").on("click", function () {
  $(this).toggleClass("on");
  $(this).siblings().toggleClass("on");
  $(this).parent().siblings().children().removeClass("on");
});

$(".cartBox .cart").on("click", function () {
  $(this).addClass("on");
  $(this).siblings().removeClass("on");
  $(".cartList .cartProduct").addClass("on");
  $(".cartList .recentProduct").removeClass("on");
});

$(".cartBox .recent").on("click", function () {
  $(this).addClass("on");
  $(this).siblings().removeClass("on");
  $(".cartList .cartProduct").removeClass("on");
  $(".cartList .recentProduct").addClass("on");
});

$(".popupClose").on("click", () => {
  $("#popup").addClass("off");
});

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

$("#main").fullpage({});

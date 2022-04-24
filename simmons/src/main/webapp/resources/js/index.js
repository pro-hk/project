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

// 카트 삭제
$(".cartProduct").on("click", ".cartDelete", function () {
  const cartName = $(this).siblings("#cartName").text();
  const sendData = {
    pname: cartName.split(" ")[0],
    sizes: cartName.split(" ")[1] + " / " + cartName.split(" ")[3],
  };
  let output = "";
  $.ajax({
    url: "product/CartDelete",
    data: sendData,
    method: "post",
    success: function (res) {
      alert("카트 정보가 삭제되었습니다.");
      count = res.length;
      res.forEach(function (item) {
        let price = item.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        output += `
        <li>
          <a href="product/Detail?no=${item.no}">
            <div class="Title">
              <h2 id="cartName">${item.pname} ${item.sizes}</h2>
              <img class="cartDelete" alt="카트 삭제" src="images/layout/del.png">
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
        $("#cart #cartImg").attr("src", "images/layout/icon_cart.png");
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
    url: "product/RecentDelete",
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
              <img class="recentDelete" alt="삭제" src="images/layout/del.png">
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

//home 클릭 - home 열기 & footer 닫기
$("#banner .btnHome").on("click", () => {
  $("#banner").removeClass("on");
  $("#footer").removeClass("on");
  // 재시작 찾아야됨
});

// 휠 다운 - banner 열기 / footer 열기
// 휠 업 - footer 닫기 / collection 닫기
$("#main").on("wheel", (e) => {
  if (e.originalEvent.wheelDelta < 0) {
    if ($("#banner").hasClass("on")) {
      $("#footer").addClass("on");
    }
    $("#banner").addClass("on");
    swiper.disable();
    video.paused();
  }
});

$(".footer").on("wheel", (e) => {
  if (e.originalEvent.wheelDelta < 0) {
    $("#footer").addClass("on");
  } else {
    if (e.originalEvent.wheelDelta > 0) {
      if (!$("#footer").hasClass("on")) {
        $("#banner").removeClass("on");
      }
      $("#footer").removeClass("on");
      // swiper.enable(); 재시작 찾아야됨
      video.play();
    }
  }
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

// 팝업창 닫기
$(".popupClose").on("click", () => {
  if ("#popup input[type='checkbox']:checked") {
    document.cookie = "cookieOff=cookieOff; max-age=60*60*24; path=/";
  }
  $("#popup").addClass("off");
});

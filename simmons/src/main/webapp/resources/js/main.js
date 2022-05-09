// ------------------------------------------------- Header ------------------------------------------------
// 메뉴 검색
$(".btnSearch").on("click", mainSearch);
$(".search").on("keydown", function (e) {
  if (e.key == "Enter") {
    mainSearch();
  }
});

// 메뉴 검색 함수
function mainSearch() {
  const txt = $(".search").val();
  if (txt == "mattress" || txt == "매트리스") {
    location.href = "../product/Mattress";
  }
  return false;
}

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

// -------------------------------------------------- member -------------------------------------------------
// Join 등록 * 처리
$("#join .btn").on("click", function (e) {
  e.preventDefault();
  if ($(".name").val() == "") {
    alert("이름을 입력하세요");
    $(".name").focus();
  } else if ($(".id").val() == "") {
    alert("아이디를 입력하세요");
    $(".id").focus();
  } else if ($(".password").val() == "") {
    alert("비밀번호를 입력하세요");
    $(".password").focus();
  } else if ($(".passwordCheck").val() == "") {
    alert("비밀번호를 다시 입력하세요");
    $(".passwordCheck").focus();
  } else if ($(".password").val() != $(".passwordCheck").val()) {
    alert("비밀번호를 확인하세요");
    $(".password").val("");
    $(".passwordCheck").val("");
    $(".password").focus();
  } else if ($(".zipcode").val() == "") {
    alert("우편번호를 입력하세요");
    $(".zipcode").focus();
  } else if ($(".address01").val() == "") {
    alert("주소를 입력하세요");
    $(".address01").focus();
  } else if ($(".address02").val() == "") {
    alert("주소를 입력하세요");
    $(".address02").focus();
  } else if ($(".address03").val() == "") {
    alert("주소를 입력하세요");
    $(".address03").focus();
  } else if ($(".email01").val() == "") {
    alert("이메일을 정확히 입력하세요");
    $(".email01").focus();
  } else if ($(".email02").val() == "") {
    alert("이메일을 정확히 입력하세요");
    $(".email02").focus();
  } else if ($(".phone01").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone01").focus();
  } else if ($(".phone02").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone02").focus();
  } else if ($(".phone03").val() == "") {
    alert("전화번호를 정확히 입력하세요");
    $(".phone03").focus();
  } else if ($("input[name=serviceCall]:checked").val() == null) {
    alert("전문가와 전화상담 여부를 체크하세요");
    $("input[name=serviceCall]").focus();
  } else {
    console.log("클릭");
    const sendData = {
      id: $(".id").val(),
    };
    console.log("id==" + sendData.id);
    $.ajax({
      url: "../member/IdCheck",
      method: "post",
      data: sendData,
      success: function (res) {
        console.log("res==" + res);
        if (res > 0) {
          alert("아이디 중복입니다.");
          $(".id").val("");
          $(".id").focus();
        } else {
          $("#join").submit();
        }
      },
    });
  }
});

// --------------------------------------------- CS -------------------------------------------------------------
// FAQ
// faqContents question 클릭
$("#main").on("click", ".faqContents ul li", function () {
  $(this).toggleClass("on").siblings().removeClass("on");
});

// faqTab 클릭
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

// QNA
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

// COUNSEL
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
    alert("통화가능시간을 입력하세요");
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

// ------------------------------------------------------- product -------------------------------------------------
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

// product 카트 추가
$(".addCart").on("click", function () {
  const no = location.search.split("=")[1];
  if ($("#sizeOption").val() == "" || $("#sizeOption").text() == null) {
    alert("옵션을 모두 선택해주셔야 합니다");
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
        let price = (item.count * item.price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
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
        location.href = "Cart";
      } else {
        return false;
      }
    },
  });
  return false;
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

// wish 삭제
$(".wishDel").on("click", function () {
  const checkbox = $("input[type=checkbox]:checked");
  let pname = "";
  checkbox.each(function (idx, item) {
    console.log("item==" + item);
    const checkName = $(this).siblings(".name").text();
    pname += checkName + "/";
  });
  pname = pname.substring(0, pname.length - 1);
  let output = "";
  console.log("pname==" + pname);
  if (confirm("선택한 위시리스트를 삭제하시겠습니까?")) {
    $.ajax({
      url: "../product/WishDelete",
      data: { pname: pname },
      method: "post",
      success: function (res) {
        if (res != null) {
          res.forEach(function (item) {
            output += `
            <li>
            <a href="../product/Detail?no=${item.no}">
              <img class="imgBox" src="${item.img}"  />
            </a>
            <input type="checkbox" class="delCheck" />
            <span class="name">${item.pname}</span>
            </li>
            `;
          });
        }
        $("#wishBox").html(output);
      },
    });
  } else {
    return false;
  }
});

// cart checkbox 전체선택
$(".cartAllCheck").on("click", function () {
  if ($(this).is(":checked")) {
    $("input[name=cart]").prop("checked", true);
  } else {
    $("input[name=cart]").prop("checked", false);
  }
});

// cart 수량 변경
$(".minusCart").on("click", function () {
  let cartCount = parseInt($(this).siblings(".cartNum").text());
  if (cartCount > 1) {
    $(this)
      .siblings(".cartNum")
      .text(cartCount - 1);
  } else {
    alert("수량은 최소 1개이상 구매가능합니다.");
  }
});
$(".plusCart").on("click", function () {
  let cartCount = parseInt($(this).siblings(".cartNum").text());
  $(this)
    .siblings(".cartNum")
    .text(cartCount + 1);
});
$(".cartEdit").on("click", function () {
  const sendData = {
    no: $(this).parent().siblings(".cartNo").val(),
    count: parseInt($(this).siblings(".cartNum").text()),
    sizes: $(this).parent().siblings(".cartLink").children().children(".cartSizes").text(),
  };
  const cartPrice = sendData.count * parseInt($(this).parent().siblings(".cartPrice").text().replace(/,/g, ""));
  $(this)
    .parent()
    .siblings(".cartTotalPrice")
    .text(cartPrice.toLocaleString("ko-KR") + "원");
  $.ajax({
    url: "CartEdit",
    data: sendData,
    method: "post",
    success: function (res) {
      output = "";
      count = res.length;
      res.forEach(function (item) {
        let price = (item.count * item.price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
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
    },
  });
});

// cart 삭제
$(".cartDelete").on("click", function () {
  console.log("삭제클릭");
  const checkbox = $("input[name=cart]:checked");
  checkbox.each(function (idx, item) {
    pname = $(this).parent().siblings(".cartLink").children().children(".cartPname").text();
    sizes = $(this).parent().siblings(".cartLink").children().children(".cartSizes").text();
    const sendData = {
      pname: pname,
      sizes: sizes,
    };
    let output = "";
    let cartOutput = "";
    let count = "";
    let cartPrice = "";
    $.ajax({
      url: "../product/CartDelete",
      data: sendData,
      method: "post",
      success: function (res) {
        console.log("res==" + res);
        count = res.length;
        res.forEach(function (item) {
          console.log("item==" + item);
          cartPrice += parseInt(item.count * item.price);
          console.log("cartPrice==" + cartPrice);
          let price = (item.count * item.price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
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
          cartOutput = `
          <li>
            <div>
              <input type="checkbox" name="cart" />
              <a href="Detail?no=${item.no}">
                <img src="${item.img}" class="cartImg" />
              </a>
            </div>
            <div class="cartLink">
              <a href="Detail?no=${item.no}">
                <span class="cartPname">${item.pname}</span><br>
                <span class="cartSizes">${item.sizes}</span>
              </a>
            </div>
            <div class="cartPrice">${item.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")}원</div>
            <div class="cartCounts">
              <button class="minusCart button">-</button>
              <span class="cartNum">${item.count}</span>
              <button class="plusCart button">+</button>
              <button class="cartEdit">수정</button>
            </div>
            <div class="cartTotalPrice">${price}원</div>
            <input type="hidden" class="cartNo" value="${cart.no}" />
          </li>
          `;
        });
        $(".cartProduct").html(output);
        $(".cartContents").html(cartOutput);
        $(".cartCount").text("(" + count + ")");
        cartPrice = cartPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $(".totalPrice strong").text(cartPrice);
        if (count == 0) {
          $(".cartProduct").html("<li>카트에 담긴 상품이 없습니다.</li>");
          $("#cart #cartImg").attr("src", "../images/layout/icon_cart.png");
          $(".cartContents").html("<li class='cartEmpty'>장바구니에 담긴 상품이 없습니다.</li>");
          $(".totalPrice strong").text(0);
        }
      },
    });
  });
  $(".cartAllCheck").prop("checked", false);
});

// -------------------------------------------------- manager ---------------------------------------------------
// faqList(manager) 검색
$(".faqListSearch").on("click", faqListSearch);
$(".faqListTxt").on("keydown", function (e) {
  if (e.key == "Enter") {
    faqListSearch();
  }
});
function faqListSearch() {
  const txt = $(".faqListTxt").val();
  const category = $("#faqListCategory").val();
  location.href = `FaqList?txt=${txt}&category=${category}`;
}

// qnaList(manager) 검색
$(".qnaListSearch").on("click", qnaListSearch);
$(".qnaListTxt").on("keydown", function (e) {
  if (e.key == "Enter") {
    qnaListSearch();
  }
});
function qnaListSearch() {
  const txt = $(".qnaListTxt").val();
  const category = $("#qnaListCategory").val();
  location.href = `QnaList?txt=${txt}&category=${category}`;
}

// qna 답변 등록
$(".qnaReply").on("click", function () {
  const answer = $(".qnaAnswer").val();
  const no = location.search.split("=")[1];
  if (confirm("답변을 등록하시겠습니까?")) {
    location.href = `QnaReply?answer=${answer}&no=${no}`;
  }
});

// qna 답변 삭제
$(".qnaDelete").on("click", function () {
  const no = location.search.split("=")[1];
  if (confirm("답변을 삭제하시겠습니까?")) {
    location.href = `QnaDelete?no=${no}`;
  }
});

// qna 미답변 리스트
// $(".qnaNoReply").on("click", function () {
//   let output = "";
//   let page = "";
//   $.ajax({
//     url: "QnaNoReply",
//     method: "post",
//     success: function (res) {
//       res..forEach(function (item) {
//         output += `
//         <tr>
//         <td>${item.num}</td>
//         <td>${item.id}</td>
//         <td><a href="QnaView?no=${item.no}">${item.title}</a></td>
//         <fmt:parseDate value="${item.regDate}" var="regDate" pattern="yyyy-MM-dd"/>
//         <td><fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd"/></td>
//         <td>${item.reply}</td>
//       </tr>
//         `;
//       });
//     },
//   });
//   $(".faqListContents").html(output);
// });

// counselList(manager) 검색
$(".counselListSearch").on("click", counselListSearch);
$(".counselListTxt").on("keydown", function (e) {
  if (e.key == "Enter") {
    counselListSearch();
  }
});
function counselListSearch() {
  const txt = $(".counselListTxt").val();
  const category = $("#counselListCategory").val();
  location.href = `CounselList?txt=${txt}&category=${category}`;
}

// counsel 답변 등록
$(".counselReply").on("click", function () {
  const answer = $(".counselAnswer").val();
  const no = location.search.split("=")[1];
  if (confirm("답변을 등록하시겠습니까?")) {
    location.href = `CounselReply?answer=${answer}&no=${no}`;
  }
});

// counsel 답변 삭제
$(".counselDelete").on("click", function () {
  const no = location.search.split("=")[1];
  if (confirm("답변을 삭제하시겠습니까?")) {
    location.href = `CounselDelete?no=${no}`;
  }
});

// as(manager) 검색
$(".asListSearch").on("click", asListSearch);
$(".asListTxt").on("keydown", function (e) {
  if (e.key == "Enter") {
    asListSearch();
  }
});
function asListSearch() {
  const txt = $(".asListTxt").val();
  const category = $("#asListCategory").val();
  location.href = `AsList?txt=${txt}&category=${category}`;
}

// counsel 답변 등록
$(".asReply").on("click", function () {
  const answer = $(".asAnswer").val();
  const no = location.search.split("=")[1];
  if (confirm("처리내용을 등록하시겠습니까?")) {
    location.href = `AsReply?answer=${answer}&no=${no}`;
  }
});

// counsel 답변 삭제
$(".asDelete").on("click", function () {
  const no = location.search.split("=")[1];
  if (confirm("처리내용을 삭제하시겠습니까?")) {
    location.href = `AsDelete?no=${no}`;
  }
});

// noticeList(manager) 검색
$(".noticeListSearch").on("click", noticeListSearch);
$(".noticeListTxt").on("keydown", function (e) {
  if (e.key == "Enter") {
    noticeListSearch();
  }
});
function noticeListSearch() {
  const txt = $(".noticeListTxt").val();
  const category = $("#noticeListCategory").val();
  location.href = `NoticeList?txt=${txt}&category=${category}`;
}

// --------------------------------------------------- common -------------------------------------------------
// counsel textarea 글자수
$("#conentsTxt").on("keydown", function (e) {
  const count = $(this).val().length;
  if (count > 4000) {
    alert("4000자를 넘길 수 없습니다");
  }
  $(".txtCount").text(count);
});

// address 추가
$(".address03").on("change", function () {
  const addr = $(this).val();
  $(".address04").val(addr);
});

// email domain 변경
$("form .domain").on("change", function () {
  const email = $(this).val();
  $("form .email02").val(email);
  if (email != "") {
    $("form .email02").attr("readonly", true);
  } else {
    $("form .email02").attr("readonly", false);
  }
});

// -------------------------------------------------- file upload -----------------------------------------
// file 업로드
$("#file").on("change", function () {
  const fileName = $(this).val();
  $(".fileName").val(fileName);
});

// 파일 업로드
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

// ------------------------------------------------------- api -----------------------------------------------
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

// 주소 입력
$("#address").on("click", function () {
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

// --------------------------------------------------- Front Team --------------------------------------------

// nav
$(".firstLi > a").on("click", function () {
  console.log("aaa");
  $(this).parent().toggleClass("open").siblings().removeClass("open");
  return false;
});
$(".miniLi > a").on("click", function () {
  console.log("aaa");
  $(this).parent().toggleClass("open").siblings().removeClass("open");
  return false;
});

const detailSwiper = new Swiper(".left .leftVisual", {
  speed: 1000,
  //effect: "fade",
  loop: true,
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".left .bullet",
    type: "bullets",
    clickable: "true",
  },
  navigation: {
    prevEl: ".left .visualLeft",
    nextEl: ".left .visualRight",
  },
});
const blackSwiper = new Swiper("#black .sliderBox", {
  speed: 1000,
  effect: "fade",
  loop: true,
  pagination: {
    el: ".slider .bullet",
    type: "bullets",
    clickable: "true",
  },
});

// collection js
const swiper1 = new Swiper("#collection .sliderBox .mask", {
  speed: 1000,
  effect: "fade",
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

const blackMainSwiper = new Swiper("#blackContents .mainSliderBox .mask", {
  effect: "fade",
  speed: 1000,
  loop: true,
  autoplay: {
    delay: 2500,
  },
  pagination: {
    el: "#blackContents .bullet",
    type: "bullets",
    clickable: "true",
  },
  navigation: {
    prevEl: "#blackContents .galleryLeft",
    nextEl: "#blackContents .galleryRight",
  },
});

// $("#collection .start").on("click", function () {
//     swiper1.autoplay.start();
//     $("#collection .start").removeClass("on");
//     $("#collection .stop").addClass("on");
//     return false;
// });
// $("#collection .stop").on("click", function () {
//     swiper1.autoplay.stop();
//     $("#collection .stop").removeClass("on");
//     $("#collection .start").addClass("on");
//     return false;
// });

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

const vlackScrollBox = new Swiper("#blackContents .SliderScrollBox", {
  speed: 500,
  direction: "horizontal",
  slidesPerView: "auto",
  spaceBetween: 10,
  mousewheel: true,
  debugger: true,
  scrollbar: {
    el: "#blackContents .swiper-scrollbar",
    draggable: true,
  },
});

//factorium/rnd
$(".box3 .listBox li").on("click", function () {
  let zIdx = $(".box3 .listBox li").index($(this));
  console.log("zIdx");
  $(this).addClass("on").siblings("li").removeClass("on");
  $(".box3 .imgBox li").eq(zIdx).addClass("on").siblings("li").removeClass("on");
  return false;
});

//페이지 넘버 js
$("#pageNavi ol li").on("click", function () {
  $(this).find("a").addClass("on").parent("li").siblings("li").find("a").removeClass("on");
  return false;
});

//hotel js
$(".hotelTap li").on("click", function () {
  let zIndex = $(".hotelTap li").index($(this));
  $(this).addClass("on").siblings("li").removeClass("on");
  $(".simmonsList ul").eq(zIndex).show().siblings("ul").hide();
  return false;
});

// top버튼
const btnTop = $(".btnTop");
$(window).on("scroll", function () {
  const st = $(window).scrollTop();
  if (st > 0) {
    if (!btnTop.hasClass("on")) {
      btnTop.addClass("on");
    }
  } else {
    if (btnTop.hasClass("on")) {
      btnTop.removeClass("on");
    }
  }
});

$(".btnTop").on("click", function () {
  gsap.to("html,body", { scrollTop: 0, duration: 0.5 });
});

// 카카오 지도
var mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3, // 지도의 확대 레벨
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
    var imageSrc = "../images/layout/icon_store_balloon.png", // 마커이미지의 주소입니다
      imageSize = new kakao.maps.Size(92, 80), // 마커이미지의 크기입니다
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

// collection 클릭 - collection 열기
$("#mainSlider .btnCollection").on("click", () => {
  $("#banner").addClass("on");
  swiper.disable();
});

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

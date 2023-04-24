const searchBox = document.querySelector(".search-box"); // 검색어 입력란
const recentSearches = document.querySelectorAll(".recent-searches li");
const searchInput = document.querySelector(".search-box");

// 모달 변수
const modalButton = document.querySelector(".modal_button");
const modal = document.querySelector(".modal");

const interval = 5000; // 5초마다 이미지 변경
let currentIndex = 0;

function changeImage() {
  const backgroundImage = document.querySelector(".header_bg");
  const imageUrl = images[currentIndex].img_path;
  const resName = images[currentIndex].res_name;
  backgroundImage.style.backgroundImage = `url(${imageUrl})`;

  // 식당 이름 추가
  const resNameElement = document.querySelector(".res_name");
  const resAddrElement = document.querySelector(".res_addr");
  resNameElement.innerHTML = `<img src="/resources/img/marker.png" width="12px" height="16px" class="marker"/><span>${resName}</span>`;

  currentIndex = (currentIndex + 10) % images.length;
}

changeImage();
setInterval(changeImage, interval);

// // 배경 이미지 변경
// let currentIndex = 0;

// function changeImage() {
//   const backgroundImage = document.querySelector(".header_bg");
//   const imageUrl = images[currentIndex];
//   backgroundImage.style.backgroundImage = `url(${imageUrl})`;
//   currentIndex = (currentIndex + 1) % images.length;
// }

// changeImage();
// setInterval(changeImage, interval);
// // 이미지 배열
// const images = [
//   "/resources/food/china/5.jpg",
//   "/resources/food/korea/10.jpg",
//   "/resources/food/japan/10.jpg",
//   "/resources/food/vegetarian/5.jpg",
//   "/resources/food/western/10.jpg",
// ];
// const interval = 5000; // 5초마다 이미지 변경

// // 배경 이미지 변경
// let currentIndex = 0;

// function changeImage() {
//   const backgroundImage = document.querySelector(".header_bg");
//   const imageUrl = images[currentIndex];
//   backgroundImage.style.backgroundImage = `url(${imageUrl})`;
//   currentIndex = (currentIndex + 1) % images.length;
// }

// changeImage();
// setInterval(changeImage, interval);

searchInput.addEventListener("keyup", (e) => {
  const searchTerm = e.target.value.toLowerCase();
  recentSearches.forEach((search) => {
    const text = search.textContent.toLowerCase();
    if (text.includes(searchTerm)) {
      search.style.display = "block";
    } else {
      search.style.display = "none";
    }
  });

  // 검색어 입력란이 비어있을 경우 모든 최근 검색어를 보여준다.
  if (searchTerm === "") {
    recentSearches.forEach((search) => {
      search.style.display = "block";
    });
  }
});

// 검색어 입력란에서 Enter 키를 눌렀을 경우 최근 검색어 목록에 추가한다.
searchBox.addEventListener("keydown", (e) => {
  if (e.keyCode === 13) {
    // Enter 키
    const query = e.target.value;
    addRecentSearch(query);
    e.target.value = ""; // 검색어 입력란 초기화
  }
});

// 최근 검색어 목록에 검색어를 추가한다.
function addRecentSearch(query) {
  const recentSearchItem = document.createElement("li");
  recentSearchItem.textContent = query;
  const firstSearchItem = recentSearches[0];
  recentSearches.insertBefore(recentSearchItem, firstSearchItem);

  // 최근 검색어 목록이 5개를 넘어가면 가장 오래된 검색어를 삭제한다.
  if (recentSearches.length > 5) {
    recentSearches[5].remove();
  }
}

// 모달
modalButton.addEventListener("click", (event) => {
  event.preventDefault();
  modal.style.display = "block";
});

// 모달 외부 영역 클릭 이벤트 등록
document.addEventListener("click", (event) => {
  // 모달 영역 이외의 영역을 클릭했는지 체크
  if (!event.target.closest(".place_modal")) {
    modal.style.display = "none"; // 모달 닫기
  }
});

// Swiper 객체 생성
const mySwiper = new Swiper(".swiper-container", {
  slidesPerView: 4,
  slidesPerGroup: 4,
  loop: true,
  speed: 1000,
  loopFillGroupWithBlank: true,
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  spaceBetween: -100,
});



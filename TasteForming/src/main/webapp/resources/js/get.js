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

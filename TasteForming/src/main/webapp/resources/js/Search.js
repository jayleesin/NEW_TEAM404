// 검색 아이콘을 클릭할 때 모달창을 띄우는 함수
function openModal() {
  const modal = document.getElementById("searchInput");
  modal.style.display = "block";
}

// 검색 아이콘 버튼 요소
const searchButton = document.getElementById("searchInput");

// 버튼 위치 수정
const button = document.querySelector(".kmeaye");

button.addEventListener("click", () => {
  window.scrollTo({ top: 0, behavior: "smooth" });
});

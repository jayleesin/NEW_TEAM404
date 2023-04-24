<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div class="wrapper">
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="mypage" class="nav-link">Home</a>
      </li>
    </ul>
  </nav>

  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="mypage" class="brand-link d-flex">
      <img src="${path }/resources/img/tasteforming.png" alt="TasteFormingLogo" class="brand-image elevation-3" style="opacity: .8">
      <div class="w-100 text-center">
        <span class="brand-text font-weight-bold">마이 페이지</span>
      </div>
    </a>

    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="${path }/resources/dist/img/user-solid.svg" class="img-circle elevation-2" alt="User Image">
          </div>
          <div class="info">
            <a href="#" class="d-block">USER NAME</a>
          </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
              <li class="nav-item">
                <a href="myPage" class="nav-link">
                  <i class="nav-icon far fa-calendar-alt"></i>
                  <p>
                    예약 관리
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="myBoard" class="nav-link">
                  <i class="nav-icon far fa-clipboard"></i>
                  <p>
                    게시글 관리
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="myComment" class="nav-link">
                  <i class="nav-icon far fa-comments"></i>
                  <p>
                    댓글 관리
                  </p>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </aside>
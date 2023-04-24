
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="false"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>TasteForming | 댓글 관리</title>

  <link rel="stylesheet" href="${path }https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${path }/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${path }/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${path }/resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="${path }/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<%@ include file="./myPageIncludes/menu.jsp"%>

  <div class="content-wrapper">

    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">댓글 목록</h3>
              </div>
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>댓글 번호</th>
                    <th>댓글 내용</th>
                    <th>댓글 작성시간</th>
                  </tr>
                  </thead>
                  <tbody id="mytbody">
                  <!-- <tr>
                    <td>Trident</td>
                    <td>Internet
                      Explorer 4.0
                    </td>
                    <td>Win 95+</td>
                    <td> 4</td>
                  </tr> -->
                  </tbody>
                  <!-- <tfoot>
                  <tr>
                    <th>게시글 제목</th>
                    <th>작성자</th>
                    <th>좋아요(공감) 개수</th>
                    <th>작성시간</th>
                  </tr>
                  </tfoot> -->
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
  </div>

  <footer class="main-footer">
    <strong>Copyright &copy; 2023 <a href="https://www.naver.com">TasteForming</a>.</strong>
    All rights reserved.
  </footer>
</div>


<script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
<script src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path }/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${path }/resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${path }/resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${path }/resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${path }/resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${path }/resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${path }/resources/plugins/jszip/jszip.min.js"></script>
<script src="${path }/resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="${path }/resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="${path }/resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${path }/resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${path }/resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="${path }/resources/dist/js/adminlte.min.js"></script>
<script src="${path }/resources/dist/js/demo.js"></script>
<script>
  $(async () => {
    const url = 'http://localhost:8080/comments-manage'
    const response = await fetch(url)
    const dataList = await response.json()
    console.log(dataList)


    let html = ''
    for(let i = 0; i < dataList.length; i++) {
      const data = dataList[i]
      html += `<tr>
                <td>${data.number}</td>
                <td>${data.content}</td>
                <td>${data.datetime}</td>
              </tr>`
            }
    const mytbody = document.getElementById('mytbody')
    mytbody.innerHTML = html


    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": false,
      "info": true,
      "autoWidth": true,
      "responsive": true,
    });

    
  });
  </script>
</body>
</html>


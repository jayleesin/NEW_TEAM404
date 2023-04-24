<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.sql.*"%>
<c:set value="${member }" var="mem" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 200px 600px 100px 600px;">
		<form role="form" method='post'
			action="/tasteforming/myPage/ShopRegister"
			enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<input class="form-control" placeholder="식당이름" id="res_Name"
						name="res_Name" type="text" autofocus="autofocus">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="주소" name="address"
						id="address" type="text" value="">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="정보" name="info" id="info"
						type="text" value="">
				</div>
				<div class="form-group">
					<select name="type" id="type">
						<option value="">음식타입</option>
						<option value="한식">한식</option>
						<option value="양식">양식</option>
						<option value="중식">중식</option>
						<option value="일식">일식</option>
						<option value="채식">채식</option>
					</select>
				</div>
				<!--             <div class="form-group">
            <input class="form-control" name="userId" id="userId"
                  type="text"}>
            </div> -->
				<div class="form-group">
					<input class="form-control" placeholder="메뉴" name="menu" id="menu"
						type="text">
				</div>
				<div class="form-group">
					<input class="form-control" name="img_path" id="img_path"
						type="hidden" value="img_path"> <input type="hidden"
						name="userId" value="${mem.userId }">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="이미지" name="uploadFile"
						id="output" value="" type="file" onchange="previewImage(this);"
						multiple> <img id="preview"
						src="../../../resources\food\sampleimg.jpg" alt="Preview"
						style="max-width: 200px; max-height: 200px;">
				</div>

				<!-- Change this to a button or input when using this as a form -->
				<button type="submit" id='uploadBtn'>식당등록하기</button>
				<!--             <a href="/tasteforming/myPage/ShopRegister" class="btn btn-lg btn-primary btn-block"
               id="sign-up-btn">식당등록하기</a> -->
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			// 파일 확장자와 크기를 설정하고 이를 검사한다. 
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 20971520; // 20971520Byte= 20MB
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과입니다.");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			$("#uploadBtn").on("click", function(e) {
				/* 				/* 폼 유효성 검사 */
				if ($("#res_Name").val() === "") {
					alert("식당이름을 입력해주세요.");
					$("#res_Name").focus();
					return false;
				} else if ($("#address").val() === "") {
					alert("주소를 입력해주세요.");
					$("#address").focus();
					return false;
				} else if ($("#type").val() === "") {
					alert("음식타입을 정해주세요.");
					$("#type").focus();
					return false;
				} else if ($("#output").val() === "") {
					alert("이미지를 등록해주세요.");
					$("#output").focus();
					return false;
				} else if ($("#menu").val() === "") {
					alert("메뉴를 작성해주세요.");
					$("#menu").focus();
					return false;
				} else if ($("#info").val() === "") {
					alert("정보를 입력해주세요.");
					$("#info").focus();
					return false;
				}
				e.preventDefault();
				$("form").submit();


				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);

				//add filedate to formdata
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);

				}// end for

				$.ajax({
					url : '/tasteforming/myPage/ShopRegister',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					success : function(result) {
						alert("사업 번창하시길 바랍니다!");
					}

				}); // end $.ajax

			});
		});
	</script>
	<!-- Custom Theme JavaScript -->
	<!--    <script src="/resources/dist/js/sb-admin-2.js"></script> -->
	<script>
		function previewImage(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#preview').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
		
		$(document).ready(function(){
			$("#filebox").on("change", previewImage);
		});
		
		function previewImage(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f) {
				var reader = new FileReader();
				reader.onload = function(e){
					$("#file_img").attr("src", e.target.result).attr("style", "margin : 20px;");
					$("#file_img").parent().attr("style","height:auto;");
				}
				reader.readAsDataURL(f);
			});
		}

</script>
<style type="text/css">

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}


.img_wrap{
	width : 300px;
	height: 0;
}
.img_wrap img{
	max-width: 100%;
}

</style>
</head>
<body>

	<form action="fileupload.do" method="post" enctype="multipart/form-data">
		<!-- 파일을 전송하기 위해서는 post 방식으로 보내야 하고, 서버에 내가 파일을 보낼 것이라고 알려주기 위해 enctype 옵션에 'multipart/form-data'라고 선언 -->
		<input type="hidden" name="command" value="upload">
				
		<label for="filebox">이미지첨부</label>
		<input type="file" name="uploadfile" id="filebox">
			<div class="img_wrap">
				<img id="file_img">
			</div>
		<input type="submit" value="등록">
	</form>

</body>
</html>
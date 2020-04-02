<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- summernote 소스 시작 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<!-- summernote 소스 끝 -->
<!-- 부트 스트랩이 중첩되는 경우에는 에러가 날 수 있음 -->

</head>
<body>

	
	<!-- summernote 실행 -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote({	//summernote 실행
			height :400,	//summernote 사이즈 지정
			width:700,
			focus: true,	//실행시 커서
			
			callbacks:{		//이미지 업로드시 
				onImageUpload: function(files){	//이미지 업로드시 function실행
					console.log('image upload:',files);
					for(var i=0; i <files.length;i++){
						sendFile(files[i],this);		//sendFile 호출, this는 이미지 업로드가 발생한 태그(id=summernote),file은 업로드한 파일
					}
					
				}
			}
			
		});
		
	});	
	
	function sendFile(file, el){
		console.log('sendfile:',file);
		console.log('el:',el);	//이미지 업로드가 발생한 태그(textarea)부분
		var form_data = new FormData();
		form_data.append('file',file);
		$.ajax({
			data: form_data,
			type:"POST",
			url : 'summernote.do?command=imageUpload',	//해당 컨트롤에서 file전송하여 업로드
			cache: false,
			contentType: false,
			enctype : 'multipart/form-data',	//파일 송수신시에 multipart
			processData : false,
			success : function(url){	//servlet에서 작업이 끝나면 클라이언트에게 파일번호(imgseq)을 전달받아 url에 담기게 된다 ex)'image/1'
				console.log('url:',url);
				$(el).summernote('insertImage',url, function($image){	//url에 해당하는 파일을 에디터에 삽입하는 코드
					$image.css('width',"25%");
				});
			}
		})
	}
</script>

<h1>글쓰기</h1>
<form action="summernote.do?" method="post">
<input type="hidden" name="command" value="artcleDB">
<input type="text" name="title">
<textarea id="summernote" name ="article">Hello Summernote</textarea>
<input type="submit" value="확인">
</form>


</body>
</html>
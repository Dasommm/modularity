<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="openpopup();">팝업창 열자</button>
</body>
<script type="text/javascript">
  	function openpopup(){
  	
  			window.open("chat.jsp","","width=700,height=650,left=500,top=100");

  	}
  </script>
</html>
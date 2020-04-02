<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%	
	String authNum = (String)session.getAttribute("authNum");  		//인증번호
	String mem_email = (String)session.getAttribute("mem_email");	//이메일
	String emailNotTobe = request.getParameter("emailNotTobe");		//(로직구현시)이메일 중복여부
%>	
<script type="text/javascript">
// 이메일 인증 (버튼으로 할 경우 이 부분을 살린다.)
/* function echeckFun(){
	if($("#mem_email").val()==""){
		alert("이메일을 입력해주세요");
		return false;
	}else{
		$("input[name='command']").val("emailChk");
		$("form").submit();
	}
} */
//인증 번호 확인 클릭시 '인증번호 창' 생성
function authNumcheck(){
	var inputauthNum = document.getElementById("InputauthNum").value;
	if("<%=authNum%>"==inputauthNum){
	$("#emailconfirmmsg").css("display", "block"); 	//인증화면에 보이게 
	$("#eCheck_Display").css("display", "none"); 	//인증화면에 안보이게 
	$("#emailchk").css("display", "none"); 			//이메일 인증버튼 안보이게(평소) 
	document.getElementById("InputauthNum").title = 'y';  //인증번호 입력태그의 title('n'->'y')로 변경
	}else{
		alert("인증메일에서 버튼클릭후 진행해주세요.");
	}	
}
$(function(){
	if("<%=emailNotTobe%>"=="false"){
		$("#eJung_Display").css("display", "block"); //이메일중복인지
	}else if("<%=emailNotTobe%>"=="true"){
		$("#eCheck_Display").css("display", "block"); //인증번호입력란 화면에 보이게 
		alert("이메일에서 인증번호를 확인해 주세요");
	}
	//자동으로 인증번호 입력되게 하는 조건문
	if("<%=authNum%>"!="null"){
		
		$("#eCheck_Display").show();
		$("#InputauthNum").val("<%=authNum%>");
		$("#mem_email").val("<%=mem_email%>");
	}
});
</script>
</head>
<body>
<br>
<section>
<div id="loginform">
  <form action="signup.do" method="post">
  <input type="hidden" name="command" value="emailChk"/>
  	<!-- 이메일 입력칸 -->
  	<a class="atag">Email: </a><input type="email" value="" name="mem_email" id="mem_email" required="required"/>
  	
  	<!-- 이메일인증 버튼 -->
  	<input type="submit" id="emailchk" value="이메일인증" style="background:black; width:200px; border-radius: 10px; color:white; font-weight:bold;"/>
  	<!-- form-submit 버튼 새로 만들면 => <input type="button" id="emailchk" onclick="echeckFun();" value="이메일인증" style="background:black; width:200px; border-radius: 10px; color:white; font-weight:bold;"/>-->
  	
  	<!-- 이메일에서 인증버튼 누르고 인증번호 입력 창 뜨는 부분 -->
	<a id="eJung_Display" style="color:red; display:none;">이미 존재하는 이메일입니다</a>
	<div id="eCheck_Display" style="display:none;">
		<span>인증번호 입력:</span> <input type="text" id="InputauthNum" title="n" value="" style="width: 230px;"/>
		<input type="button" id="btn" onclick="authNumcheck();" value="확인" style="background:black; width:100px; border-radius: 10px; color:white; font-weight:bold;"/>
		<input type="button" id="ReSend" onclick="echeckFun();" value="재전송" style="background:black; width:100px; border-radius: 10px; color:white; font-weight:bold;"/> 
	</div>
	
	<!-- 메일 인증 완료 표시 -->
	<a id="emailconfirmmsg" style="color:blue; display:none; margin-left: -20px; font-size: 20px;font-weight: bold;">이메일 인증 완료</a>
</form>
</div>
</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>SNS로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<c:if test="${empty sessionScope.id}">
		로그인이 필요합니다.<br>
	</c:if>
	<c:if test="${not empty sessionScope.id}">
		${sessionScope.name }님 환영합니다.<br>
		아이디: ${sessionScope.id }<br>
		이메일: ${sessionScope.email }<br>
		<input type="button" value="로그아웃" onclick="location.href='APIlogin.do?command=logout'";><br/>
	</c:if>
 

  <!-- 네이버아이디로로그인 영역--> 
  <div id="naver_id_login"></div>
    
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("2sLtJGPHBrHkvGEXI9MK", "http://localhost:8787/LoginAPI/callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8787/LoginAPI/");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  <!-- //네이버아이디로로그인 영역-->

<!-- 카카오로그인 영역 -->  
<a id="kakao-login-btn"></a>

<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
	//Kakao JavaScript SDK를 초기화합니다. SDK를 사용하기 전에 호출해 주어야 합니다.
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('480d723e47c593ca5440c4dffb8f1ad8');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn', 	//DOM Element 또는 Element의 ID Selector를 넘기면, 해당 Element 내부에 로그인 버튼이 생성됩니다.
      success: function(authObj) {	 	
    	  Kakao.API.request({			//로그인 성공시 카카오 API 호출
    		  
              url: '/v2/user/me',		//호출할 API url

              success: function(res) {	//API호출이 성공할 경우 결과를 받을 콜백 함수
            	    alert(JSON.stringify(res));
            	    console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
                    console.log(res.kakao_account.email);//<---- 콘솔 로그에 email 정보 출력
                    console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
                    // res.properties.nickname으로도 접근 가능 )
                    console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
         
    	            var email = res.kakao_account.email;
                    var name = res.properties.nickname;     
                    var id = res.id;				//필요한 값을 변수에 저장
         											
         			location.href="APIlogin.do?command=kakaologin&email="+email+"&name="+name+"&id="+id;
      }
    	  });
      },
     
      fail: function(err) {				//로그인이 실패할 경우 에러를 받을 콜백 함수
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<!-- //카카오로그인 영역 --> 
</body>
</html>
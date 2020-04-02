<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/chatting/chat.css"
		  rel="stylesheet"
		  type="text/css" />
</head>
<body>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function exit(){
		self.close();
	}
</script>
<script type="text/javascript">
	$(function(){
		$('#sendbtn').hover(function(){
			$(this).css('color','white').css('background','skyblue');
		},function(){
			$(this).css('color','skyblue').css('background','white');
		});
		
		$('#exitbtn').hover(function(){
			$(this).css('color','white').css('background','red');
		},function(){
			$(this).css('color','red').css('background','white');
		});
	});
</script>
<div class="chat" style="border: 1px solid black; margin-top: 2%;">
<div class="new">
  		</div>
	  <section class="messages" style="width:100%; background: rgb(33, 13, 5);">
			<body>
			    <fieldset style="width: 100%; height: 580px; border: none;">
			        <textarea id="messageWindow" rows="15" cols="60" readonly="true" style="resize:none; width: 75%; height: 90%; border-radius: 10px; border: 2px solid #b35e5e; font-family:sans-serif;"></textarea>
			        <br/>
			      
	 				<input type="hidden" id="id" value="김동영"/>
			        <input id="inputMessage" type="text" style="width: 250px;
    					height: 27px;
   						 border: 1px solid #FF9800;
   						 margin-top: 1%;
   						 border-radius: 5px;"/>
			        <input type="submit" value="send" onclick="send();" id="sendbtn" style="border: 3px solid skyblue; background-color: white; color: skyblue; padding: 5px; width:120px; height:30px; font-size:14px; font-weight:bold;"/>
			         <input type="button" value="exit" onclick="exit();" id="exitbtn" style="border: 3px solid red; background-color: white; color: red; padding: 5px; width:120px; height:30px; font-size:14px; font-weight:bold;"/>
			    </fieldset>
			</body>
		</section>
		</div>
</body>
  <script type="text/javascript">
  $(function(){
	  
	 $('#inputMessage').keypress(function(){  //엔터키 눌러서 send
		 if (window.event.keyCode == 13) {

			 send();
		 }
	  });
  });
  /*******************************************/
        var textarea = document.getElementById("messageWindow");
  		//접속할ipv4 주소,서버포트번호,context를 설정한다(src안의 broadcasting어노테이션을 참조하여 짜여진 로직으로 웹소켓을 구현하는 원리).
        var webSocket = new WebSocket('ws://192.168.110.21:8787/WebSocketChat/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
        var id = document.getElementById("id").value;
       
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {    //1.웹소켓 open
      onOpen(event)
    };

    webSocket.onmessage = function(event) {   //상대가 보낸 메세지(파라미터)
    	
      onMessage(event)          //onMessage함수실행(파라미터 전달)
    };

    function onMessage(event) {              //상대가 보낸 메세지 GUI에 출력
        textarea.value += event.data + "\n";
    }

    function onOpen(event) {             //2.채팅방 접속
    	
        textarea.value += "아이디님이 접속하셨습니다.\n";
      
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {    //입력한 메세지 전송
    	var inputVal = document.getElementById("inputMessage").value;
    	if(inputVal.length==0){
    		return false;
    	}else{
        	textarea.value += "아이디(이름) : " + inputMessage.value + "\n";
        	webSocket.send(id + " : " + inputMessage.value);
        	inputMessage.value = "";   //보낸 후 input태그 공백으로 돌리기
 
        	//스크롤바 가장 하단으로 내리기
      	    document.getElementById("messageWindow").scrollTop = document.getElementById("messageWindow").scrollHeight;



    	}
    }
  </script>
</html>
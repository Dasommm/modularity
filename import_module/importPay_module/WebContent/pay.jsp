<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

html{
    width: 100%;
    height: 100%;
}

#orderBody{
    height: 60%;
    padding-left: 20%;
    padding-right: 20%;

}

#titleArea{
    display: block;
    font-size: 20px;
    padding: 10px 20px;
    font-family: 'HelveticaLTPro','Arial';
    text-align: center;
    
}
.title{
    position: relative;
    height: 10px;
    margin: 0;
    line-height: 10px;
    display: block;
    font-size: 13px;
    margin-block-start: 1em;
    margin-block-end: 1em;
    font-family: '나눔고딕','Nanum Gothic' ,'Arial','dotum',sans-serif;
}

.required{
    float: right;
}

.orderListArea th{
    padding: 11px 0 10px;
    border-bottom: 4px double #ddd;
    color: #353535;
    vertical-align: middle;
    font-weight: normal;
    font-size: 11px;
    text-align: center;
}
.orderListArea td, select{
    border-color: #eee;
    padding-left: 0;
    padding-right: 0;
    border-top: 1px solid #ddd;
    color: #353535;
    vertical-align: middle;
    text-align: center;

}
.orderInfo{
    margin-top: 100px;
}
.deliveryArea, .totalPay{
    margin-top: 30px;
    margin-bottom: 30px;
}


body{
	font-family: '나눔고딕','Nanum Gothic' ,'Arial','dotum',sans-serif;
    font-size: 13px;
    color: #222;
    font-weight: 500;
    background: #fff;
    letter-spacing: 0.5px;
}

table{
	width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    border-bottom: 1px solid #ddd;
}

.zipcode{
	background: #888;
    color: #fff;
    border-color: #888;
    padding: 3px;
    text-decoration: none;
}
    
td{
    padding: 10px 10px 9px;
}

.basetable{
    padding: 11px 0 10px 18px;
    border: 1px solid #ddd;
    border-bottom-width: 0;
    color: #353535;
    text-align: left;
    font-weight: normal;
    background-color: #fafafa;

}

.deliveryArea{
    position: relative;
}
.addr2, .addr3{
    width: 450px;
    margin: 5px 5px 0 0;
}
#inputTypeText{
    text-align: right;
    ime-mode: disabled;
    clear: none;
    border: 0px;
    float: none;
}
#payConfirm{
    height: 38px;
    width: 330px;
    line-height: 38px;
    font-size: 12px;
    display: inline-block;
    letter-spacing: 1px;
    text-align: center;
    vertical-align: middle;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.05);
    border: 1px solid #444;
    background: #000;
    color: #fff;
    border-radius: 0px;
    font-family: Nanum Gothic;
}
#payCancle{
    height: 38px;
    width: 330px;
    line-height: 38px;
    font-size: 12px;
    display: inline-block;
    letter-spacing: 1px;
    text-align: center;
    vertical-align: middle;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.05);
    border: 1px solid #444;
    background: #fafafa;
    color:black;
    border-radius: 0px;
    font-family: Nanum Gothic;

}
a:link {
    cursor: pointer;
}
.totalPay{
    text-align: center;
    background: #f9f9f9;
    padding-bottom: 16px;
    border: 1px solid #ddd;
    box-sizing: border-box;

}

#inputTypeText{
    width: 100px;
    height: auto;
    padding: 0;
    border: 0;
    font-size: 30px;
    font-weight: 400;
    line-height: normal;
    color: red;
    background: #f9f9f9;
}

.total{
    text-align: center;
    padding: 20px 20px 0px 20px;
}

</style>

<!-- i'mport 소스 -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <!-- i'mport 소스 끝-->
 <script>
	 
 var IMP = window.IMP;
 IMP.init("imp43033309"); // 가맹점 식별코드-> i'mport에 가입 후 부여받을 수 있다.
 
 function requestPay() {
//IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param -> 내용 수정 부분
   pg: "inicis",	//결제 업체
   pay_method: "card",	//결제 방법
   merchant_uid: "ORD20180131-0000021",	//주문번호, 결제가 된 적이 있는 주문번호의 경우 재결제 불가
   name: "주문명:test",	//품목명
   amount: 100,			//주문금액
   buyer_email: "test@gmail.com",		//구매자 정보
   buyer_name: "구매자 이름",			
   buyer_tel: "010-4242-4242",	
   buyer_addr: "서울특별시 강남구 신사동",	
   buyer_postcode: "01181",
   m_redirect_url : "http://localhost:8787/EveryFarm/test.html"		//모바일 결제후 이동 될 주소(모바일 결제시에만 사용된다)
 }, function (rsp) { // callback -> 결제 프로세스 완료 후 호출되는 함수, rsp:결제 결과의 정보를 담고 있는 객체
	 if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	      // jQuery로 HTTP 요청
	      jQuery.ajax({
	          url: "http://localhost:8787/EveryFarm/test.html", // 가맹점 서버
	          method: "POST",	//전송방식
	          headers: { "Content-Type": "application/json" },	// 
	          data: {
	              imp_uid: rsp.imp_uid,	//아임포트 거래 고유번호
	              merchant_uid: rsp.merchant_uid	//가맹점에서 관리하는 주문번호
	          }
	      });
	    } else {
	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	    }
	  });	 
}
 
 </script>

</head>
<body>


<section id="orderBody">
	<div id="titleArea">
		<h2>ORDER</h2>
	</div>

	<!-- 주문내역 -->
	<div class="orderListArea">
		<div class="title">
			주문내역
		</div>

		<!-- 기본배송 -->
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 40px">
					<col style="width: 92px">
					<col style="width: auto">
					<col style="width: 170px">
					<col style="width: 75px">
					<col style="width: 98px">
					<col style="width: 170px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class=""><input type="checkbox" onclick=""></th>
						<th scope="col">IMAGE</th>
						<th scope="col">PRODUCT NAME</th>
						<th scope="col">PRICE</th>
						<th scope="col">QTY</th>
						<th scope="col">DELIVERY</th>
						<th scope="col">TOTAL</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input id="" name="" value="" type="checkbox"></td>
						<td><a href=""><img src="" alt="" width="100px" height="100px"></a></td>
						<td><a href="">밀턴 백트임 티셔츠</a>
						<td>
							<div class="">
								17,000 won
							</div>
						</td>
						<td><div>1</div></td>
						<td><div class="">기본배송</div></td>
						<td>
							<div class="">17,000 won</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 주문 정보 -->
	<div class="orderInfo">
		<div class="title">
			주문정보
			<span class="required">
				<img src="" alt="필수"> 필수입력사항
			</span>
		</div>
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 170px;">
					<col style="width: auto;">
				</colgroup>
				<!-- 국내 쇼핑몰 -->
				<tbody class="address_form">					
					<tr>
						<th class="basetable">주문하시는 분 <img src="" alt="필수"></th>
						<td><input id="" name="" class="" size="15" value="" type="text"></td>
					</tr>
					<tr>
						<th class="basetable">주소 <img src="" alt="필수"></th>
						<td>
							<input id="" name="" class="" size="6" maxlength="6" readonly="" value="" type="text"> 
							<a href="" class="zipcode" alt="우편번호">우편번호</a><br>
							<input id="" name="" class="addr2" size="40" readonly="" value="" type="text"> 
							<span class="grid">기본주소</span><br>
							<input id="" name="" class="addr3" size="40" value="" type="text"> 
							<span class="grid">나머지주소</span>
						</td>
					</tr>
					<tr>
						<th class="basetable">일반전화
						</th>
						<td><input id="" name="" maxlength="12" size="20"
							value="" type="text">
						</td>
					</tr>
					<tr>
						<th class="basetable">휴대전화 <span class=""><img
							src="" alt="필수"></span>
						</th>
						<td>
							<input id="" name="" maxlength="12" size="20"
							value="" type="text">
						</td>
					</tr>
					<tr>
						<th class="basetable">이메일 <img src="" alt="필수"></th>
						<td>
							<input id="" name="" class="" value="" type="text">
							@<input id="" name="" class="" readonly="readonly" value="" type="text">
							<select id="">
								<option value="" selected="selected">- 이메일 선택 -</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="empas.com">empas.com</option>
								<option value="korea.com">korea.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select>
							<br>							
							- 이메일을 통해 주문처리과정을 보내드립니다. <br>
							- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요					
						</td>
					</tr>						
				</tbody>
			</table>
		</div>
	</div>

	<!-- 배송 정보 -->
	<div class="deliveryArea">
		<div class="title">
			배송 정보
			<span class="required">
				<img src="" alt="필수"> 필수입력사항
			</span>
		</div>
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 170px;">
					<col style="width: auto;">
				</colgroup>

				<!--배송지 정보 -->
				<tbody>
					<tr>
						<th class="basetable">받으시는 분 <img src="" alt="필수"></th>
						<td><input id="" name="" class=""
							size="15" value="" type="text"></td>
					</tr>
					<tr>
						<th class="basetable">주소 <img src="" alt="필수"></th>
						<td>
							<input id="" name="" class="" size="6" maxlength="6" value="" type="text"> 
							<a href="" class="zipcode" alt="우편번호">우편번호</a><br>
							<input id="" name="" class="addr2" size="40" value="" type="text"> 
							<span class="grid">기본주소</span><br>
							<input id="" name="" class="addr3" size="40" value="" type="text"> 
							<span class="grid">나머지주소</span>
						</td>
					</tr>
					<tr>
						<th class="basetable">일반전화
						</th>
						<td>
							<input id="" name="" maxlength="12" size="20"
							value="" type="text">
						</td>
					</tr>
					<tr>
						<th class="basetable">휴대전화
							<img src="" alt="필수">
						</th>
						<td>
							<input id="" name="" maxlength="20" size="20" value="" type="text">
						</td>
					</tr>
				</tbody>
				<tbody class="delivery">
					<tr>
						<th class="basetable">배송메시지
						</th>
						<td><textarea id="" name="" maxlength="255" cols="70"></textarea>
							<br>
							배송메시지란에는 배송시 참고할 사항이 있으면 적어주십시오.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 총 주문금액 상세내역 레이어 -->
	<div id="" class="totalPay">
		<div class="total">
			<span id="">최종결제 금액</span>
			<input id="inputTypeText" name="" size="6" readonly="1"	value="36500" type="text">
				&nbsp;won
			
		</div>
		<div>
			<p>
				<input name="" value="T" type="checkbox">
				결제정보를 확인하였으며, 구매진행에 동의합니다.
			</p>
		</div>
		<a class="" id="payCancle" onclick="">취소</a>
		<a class=""	id="payConfirm" onclick="requestPay()">결제하기</a>
	</div>

	</section>	
	
	

</body>
</html>
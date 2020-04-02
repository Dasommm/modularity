<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바차트</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="dist/Chart.js"></script>
<style>
   .chart-container{
      width: 500px;
      height: 500px;
      border: 1px solid #ddd;
      padding: 8%;
      border-radius: 8px;
      margin-left: 2.5%;
   }
   .pie-chart{
      width: 400px;
   }
</style>
</head>
<body>
	<div class="chart-container">
	<!-- 차트 영역을 컨트롤 하기 위해서 div 감싼다. -->
		<span>현재 진행중인 상품 총액 </span><span style="font-size: 5px;">펀드 단위</span>
		<canvas id="bar-chart3"></canvas>
		<!-- 차트는 canvas 태그 영역에 '그려진다' -->
	</div>

	<script>
            var mychart3 = $('#bar-chart3');
            var myBarChart3 = new Chart(mychart3, {
            	 //차트타입
                 type: 'bar',
                 //차트 데이터 부분
                 data: {
                 	//차트 항목명
                   labels: ['경매', '펀드'],
               		//데이터 설정
                   datasets: [{
                	 //첫번째 데이터셋 (좌측)
                     label: '총액(좌)',	//바 이름
                     yAxisID: 'A', 		// y축 id
                     data:[500, 200],	// 데이터 값
                     backgroundColor:'rgba(40,180,130,.5)', //배경색
                     borderColor:'rgba(40,180,130)',		//테두리색
                     borderWidth:1							//테두리두께
                   }, { //두번째 데이터셋(우측)
                     label: '인원수(우)',	// 바 이름
                     yAxisID: 'B', 		// y축 id
                     data: [250, 450],	// 데이터 값
                     backgroundColor:'rgba(180,40,20,.5)',	//배경색
                     borderColor:'rgba(180,40,20)',			//테두리색
                     borderWidth:1							//테두리두께
                   }]
                 },
                 options: {
                   maintainAspectRatio:false,			// 비율유지 안함(canvas 크기에 맞게 늘어남)
                   scales: {
                     yAxes: [{
                       id: 'A',							// y축 id A
                       type: 'linear',					// 축 타입
                       position: 'left',				// 축 위치(좌)
                       ticks: {
                         min: 0							// 최소값
                       },
                       gridLines : { display : false }	// 그리드 끔
                     }, {
                       id: 'B',							// y축  id B
                       type: 'linear',					// 축 타입
                       position: 'right',				// 축 위치(우)
                       ticks: {
                         min: 0							// 최소값
                       }
                     }]
                   }
                 }
            });
            </script>
</body>
</html>
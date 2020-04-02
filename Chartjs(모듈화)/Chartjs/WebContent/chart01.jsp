<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원형차트</title>
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
		품목별 상품 수
		<canvas id="pie-chart"></canvas>
		<!-- 차트는 canvas 태그 영역에 '그려진다' -->
	</div>

	<script>
		var mychart = $('#pie-chart');
		var piechart = {
			//차트이름
			label : 'piechart',
			//들어갈 데이터
			data : [ 10, 20, 30, 40, 50, 25 ],
			//배경색
			backgroundColor : [ 'rgba(200,0,0,.45)', 
								'rgba(200,200,0,.45)',
								'rgba(0,200,0,.45)', 
								'rgba(0,200,200,.45)',
								'rgba(0,0,200,.45)', 
								'rgba(200,0,200,.45)' ],
			//원형차트 테두리 색상과 두께
			borderColor : 'white',
			borderWidth : 2,
		};
		// 실제로 객체 생성하는 부분
		var myLineChart = new Chart(mychart, { //해당 캔버스에 아래와 같은 형식으로
			//차트 타입
			type : 'pie',
			//차트 항목명
			data : {
				labels : [ '과일', '채소', '곡류', '견과류', '약용작물', '버섯' ],
				datasets : [ piechart ] // 이 부분에 데이터를 직접 넣어도 된다. 위의 piechart 이용.
			},
			options : { 
				maintainAspectRatio : false,
				// 비율유지 안함(canvas 크기에 맞게 늘어남)
				cutoutPercentage : 40,
				// 50으로 하면 도넛 0으로 하면 원형
				rotation : 30
				// 원형 차트 회전을 검
			}
		});
	</script>

</body>
</html>
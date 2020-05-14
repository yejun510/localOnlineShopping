<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style type="text/css">
	
	     img{min-height: 100%; max-width: 100%; }
        .imgHoverEvent{width: 200px; height: 200px; margin: 30px; position: relative; overflow: hidden; display: inline-block;}
        .imgHoverEvent .imgBox{width: 200px; height: 200px; text-align: center; background:url(http://gahyun.wooga.kr/portfolio/triple/resources/img/city00.jpg) no-repeat 50% 50%; background-size: auto 100%;}
        .imgHoverEvent .hoverBox{position: absolute; top:0; left: 0; width: 200px; height: 200px;}
        .hoverBox p.p1{text-align:center; font-size:18px;}
        .hoverBox p.p2{margin-top: 40px;}
     
        .event8 .hoverBox span p{color:#fff;}
        .event8 .hoverBox span.span1{display: block; position: absolute; top: -90px; transition: 0.5s;
            width:120%; height: 100px; line-height: 100px; background: #000; transform: rotate(10deg)
        }
        .event8 .hoverBox span.span2{
            display: block; position: absolute; bottom: -90px;transition: 0.5s; left: -20px;
            width:120%; height: 100px; line-height: 100px; background: #000; transform: rotate(10deg)
        }
        .event8:hover .hoverBox span.span1{top: -40px;}
        .event8:hover .hoverBox span.span2{bottom: -40px;}
        
        p{
        font-family: 'Do Hyeon', sans-serif;
        cursor: default;
        }
        .p1{
        	cursor: pointer;
        }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#beef").click(function(){
			location.href = "/product/productListBeef.do";
		});
		
		$("#pork").click(function(){
			location.href = "/product/productListPork.do";
		});
	});
</script>

<title>Insert title here</title>
</head>
<body>
	<div id="content_image">
		<img src="../resources/img/main.jpg" width="100%" height="500px">
	</div>
	
	<div id="content_about" align="center">
		<p>
			주지 육림은 당일 도축 당일 배송만을 취급하는 온라인 정육점입니다.
			</p>
	</div>
	
	<div id="content_menu" align="center">
		
			<div class="imgHoverEvent event8">
				<div class="imgBox">
					<img src="../resources/img/beef.jpg" width="300px" height="300px">
				</div>
			    <div class="hoverBox">
		            <span class="span1">
		            	<p class="p1" id="beef">소고기</p>
		            </span>
	            </div>
            </div> 
			
			<div class="imgHoverEvent event8">	
				<div class="imgBox">
					<img src="../resources/img/pork.jpg" width="300px" height="300px">
				</div>
				<div class="hoverBox">
		            <span class="span1">
		            	<p class="p1" id="pork">돼지고기</p>
		            </span>
	            </div>
			</div>
	</div>
	
	
</body>
</html>
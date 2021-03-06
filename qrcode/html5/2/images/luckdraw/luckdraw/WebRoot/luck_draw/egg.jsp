<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>砸金蛋</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<style>
	body{margin:0px;padding:0px;}
	.fanzt-egg{margin:0px;padding:0px; background-color:RGB(221,147,0); position:relative;}
	.fanzt-egg .fanzt-egg-img{position:absolute; z-index:9990;}
	.fanzt-egg .fanzt-chuizi{ position:absolute; z-index:9991;display:none;-webkit-transform:rotate(5deg);
		-moz-transform:rotate(5deg);-o-transform:rotate(5deg);transform:rotate(5deg);}
	.fanzt-egg .fanzt-hua{ position:absolute; z-index:9991;display:none;
		-webkit-transition::all 0.8s ease;-moz-transition::all 0.8s ease;
		-o-transition::all 0.8s ease;transition:all 0.8s ease;}
	.fanzt-egg .fanzt-message{ position:absolute; z-index:9995;display:none;
		width:140px; padding:10px;color:red;text-align:center;
		-webkit-transition::all 0.8s ease;-moz-transition::all 0.8s ease;
		-o-transition::all 0.8s ease;transition:all 0.8s ease;}
</style>
</head>

<body>
	<div class="fanzt-egg">
    	<div class="fanzt-egg-img" data-flag="0" onClick="eggClick(this)">
        	<img src="images/egg_1.png" id="egg">
        </div>
        <div class="fanzt-chuizi"><img src="images/img-6.png"></div>
        <div class="fanzt-hua"><img src="images/img-4.png"></div>
        <div class="fanzt-message"><b>中奖了</b></div>
    </div>
    <script>
		function eggClick(obj){
			if($(obj).attr("data-flag")=="0"){
				$.post("ser.jsp",{
					//要传递的参数
				},function(data){
					if(data!=null){
						$(".fanzt-chuizi").show();
						var ctop=$(".fanzt-chuizi").position().top-20;
						var cleft=$(".fanzt-chuizi").position().left+30;
						//1.锤子抬起的动作
						$(".fanzt-chuizi").animate({"top":ctop+"px","left":cleft+"px"},1500,function(){
							//2.锤子抬起达到最顶点的动作
							$(".fanzt-chuizi").css(
								{
										"-webkit-transform":"rotate(80deg)",
										"-moz-transform":"rotate(80deg)",
										"-o-transform":"rotate(80deg)",
										"transform":"rotate(80deg)",
										"-webkit-transition":"all 0.8s ease",
										"-moz-transition":"all 0.8s ease",
										"-o-transition":"all 0.8s ease",
										"transition":"all 0.8s ease"
								});
							//3.锤子落下的动作
							$(".fanzt-chuizi").animate({"top":(ctop+25)+"px","left":(cleft-50)+"px"},200,function(){
								//4.锤子落下到达最低点
								$(".fanzt-chuizi").css(
									{
										"-webkit-transform":"rotate(5deg)",
										"-moz-transform":"rotate(5deg)",
										"-o-transform":"rotate(5deg)",
										"transform":"rotate(5deg)",
										"-webkit-transition":"all 0.1s ease",
										"-moz-transition":"all 0.1s ease",
										"-o-transition":"all 0.1s ease",
										"transition":"all 0.1s ease"
									});
								//5.金蛋破碎
								$("#egg").attr("src","images/egg_2.png");
								$(".fanzt-chuizi").hide();
								//6.金花溅出
								$(".fanzt-hua").slideDown(200);
								//7.中奖结果
								$(".fanzt-message").show(200);
								$(".fanzt-message").find("b").text(data);
								//8.程序处理
								$(obj).attr("data-flag","1");//已砸蛋，不能再砸
							});
						});
					}
				});
			}
		}
		$(function(){wh();});
		$(window).resize(function(e){wh();});
    	//控制宽高
		function wh(){
			var eggh=158;
			var eggw=187;
			$(".fanzt-egg").width($(window).width());
			$(".fanzt-egg").height($(window).height());
			$(".fanzt-egg-img").css({"top":(($(window).height()-eggh)/2)+"px","left":(($(window).width()-eggw)/2)+"px"});
			$(".fanzt-chuizi").css({"top":(($(window).height()-eggh)/2)-15+"px","left":(($(window).width()-eggw)/2)+130+"px"});
			$(".fanzt-hua").css({"top":(($(window).height()-eggh)/2-45)+"px","left":(($(window).width()-eggw)/2-30)+"px"});
			$(".fanzt-message").css({"top":(($(window).height()-eggh)/2-30)+"px","left":(($(window).width()-eggw)/2)+"px"});
		}
    </script>
</body>
</html>


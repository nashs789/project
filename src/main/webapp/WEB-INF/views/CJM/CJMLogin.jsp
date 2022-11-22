<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,
							  		   maximum-scale=1.0, user-scalable=no" />
		<title>로그인</title>
		<style type="text/css">
			html {
				max-height: 731px;
			}
			body {
				background-image: url("resources/images/sero.jpg");
				margin: 0px;
				font-size: 10pt;
				max-height: 731px;
				height: 100%;
			}
			.login_box {
				display: block;
				margin: 38vh auto;
				width: 80%;
				height: 23vh;
			}
			.login {
				width: 100%;
				height: 8vh;
				margin-bottom: 10px;
				border: 0px;
				border-radius: 5px;
				outline-style: none;
				font-size: 1.4em;
				text-indent: 15px;
			}
			.btn {
				width: 20vw;
				height: 6vh;
				font-size: 1.2em;
				font-weight: bold;
				background-color: #e6f2ff;
				border: 0px;
				float: right;
				margin-left: 20px;
				border-radius: 5px;
			}
			.popup {
			   display: inline-block;
			   width: 300px;
			   height: 150px;
			   background-color: #fcfcfc;
			   box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
			   position: fixed;
			   top: calc(50% - 75px); 
			   left: calc(50% - 150px); 
			   z-index: 500;
			   border-radius: 10px;
			}
			.popup_entity_txt {
			   font-size: 1.2em;
			   font-weight: bold;
			   text-align: center;
			   line-height: 50px;
			   width: 265px;
			   height:40px;
			   margin: 30px auto 30px auto;
			}
			#yesBtn{
			   text-decoration: none;
			   display:inline-block;
			   text-align:center;
			   width: 270px;
			   height:30px;
			   padding: 10px 15px 10px 15px;
			   font-size: 1.2em;
			   color: #FFFFFF;
			   font-weight: bold;
			   line-height: 30px;
			   border-radius: 0 0 10px 10px; 
			   background-color: #f37321;
			}
			.btn_list a{
			   text-decoration: none;
			   display:inline-block;
			   text-align:center;
			   width: 120px;
			   height:30px;
			   padding: 10px 15px 10px 15px;
			   font-size: 12pt;
			   color: #f37321;
			   font-weight: bold;
			   line-height: 30px;
			}
			.btn_list a:first-child {
			   border-radius: 0 0 0 10px; 
			}
			.btn_list a:last-child {
			   border-radius: 0 0 10px 0; 
			}
			.bg {
				display: inline-block;
				width: 100%;
				height: 100%;
				position: fixed;
				top: 0px;
				left: 0px;
				background-color: #000000;
				z-index: 400;
				opacity: 0.2;
			}
		</style>
		<script type="text/javascript"
				src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				$("#loginBtn").on("click", function() {
					if($.trim($("#inputID").val()) == "") {
						txt = "아이디를 입력해주세요!!";
						commonPopup(txt);
					} else if($.trim($("#inputPW").val()) == "") {
						txt = "비밀번호를 입력해 주세요!!";
						commonPopup(txt);
					} else {
						
						var params = $("#loginForm").serialize();

						$.ajax({
							url: "CJMLogins",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res) {
								if(res.msg == "success") {
									$("#loginForm").attr("action", "CJMMyPage");
									$("#loginForm").submit();
								} else {
									txt = "아이디 또는 비밀번호가 일치하지 않습니다!!";
									commonPopup(txt);
									$(".popup_entity_txt").css("font-size", "0.99em");
								}
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
					}
				});
			}); // document ready end..
			
			function commonPopup(txt) {
				var html = "";
				
				html 	 +="<div class=\"popup\">";
				html	 +="	 <div class=\"popup_entity_txt\">"+ txt +"</div>";
				html	 +="     <div class=\"btn_list\">";
				html	 +="        <div id=\"yesBtn\">예</div>";
				html	 +="     </div>";
				html	 +="</div>";
				html	 +="<div class=\"bg\"></div>";
				
				$("body").append(html);
				
				$("#yesBtn").on("click", function(){ 
					$(".popup").remove();
					$(".bg").remove();
				});
			}
		</script>
	</head>
	<body>
		<form action="#" id="loginForm" method="post">
			<div class="login_box">
				<input type="text" id="inputID" name="inputID" placeholder="아이디를 입력하세요." class="login" /><br/>
				<input type="password" id="inputPW" name="inputPW" placeholder="비밀번호를 입력하세요." class="login" /><br/>
				<input type="button" value="로그인" id="loginBtn" class="btn" />
			</div>
		</form>
	</body>
</html>
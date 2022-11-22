<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터-자주 묻는 질문</title>
		<style type="text/css">
			/*  #fcba03 노랑
				#2e3459 남색
				#f37321 주황
				#294a37 초록
			*/
			body {
				margin: 0px;
				font-size: 0px;
				font-family: 'Black Han Sans', sans-serif;
				min-width: 1480px;
			}
			
			/* 여기서부터 헤더 레이아웃 */
			#wrap {
				width: 100%;
				height: 100%;
			}
			#header {
				width: 100%;
				height: 140px;
				background-color: #2e3459;
				position: relative;
			}
			.top {
				display: block;
				width: 100%;
				height: 70px;
				background-color: #FFFFFF;
			}
			.site_name {
				display: inline-block;
				vertical-align: top;
				position: absolute; /* 추가하기 */
				width: 200px;
				font-size: 16px;
				font-weight: bold;
				line-height: 70px;
				color: #2e3459;
			}
			.logo_area {
				display: inline-block;
			    width: calc(100% - 470px);
			    height: 70px;
			    background-color: #FFFFFF;
			    text-indent: 40px;
			}
			.logo_photo {
				height: 35px;
				margin-top: 18px;
			}
			.btns { 
			    display: none;
			    vertical-align: top;
			    position:relative;   
			    width: 470px;
			    height: 70px;
			    text-align: right;
			    background-color: #FFFFFF;
			}
			.btns ul li {
			    list-style: none;
				float: left;
				text-align: center;
			    color: #2e3459;
				line-height: 25px;
				text-decoration: none;
				font-size: 18px;
				font-weight: 900;
			}
			.btns>ul>li {
				margin-right: 10px;
			}
			#bookmarkPhoto, #notificationPhoto {
			   width: 40px;
			   margin-right: 20px;
			   margin-top: 15px;
			   cursor: pointer;
			}
			#notificationPhoto{
			   width: 40px;
			   margin-right: 20px;
			   margin-top: 15px;
			   cursor: pointer;
			   position: relative;
			}
			#notificationTxt{
				line-height: 17px;
				width: 20px;
				height: 20px;
				background-color: red;
				position: absolute;
				top: 10px;
				right: 190px;
				border-radius: 50%;
				color: white;
			}
			#profilePhoto{
			height: 40px;
			   width: 40px;
			   margin-right: 20px;
			   margin-top: 15px;
			   cursor: pointer;
			   border-radius: 50%;
			}
			#notificationPhoto {
			   margin-left: 200px;
			}
			.logins {
			   display: inline-block;
			   vertical-align: top;
			   width: 470px;
			   height: 70px;
			   text-align: right;
			   background-color: #FFFFFF;
			}
			.sub_login1 {
			   display: block;
			   position: relative;
			   width: 100%;
			   height: 55px;
			}
			.sub_login2 {
			   display: block;
			    width: calc(100% - 75px);
			    height: 15px;
			    line-height: 10px;
			    text-align: right;
			    padding-right: 75px;
			}
			.sub_login2 span {
			   position: relative;
			   width: 10px;
			   font-size: 12px;
			   font-weight: 600;
			   cursor: pointer;
			   margin-left: 10px;
			}
			.sub_login2 span:hover {
			   color: #fcba03;
			}
			#inputID, #inputPW {
			   float: right;
			   width: 100px;
			   height: 25px;
			   margin-top: 20px;
			   margin-left: 5px;
			}
			#loginBtn {
			   float: right;
			   margin: 20px 20px 0px 5px;
			   width: 50px;
			   height: 30px;
			   background-color: #2e3459;
			   font-weight: bold;
			   font-size: 12px;
			   color: #FFFFFF;
			   text-align: center;
			   line-height: 26px;
			}
			#loginBtn:hover{
			   color: #FFFFFF;
			   background-color: #f37321;
			}
			input[type='text']:focus, input[type='password']:focus{
				outline-color: #fcba03;
			}
			.banner {
				width: 100%;
				height: 70px;
			}
			.menu {
				position: absolute;
				height: 70px;
			    left: 20px;
			}
			.menu ul li {
				list-style: none;
				float: left;
				color: white;
				font-size: 23px;
				font-weight: bold;	
				margin-right: 100px;
				line-height: 70px;
				text-decoration: none;
				cursor: pointer;
			}
			.menu ul li:hover {
				color: #fcba03;
			}
			.search {
				float: right;
				margin: 20px 20px 20px 0px; 
				width: 250px;
				height: 29px;
			}
			.filter {
				float: right;
				margin: 20px 20px 20px 0px; 
				width: 100px;
				height: 35px;
			}
			.search_icon {
				float: right;
				margin: 17px 20px 13px 0px;
				width: 40px;
				cursor: pointer;
			}
			input[type='text']:focus, input[type='password']:focus, input[type="date"], select:focus {
				outline-color: #fcba03;
			}
			
			#admin {
				display: none;
			}
			/* 여기까지 헤더 레이아웃 !!! */
			
			/* 컨테이너 레이아웃 */
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
			   font-size: 0px;
			   border: 0px;
			}
			.popup_entity_txt {
			   font-size: 12pt;
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
			   font-size: 12pt;
			   color: #f37321;
			   font-weight: bold;
			   line-height: 30px;
			   border-radius: 0 0 10px 10px; 
			}
			#yesBtn:hover {
			   background-color: #f37321;
			   color: white;
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
			.btn_list a:hover {
			   background-color: #f37321;
			   color: white;
			}
			.bg {
				display: inline-block;
				width: 100%;
				height: 1552px;
				position: absolute;
				top: 0px;
				left: 0px;
				background-color: #000000;
				z-index: 400;
				opacity: 0.2;
			}
			#cancelImg{
				margin-top: 10px;
				width: 30px;
				margin-left: 135px;
				cursor: pointer;
			}
			#notification{
			 	 display:none;
			     width: 600px;
			     box-shadow: 0px 0px 1px 1px #444444;
			     position: absolute;
			     right: 10px;
			     z-index: 300;
			     font-size: 10pt;
			}
			.read{
			    background-color: #d1d1e0;
				height: 50px;
				border-bottom: 1px solid black;
			}
			.notRead{
				background-color: #a3a3c2;
				height: 50px;
				border-bottom: 1px solid black;
			}
			#notification table{
				border-collapse: collapse;
			}
			
			#notification table tr th:first-child{
				text-align: center;
			}
			
			#notification tr th{
				text-align: left;
			}
			
			#notification tr th img{
				height: 50px;
				width: 50px;
				text-align: center;
				cursor: pointer;
			    margin-top: 5px;
			    border-radius: 50%;
			}
			
			#notification tfoot tr{
				background-color: #48486a;
				color: white;
			}
			   
			#notification tfoot tr th{
				text-align: center;
				cursor: pointer;
			}
			
			#notification tfoot tr th:hover{
				background-color: #a4a4c1;
			}
			
			#notification table tr th span{
				text-decoration: underline;
				cursor: pointer;
			}
			
			#notification table tr th span:hover{
				color: blue;
			}
			#profileSlidedown{
				display: none;
			   	box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
			   	border: 2px solid #fcba03;
			   	background-color: white;
			   	position: absolute;
			   	padding: 0px;
			   	right: 8px;
			   	width: 122px;
			   	margin-top: 10px;
			}
			#profileSlidedown li {
			   	display: inline-block;
			   	border: 1px solid rgb(250,250,250);
			   	font-size: 12pt;
			   	width: 120px;
			   	text-align: center;
			   	cursor: pointer;
			}
			#profileSlidedown li:hover {
				background-color: #f37321;
			}
			#container {
				display: block;
				width: 1280px;
				margin: 0 auto;
				background-color: #FFFFFF;
			}
			.client_center_search {
				display: block;
				margin: 50px auto 0px auto;
				width: 100%;
				height: 120px;
				background-color: #fcba03;
				border-radius: 20px;
				border: 0px;
			}
			.client_center_name {
				display: inline-block;
				vertical-align: top;
				color: #FFFFFF;
				font-weight: bold;
				font-size: 30pt;
				width: 30%;
				height: 100%;
				margin-left: 50px;
			}
			.client_center_name div {
				width: 54%;
				margin: 0px auto;
				line-height: 120px;
			}
			.question_search {
				display: inline-block;
				vertical-align: top;
				width: 700px;
				height: 64px;
				margin-top: 30px;
			}
			.question_search input {
				width: 600px;
				height: 60px;
				line-height: 100px;
				font-size: 15pt;
				text-align: left;
				border-radius: 5px;
				border: 0px;
			}
			.question_search div {
				display: inline-block;
				vertical-align: top;
				width: 70px;
				height: 70px;
				margin: -3px 0px 0px 10px;
			}
			.question_search img {
				width: 70px;
				height: 70px;
				line-height: -30px;
				cursor: pointer;
			}
			
			.sidebar {
				display: block;
				width: 100%;
				height: 100px;
				background-color: #FFFFFF;
				border-bottom: 1px solid rgb(238, 238, 238);
			}
			.sidebar1 {
				color: #f37321;
			}
			.sidebar1, .sidebar2 {
				display: inline-block;
				vertical-align: top;
				font-size: 15pt;
				font-weight: bold;
				width: 200px;
				line-height: 100px;
				cursor: pointer;
				text-align: center;
				margin-left: 20px;
			}
			.sidebar1:hover, .sidebar2:hover {
				color: #f37321;
			}
			.sidebar3 {
				display: inline-block;
				vertical-align: top;
				font-size: 15pt;
				font-weight: bold;
				width: 250px;
				height: 100px;
				text-align: center;
				float: right;
			}
			.sidebar3 p {
				border-left: 1px solid rgb(238, 238, 238);
				color: #fcba03;
			}
			.question_sidebar {
				display: block;
				width: 100%;
				height: 160px;
				margin: 30px auto 0px auto;
				border-bottom: 1px solid rgb(238, 238, 238);
			}
			.question_sidebar ul {
			    list-style: none;
			    margin: 0px;
			    padding: 0px;
			}
			.question_sidebar ul li {
				margin: 0px 0px 0px 0px;
			    padding: 10px 20px;
			    border : 1px solid rgb(238, 238, 238);
			    float: left;
			    font-size: 15pt;
			    font-weight: bold;
			    cursor: pointer;
			    width: 278px;
			    height: 78px;
			    text-align: center;
			    background-color: rgb(250, 250, 250);
			    line-height: 75px;
			}
			.question_sidebar ul li:hover {
				background-color: #f7f7f7;
			}
			
			.question_area {
				display: block;
				width: 100%;
				padding: 0px;
			}
			.question_area ul {
				padding: 0px;
			}
			.question {
				font-size: 14pt;
				padding: 25px 34px;
				cursor: pointer;
				border-bottom: 1px solid rgb(238, 238, 238);
			}
			.question:hover {
				background-color: #fdfdfd;
			}
			.question img {
				float: right;
				width: 24px;
				height: 24px;
			}
			.answer {
				display: none;
				font-size: 14pt;
				padding: 25px 34px;
				background-color: rgb(250, 250, 250);
			}
			.qna {
				text-align: center;
				color: #fcba03;
				margin-right: 10px;
				font-weight: bold;
			}
			.more {
				display: block;
				height: 20px;
				font-size: 14pt;
				color: #fcba03;
				text-align: center;
				line-height: 20px;
				padding: 16px;
				border-bottom: 1px solid rgb(238, 238, 238);
				cursor: pointer;
				margin-bottom: 50px;
			}
			.more img {
				width: 16px;
				height: 16px;
			}
			
			/* 컨테이너 레이아웃 끝 */
			#footer {
				display: block;
				width: 100%;
				height: 100px;
				background-color: #2e3459;
				color: #FFFFFF;
				font-size: 15px;
			}
			#footer p {
				margin: 0px auto;
				padding-top: 20px;
				padding-left: 250px;
				width: 600px;
				height: 80px;
			}
			#ok{
				   text-decoration: none;
				   display:inline-block;
				   text-align:center;
				   width: 270px;
				   height:30px;
				   padding: 10px 15px 10px 15px;
				   font-size: 12pt;
				   color: #f37321;
				   font-weight: bold;
				   line-height: 30px;
				   border-radius: 0 0 10px 10px; 
				   cursor :pointer;
			}
			#ok:hover{
				   background-color: #f37321;
   					color: white;
			}
		</style>
		<script type="text/javascript"
				src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			var popupText = "";
			$(document).ready(function() {
				if("${sMEM_NO}" != "")
				{
					$(".logins").css("display", "none");
					$(".btns").css("display", "inline-block");
					//로그인 상태에 따라서 우측 상단 제어
					
					var path = ""; //사진경로 담아줄 변수
					
					if("${sPHOTO_PATH}" != "")
					{
						path = "resources/upload/" + "${sPHOTO_PATH}";
						
						$("#profilePhoto").attr("src", path);
					}
					else
					{
						path = "./resources/images/profile.png";

						$("#profilePhoto").attr("src", path);
					}//if ~ else end
					//프로필 사진이 DB에 있는경우 저장된 사진으로, 없는 경우 기본 사진으로
					
					if("${sGRADE_NO}" == "0")
					{
						$("#admin").show();
					}//등급에 따라서 내부 관리자 보이기
					
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "notifications",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result)
						{
							if(result.msg == "success")
							{
								makeNotification(result.notification);
							}
							else
							{
								popupText = "오류가 발생했습니다.";
								commonPopup(popupText);
							}
						}, //success end
						error: function(request, status, error) {
							console.log(error);
						} // error end
					}); //ajax end 
				}//if end -> 로그인 상태여부에 따른 처리
				
				$(".logo_photo").on("click", function() {
					location.href = "main";
				});
				
				// 상단배너 -> 여행게시판 - 자유게시판 - 여행작가 - 고객센터 - 내부관리자 메뉴 이동
				$("#journalBoard").on("click", function() {
					location.href = "journalBoard";
				});
				$("#community").on("click", function() {
					location.href = "community";
				});
				$("#travelWriter").on("click", function() {
			  		location.href = "travelWriterRank";
			  	});
				$("#clientCenter").on("click", function() {
			  		location.href = "clientCenterQuestion";
			  	});
				$("#admin").on("click", function() {
			  		location.href = "memAdmin";
			  	});
				
			  	$("#myPage").on("click", function(){
			  		location.href = "myPage";
				}); //find click endmyPage
			  	
			  	$("#timeline").on("click", function(){
			  		location.href = "timeline";
			  	}); //timeline click end
			  	
			  	$("#editProfile").on("click", function(){
			  		location.href = "editProfile";
			  	}); //editProfile click end
			  	
				$("#editInfo").on("click", function(){
					location.href = "editInfo";
			  	}); //editInfo click end
			  	
				$("#join").on("click", function(){  //회원가입 버튼 클릭
					location.href="terms";
				}); // join click end
				
				$("#find").on("click", function(){
					findBtnPopup();
				}); //find click end
				
				$("#notificationMore").on("click", function(){
					location.href="notification";
				}); //notificationMore click end
				
				$("#bookmarkPhoto").on("click", function(){
					location.href = "myPageBMK";
				}); //bookmarkPhoto click end
			  	
			  	$("#logoutBtn").on("click", function(){
					$.ajax({
						url: "logouts",
						type: "post",
						dataType: "json",
						success: function(result) {
							location.reload();
						}, //success end
						error: function(request, status, error) {
							console.log(error);
						} //error end
					}); //ajax end
			  	}); //logoutBtn click end
				
				$("#notification tbody").on("click", "span, tr, img", function(){
					if($(this).attr("class") == "notRead")
					{
						$("#NOTF_NO").val($(this).attr($(this).attr("class")));
				
					    var params = $("#notificationForm").serialize();
						
						$.ajax({
							url: "reads",
							data: params,
							dataType: "json",
							type: "post",
							success:function(result)
							{
							}, //success end
							error: function(request, status, error) {
								console.log(error);
							} // error end
						}); //ajax end  
					} //if end 알람 팝업에서 아이디, 글 제목, 프로필 사진 눌렸을 경우에 읽음표시
					
					if($(this).attr("class") == "user")
					{
						$("#userNo").val($(this).attr($(this).attr("class")));
						$("#userForm").submit();
					}
					else if($(this).attr("class") == "journal")
					{
						$("#journalNo").val($(this).attr($(this).attr("class")));
						$("#actionForm").attr("action", "journal");
						$("#actionForm").submit();
					}
					else if($(this).attr("class") == "post")
					{
						$("#postNo").val($(this).attr($(this).attr("class")));
						$("#postForm").submit();
					}//if ~ else end 클릭된 것에 따라서 해당 프로필 or 글로 이동
				}); //notification tbody span tr click end
				
				$("#loginBtn").on("click", function(){  //로그인 버튼 클릭
					if($.trim($("#inputID").val()) == "")
					{
						popupText = "아이디를 입력하세요.";
						commonPopup(popupText);
					}
					else if($.trim($("#inputPW").val()) == "")
					{
						popupText = "비밀번호를 입력하세요.";
						commonPopup(popupText);
					}
					else
					{
						var params = $("#loginForm").serialize();
						
						$.ajax({
							url: "logins",
							data: params,
							dataType: "json",
							type: "post",
							success:function(result)
							{
								if(result.msg == "failed")
								{
									popupText = "ID와 PW가 일치하지 않습니다.";
									commonPopup(popupText);
									$("#inputID").val("");
									$("#inputPW").val("");
								}
								else
								{
									location.reload();
								}
							}, //success end
							error: function(request, status, error) {
								console.log(error);
							} // error end
						}); //ajax end 
					}// if ~ else end
				}); //loginBtn click end

				$("#inputPW, #inputID").on("keypress", function(){
					$(".popup").remove();
					$(".bg").remove();
					if(event.keyCode == 13)
						$("#loginBtn").click();
				});//inputPW, inputID 
				//keypress end 엔터시 로그인 버튼 클릭
				
				$("#profilePhoto").on("click", function(){
					$("#notification").css("display", "none");
					if($("#profileSlidedown").css("display") == "block")
					{
						$("#profileSlidedown").css("display", "none");
					}
					else
					{
						$("#profileSlidedown").css("display", "block");
					}
				}); //profilePhoto click end
				//프로필 사진 클릭 시 하위메뉴 나왔다 사라졌다 & 알람 팝업은 안보이도록
				
				$("#notificationPhoto").on("click", function(){
					$("#profileSlidedown").css("display", "none");
					if($("#notification").css("display") == "block")
					{
						$("#notification").css("display", "none");
					}
					else
					{
						$("#notification").css("display", "inline-block");
					}
				}); //notificationPhoto click end
				
				// 고객센터 (자주묻는질문, 문의사항) 이동
				$("#question").on("click", function() {
					location.href = "clientCenterQuestion";
				});
				$("#matter").on("click", function() {
					location.href = "clientCenterMatter";
				});

			 	if($("#sidebarGbn").val() == "") {
					reloadCnt();
				}
				
				$("#sidebarGbn1").on("click", function() {
					$("#sidebarGbn").val($("#sidebarGbn1").val());
					$(".qna_list").empty();
					$("#searchTxt").val("");
					reloadCnt();
				});
				$("#sidebarGbn2").on("click", function() {
					$("#sidebarGbn").val($("#sidebarGbn2").val());
					$(".qna_list").empty();
					$("#searchTxt").val("");
					reloadCnt();
				});
				 $("#sidebarGbn3").on("click", function() {
					$("#sidebarGbn").val($("#sidebarGbn3").val());
					$(".qna_list").empty();
					$("#searchTxt").val("");
					reloadCnt();
				});
				 
				$("#sidebarGbn4").on("click", function() {
					$("#sidebarGbn").val($("#sidebarGbn4").val());
					$(".qna_list").empty();
					$("#searchTxt").val("");
					reloadCnt();
				}); 
				
				$("#questionSearchIcon").on("click", function() {
					//$("#mainSearchOldTxt").val($("#mainSearchTxt").val());
					$("#sidebarGbn").val("");
					$(".qna_list").empty();
					reloadCnt();
				});
				
				$(".more").on("click", function() {
					reloadList();
				});
				
				$(".qna_list").on("click", ".question", function(){
					$(".answer").slideUp();
					
					if(!$(this).next().is(":visible")) {
						$(this).next().slideDown();
					}
				});
				
				// 메인검색창 넘어가는 부분(동기)
				$(".search_icon").on("click", function() {
					if($("#mainSearchFilter").val() == 0) {
						$("#goSearch").attr("action", "search");
						$("#goSearch").submit();
					} else if($("#mainSearchFilter").val() == 1) {
						$("#goSearch").attr("action", "searchTravelDiary");
						$("#goSearch").submit();
					} else if($("#mainSearchFilter").val() == 2) {
						$("#goSearch").attr("action", "searchHashtag");
						$("#goSearch").submit();
					} else if($("#mainSearchFilter").val() == 3) {
						$("#goSearch").attr("action", "searchCommunity");
						$("#goSearch").submit();
					} else {
						$("#goSearch").attr("action", "searchNic");
						$("#goSearch").submit();
					}
				});
				
				
				
			}); // document ready end..
			function makeNotification(notification)
			{
				var html = ""; //알림 표현용
				var readCnt = 0;
				var html1 = "";  //알림 개수 표현용
				
				for(noti of notification)
				{
					if(noti.READ == 1)
					{
						html += "<tr class=\"notRead\" notRead=\"" + noti.NOTF_NO + "\">";
						readCnt++;
					}
					else
					{
						html += "<tr class=\"read\" read=\"" + noti.NOTF_NO + "\">";
					}
					
					var path ="";
					
					if(noti.PHOTO_PATH != null)
					{
						path = "resources/upload/"+noti.PHOTO_PATH;
					}
					else
					{
						path = "./resources/images/profile.png";
					}
					
					switch(noti.EVENT_NO)
					{
						case 0:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th><span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST +"</span>님이 당신을 팔로우 하셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 1:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[여행일지]<span class=\"journal\" journal=\"" + noti.JOURNAL_NO + "\">" + noti.JTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.JOURNAL_NO + "\">" + noti.JCONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;	
						case 2:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[게시글]<span class=\"post\" post=\"" + noti.POST_NO + "\">" + noti.BTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.POST_NO + "\">" + noti.BCONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 3:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[여행일지]<span class=\"journal\" journal=\"" + noti.JCJOURNAL_NO + "\">" + noti.JCTITLE + "</span>에  <span class=\"user\" user=" + noti.NOTF_MEM_NO + ">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.JCJOURNAL_NO + "\">" + noti.JUP_CONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 4:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[게시글]<span class=\"post\" post=\"" + noti.BCPOST_NO + "\">" + noti.BCTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.BCPOST_NO + "\">" + noti.BUP_CONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 5:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.JCCMEM_NO + "\"></th>";
							html +=" 	<th>내 댓글<span class=\"journal\" journal=\"" + noti.CCJOURNAL_NO + "\">" + noti.UPJCONTENTS + "</span>에  <span class=\"user\" user=\"" + noti.JCCMEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.CCJOURNAL_NO + "\">" + noti.DOWNJCONTENTS + "...</span> 답글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 6:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.BCCMEM_NO + "\"></th>";
							html +=" 	<th>내 댓글<span class=\"post\" post=\"" + noti.CCPOST_NO + "\">" + noti.UPBCONTENTS + "</span>에  <span class=\"user\" user=\"" + noti.BCCMEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.CCPOST_NO + "\">" + noti.DOWNBCONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 7:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>관리자가 내가 올린 [문의사항]<span class=\"qna\" qna=\"" + noti.GBN_NO + "\">" + noti.QTITLE + "</span>에 답글을 남기셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 8:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>관리자가 내가 올린 [문의사항]<span class=\"qna\" qna=\"" + noti.GBN_NO + "\">" + noti.QTITLE + "</span>에 답글을 수정 하셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 9:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>내가 작성한 [여행일지]<span class=\"journal\" journal=\"" + noti.GBN_NO + "\">" + noti.LIKE_TITLE + "</span> 를 좋아요 누르셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 10:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>내가 작성한 [게시글]<span class=\"post\" post=\"" + noti.GBN_NO + "\">" + noti.LIKE_TITLE2 + "</span> 를 좋아요 누르셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						default:
							console.log("여긴 뭐넣을까?");
					}
				}
				
				html1 = "<div id=\"notificationTxt\">" + readCnt + "<div>";
				
				$("#cnt").prepend(html1);
				$("#notification tbody").html(html);
			} //makeNotification end
			
			function findBtnPopup()
			{
				var html = "";
				
				html +="<div class=\"popup\">";
				html +="	   <div class=\"popup_entity_txt\">무엇이 필요하십니까?</div>";
				html +="       <div class=\"btn_list\">";
				html +="       		<a href=\"findID\">ID찾기</a>";
				html +="      		<a href=\"findPW\">PW찾기</a>";
				html +="       <img src=\"./resources/images/cancel.png\" id=\"cancelImg\"/>";
				html +="    </div>";
				html +="</div>";
				html +="<div class=\"bg\"></div>";
				
				$("body").append(html);
				
				$("#cancelImg").on("click", function(){ 
					$(".popup").remove();
					$(".bg").remove();
				}); //cancelImg click end
			}//findBtnPopup end
			
			function commonPopup(txt) {
				var html = "";
				                                                          
				html += "<div class=\"popup\">"
		   		html += "<div class=\"popup_entity_txt\">" + txt + "</div>"
		        html += "<div class=\"btn_list\">"
			    html += "<span id=\"ok\">OK</span>"
			    html += "</div>"
				html += "</div>"
				html += "<div class=\"bg\"></div>"
				
				$("body").prepend(html);
				
				$("#ok").on("click", function() {
					$(".popup").remove();
					$(".bg").remove();
				});
			}
			
			function reloadCnt() {
				var params = $("#actionForm").serialize();
				console.log(params);
				console.log("reloadCnt");
				$.ajax({
					
					url: "clientCenterFAQCnt",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						if(res.msg == "success") {
							$("#FAQCnt").val(res.FAQCnt);
							$("#firstCnt").val(res.firstCnt);
							$("#lastCnt").val(res.lastCnt);
							$("#addCnt").val(res.addCnt);
							reloadList();
						} else {
							txt = "오류가 발생했습니다.";
							commonPopup(txt);
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			}
			
			function reloadList() {
				var params = $("#actionForm").serialize();
				console.log(params);
				console.log("reloadList");
				$.ajax({
					url: "clientCenterFAQList",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
							$("#firstCnt").val(res.firstCnt);
							$("#lastCnt").val(res.lastCnt);
							drawFAQList(res.list);
							if($("#FAQCnt").val() < 11 || $("#FAQCnt").val() < $("#firstCnt").val()) {
								$(".more").hide();
								$(".qna_list").css("margin-bottom", "50px");
							}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			}
			
			function drawFAQList(list) {
				var html = "";
				console.log(list);
				for(d of list) {
					html += "<li class=\"qna_data\">"
					html += "<div class=\"question\">"
					html += "<span class=\"qna\">Q</span>"
					html += "<span class=\"entity\">[" + d.FAQ_EVENT_NAME + "] " + d.QUESTION + "</span>"
					html += "<img alt=\"답변\" src=\"./resources/images/under.png\">"
					html += "</div>"
					html += "<div class=\"answer\">"
					html += "<span class=\"qna\">A</span>"
					html += "<span class=\"entity\">" + d.ANSWER + "</span>"
					html += "</div>"
					html += "</li>"
				}
				
				$(".qna_list").append(html);
			}
			
		</script>
	</head>
	<body>
	<form action="#" id="memForm">
		<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
		<input type="hidden" id="page" name="page" value="1"/>
		<input type="hidden" id="GBN" name="GBN" value="1"/>
		<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	</form>
	<form action="#" id="notificationForm">
		<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
	</form>
	<form action="userPage" id="userForm" method="post">
		<input type="hidden" id="userNo" name="userNo" value=""/>
	</form>
	<form action="post" id="postForm" method="post">
		<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
		<input type="hidden" id="postNo" name="postNo" value=""/>
		<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	</form>
		<div id="wrap">
			<!-- header부분 고정 -->
			<div id="header">
				<div class="banner">
					<div class="top">
						<div class="logo_area">
							<a href="#"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
							<div class="site_name">우리들의 여행일지</div>
						</div>
						<div class="btns"> <!-- 밑에 logins와 연동 -->
		                     <ul>
								<li><img alt="bell" src="./resources/images/bell.png" id="notificationPhoto">
									<div id="cnt"></div>
									<div id="notification">
										<table border="1">
											<colgroup>
												<col width="100px">
												<col width="350px">
												<col width="150px">
											</colgroup>
											<tbody>	
		
											</tbody>
		
											<tfoot>
												<tr>
													<th colspan="3" id="notificationMore">...더보기</th>
												</tr>
											</tfoot>
										</table>
									</div></li>
									<li><img alt="bookmark" src="./resources/images/bmk.png" id="bookmarkPhoto"></li>
									<li><img alt="프로필" src="" id="profilePhoto">
										<ul id="profileSlidedown">
											<li id="myPage">마이 페이지</li>
											<li id="timeline">타임라인</li>
											<li id="editProfile">프로필 수정</li>
											<li id="editInfo">회원정보 수정</li>
											<li id="logoutBtn">로그아웃</li>
										</ul>
									</li>
								</ul>
							</div>
		                  <div class="logins">
		                     <div class="sub_login1">
		                     	<form action="#" id="loginForm">
			                        <input type="button" id="loginBtn" value="로그인" />
			                        <input type="password" id="inputPW" name="inputPW" placeholder="PW" />
			                        <input type="text" id="inputID" name="inputID" placeholder="ID" />
		                        </form>
		                     </div>
		                     <div class="sub_login2">
		                        <span id="join">회원가입</span>
		                        <span id="find">ID/PW 찾기</span>
		                     </div>
		                  </div>
					</div>
					<!-- 호버시 메뉴 생성 -->
				</div>
				<nav class="menu">
					<ul>
						<li id="journalBoard">여행게시판</li>
						<li id="community">자유게시판</li>
						<li id="travelWriter">여행작가</li>
						<li id="clientCenter">고객센터</li>
						<li id="admin">내부관리자</li>
					</ul>
				</nav>
				<form action="#" id="goSearch" method="post" >
					<img alt="search" src="./resources/images/search.png" class="search_icon"/>
					<input type="text" class="search" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" placeholder="검색">
					<select class="filter" id="mainSearchFilter" name="mainSearchFilter" >
						<option value="0" selected="selected">통합검색</option>
						<option value="1">여행일지</option>
						<option value="2">해시태그</option>
						<option value="3">자유게시판</option>
						<option value="4">닉네임</option>
					</select>
				</form>
			</div>
			<div id="container">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="journalNo" name="journalNo" value=""/>
					<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
					<input type="hidden" id="FAQCnt" name="FAQCnt" />
					<input type="hidden" id="firstCnt" name="firstCnt" />
					<input type="hidden" id="lastCnt" name="lastCnt" />
					<input type="hidden" id="addCnt" name="addCnt" />
					<input type="hidden" id="sidebarGbn" name="sidebarGbn" value="" />
				<div class="client_center_search">
					<div class="client_center_name">
						<div>고객센터</div>					
					</div>
					<div class="question_search">
						<input type="text" id="searchTxt" name="searchTxt" placeholder="자주 묻는 질문 검색" />
						<div><img alt="검색" src="./resources/images/search.png" id="questionSearchIcon"></div>
					</div>
				</div>
				</form>
				<div class="sidebar">
					<div class="sidebar1" id="question">자주 묻는 질문</div><div class="sidebar2" id="matter">문의사항</div>
					<div class="sidebar3">
						<p>
							고객센터 1577-8253<br/>
							365일, 24시간 운영
						</p>
					</div>
				</div>
				<div class="question_sidebar">
					<ul>
						<li id="sidebarGbn1" value="1">회원서비스</li>
						<li id="sidebarGbn2" value="2">여행/자유게시판</li>
						<li id="sidebarGbn3" value="3">등급/랭킹</li>
						<li id="sidebarGbn4" value="4">신고</li>
					</ul>
				</div>
				<div class="question_area">
					<ul class="qna_list"></ul>
					<div class="more">
						더보기 <img alt="더보기" src="./resources/images/under_y.png">
					</div>
				</div>
			</div> <!-- container end -->
			<div id="footer">
				<p>
					POPJOURNEY<br/>
					GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br/>
					Copyright© POPJOURNEY. All Rights Reserved.
				</p>
			</div>			
		</div>
	</body>
</html>
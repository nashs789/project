<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>여행작가</title>
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
				background-color: #f9f9f9;
			}
			
			/* 여기서부터 헤더 레이아웃 */
			#wrap {
				width: 100%;
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
				height: 100%;
				position: fixed;
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
			.menu ul li a {
				display: inline-block;
				height: 30px;
				text-decoration: none;
				color: white;
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
			input[type='text']:focus, input[type='password']:focus, select:focus {
				outline-color: #fcba03;
			}
			#admin {
				display: none;
			}
			/* 여기까지 헤더 레이아웃 !!! */
			
			#container {
				display: block;
				width: 1280px;
				margin: 0 auto;
				background-color: #f9f9f9;
			}
			.rank_area {
				display: block;
				width: 650px;
				margin: 0px auto;
				padding: 20px;
			}
			.nic_search {
				display: block;
				width: 375px;
				height: 40px;
				font-size: 15pt;
				font-weight: bold;
				margin: 40px 0px 10px 280px;
			}
			.nic_txt {
				position: relative;
				top: -2px;
				width: 200px;
				height: 28px;
				padding: 5px;
				font-size: 10pt;
				border: 1px solid black;
			}
			.nic_btn {
			width: 90px;
				height: 40px;
				background-color: #FFFFFF;
				font-size: 11pt;
				font-weight: bold;
				color: #000000;
				cursor: pointer;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.nic_btn:hover {
				background-color: #2e3459;
				color: #FFFFFF;
			}
			table {
				border-collapse: collapse;
			}
			thead tr {
				background-color: #FFFFFF;
				color: #000000;
				height: 40px;
				border-top: 2px solid #2e3459;
				border-bottom: 1px solid #ccc;
				text-align: center;
			}
			thead tr th {
				padding: 0px 5px;
				font-size: 10pt;
				font-weight: bold;
				text-align: center;
			}
			tbody tr{
				border-bottom: 1px solid #ccc;
				height: 40px;
				text-align: center;
				background-color: #f9f9f9;
				cursor: pointer;
			}
			tbody tr:hover {
				background-color: #FFFFFF;
			}
			tbody tr td {
				font-size: 10pt;
				font-weight: 300;
			}
			.travel_writer_rank {
				display: block;
				width: 650px;
				text-align: center;
			}
			.rank_photo {
				width: 32px;
			}
			.article {
				font-size: 13pt;
			}
			.click_article {
				cursor: pointer;
			}
			.click_article:hover {
				color: #fcba03;
			}
			
			 .paging { 
	            font-size: 0;
	            text-align: center;
	            margin: 40px 0px 60px 0px;
	        }  
	        .paging div {
	            display: inline-block;
	            margin-left: 10px;
	            padding: 5px 10px;
	            border-radius: 20px;
	            font-size: 12pt; 
	            font-weight: bold;
	            text-decoration: none;
	        }   
	        .paging_btn {
	            background-color: none;
	            color: #2e3459;
	            letter-spacing:-5px;
	            font-size: 12pt;
	        }
	        .paging div.num {           
	            color: #2e3459;
	        }
	        .paging div:first-child {
	            margin-left: 0;
	        } 
	        .paging div.num:hover,
	        .paging div.num.on,
	        .paging div.paging_btn:hover  {
	            color: #F1404B;
	            text-decoration: underline;
	            cursor: pointer;
	        }
	        
			.travel_writer_score h4, .travel_writer_score h6 {
				font-size: 10pt;
				font-weight: 600;
				width: 400px;		
				margin: 10px 0px 10px 0px;	
			}
			/* 여기까지 container */
			
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
		</style>
		<script type="text/javascript"
				src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수
				
				//로그인 상태 확인
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
					console.log(params);
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
				
				reloadList();
				
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
						$("#journalForm").submit();
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
				
				$(".logo_photo").on("click", function() {
					location.href = "main";
				});
				
				// 상단배너 -> 여행게시판 - 자유게시판 - 여행작가 - 고객센터 - 내부관리자 메뉴 이동
				$("#journalBoard").on("click", function() {
					location.href = "journalBoard";
				});
				// 상단배너 -> 여행게시판 - 자유게시판 - 여행작가 - 고객센터 - 내부관리자 메뉴 이동
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
				
				// 페이징 처리
				$(".paging").on("click", "div", function() {
					$($("#Pages").val($(this).attr("Pages")));
					$("#searchTxt").val($("#searchTxt").val());
					reloadList();
				});
				
				// 회원프로필 이동
				$("#writerRank").on("click", "tr", function() {
					$("#userNo").val($(this).attr("mno"));
					
					$("#userForm").attr("action", "userPage");
					$("#userForm").submit();
				});
				
				// 검색처리
				$("#searchBtn").on("click", function() {
					$("#Pages").val(1);
					$("#sTxt").val($("#searchTxt").val());
					console.log($("#sTxt").val());
					reloadList();
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
			
			function commonPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열 
			{
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
				}); //yesBtn click end
			}//commonPopup end
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
			
			function reloadList() {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "travelWriterRanks",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						drawList(res.list);
						drawPaging(res.pb);
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			}
			
			function drawList(list) {
				var html = "";
				
				for(d of list) {
					html += "<tr mno=\"" + d.MEM_NO + "\">";
					if(d.RNK == 1) {
						html += "<td><img alt=\"crown\" src=\"./resources/images/Crown.png\" class=\"rank_photo\"></td>";
					} else if(d.RNK == 2) {
						html += "<td><img alt=\"medalsilver\" src=\"./resources/images/medalsilver.png\" class=\"rank_photo\"></td>";
					} else if(d.RNK == 3) {
						html += "<td><img alt=\"medalbronze\" src=\"./resources/images/medalbronze.png\" class=\"rank_photo\"></td>";
					} else {
						html += "<td>" + d.RNK + "</td>";
					}
					html += "<td>" + d.NIC + "</td>";
					html += "<td>" + d.JOURNAL_CNT + "</td>";
					html += "<td>" + d.JOURNAL_LIKE_CNT +"</td>";
					html += "<td>" + d.FOLLOW_CNT +"</td>";
					html += "<td>" + d.SUM + "</td>";
					html += "</tr>";
				}
				
				$("#writerRank").html(html);
			}
			
			function drawPaging(pb) {
				var html = "";
				
				html += "<div class=\"paging_btn\" Pages=\"1\"><<</div>";
				
				if($("#Pages").val() == "1") {
					html += "<div class=\"paging_btn\" Pages=\"1\"><</div>";
				} else {
					html += "<div class=\"paging_btn\" Pages=\"" + ($("#Pages").val() - 1) + "\"><</div>";
				}
				
				for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
					if($("#Pages").val() == i) {
						html += "<div class=\"num on\" Pages=\"" + i + "\">" + i + "</div>";
					} else {
						html += "<div class=\"num\" Pages=\"" + i + "\">" + i + "</div>";
					}
				}
				
				if($("#Pages").val() == pb.maxPcount) {
					html += "<div class=\"paging_btn\" Pages=\"" + pb.maxPcount + "\">></div>";
				} else {
					html += "<div class=\"paging_btn\" Pages=\"" + ($("#Pages").val() * 1 + 1) + "\">></div>";
				}
				
				html += "<div class=\"paging_btn\" Pages=\"" + pb.maxPcount + "\">>></div>";
				
				$(".paging").html(html);
				
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
	<form action="journal" id="journalForm" method="post">
		<input type="hidden" id="journalNo" name="journalNo" value=""/>
	</form>
	<form action="post" id="postForm" method="post">
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
				<!-- 여기서 부터 랭킹 -->
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="Pages" name="Pages" value="${Pages}" />
					<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
					<input type="hidden" id="searchOldTxt" value="${param.searchTxt}" />
					<input type="hidden" id="sTxt" name="sTxt" value="${param.sTxt}" />
				</form>
				<div class="rank_area">
					<div class="nic_search">
						검색 :
						<input class="nic_txt" type="text" id="searchTxt" placeholder="닉네임을 입력하세요."/>
						<input class="nic_btn" type="button" id="searchBtn" value="검색" />
					</div>
					<div class="travel_writer_rank">
						<table>
							<colgroup>
								<col width="80px" /> <!-- 랭킹 -->
								<col width="120px" /> <!-- 닉네임 -->
								<col width="100px" /> <!-- 여행게시판 -->
								<col width="100px" /> <!-- 좋아요 -->
								<col width="100px" /> <!-- 팔로워 -->
								<col width="150px" /> <!-- 여행작가 점수 -->
							</colgroup>
							<thead>
								<tr class="article">
									<th class="click_article">랭킹</th>
									<th>닉네임</th>
									<th class="click_article">여행게시판</th>
									<th class="click_article">좋아요</th>
									<th class="click_article">팔로워</th>
									<th class="click_article">여행작가 점수</th>
								</tr>
							</thead>
							<tbody id="writerRank"></tbody>
						</table>
					</div>
					<div class="travel_writer_score">
						<h4>※ 여행작가 점수 산정 방법</h4>
						<h6>·여행게시판 작성 : 20점  ·좋아요 : 5점  ·팔로워 : 5점</h6>
					</div>
					<div class="paging"></div>
				</div>
			</div>
			<!-- 여기까지 랭킹 갖고온거 -->
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
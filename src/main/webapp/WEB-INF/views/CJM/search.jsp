<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>통합검색</title>
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
			.login {
				float: right;
				width: 100px;
				height: 25px;
				margin-top: 20px;
				margin-left: 5px;
			}
			.login_btn {
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
				cursor: pointer;
			}
			.login_btn:hover{
				background-color: #294a37;
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
			.search_area {
				display: block;
				width: 1240px;
				margin: 0px auto;
				padding: 20px;
			}
			.sub_search {
				display: block;
				margin: 40px auto 5px auto;
				width: 482px; /* 476 */
				height: 40px;
				font-size: 15pt;
				font-weight: bold;
			}
			.search_filter {
				position: relative;
				top: -2px;
				left: 0px;
				width: 100px;
				height: 40px;
			}
			.search_txt {
				position: relative;
				top: -2px;
				width: 200px;
				height: 28px;
				padding: 5px;
				font-size: 10pt;
				border: 1px solid black;
			}
			.search_btn {
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
			.search_btn:hover {
				background-color: #2e3459;
				color: #FFFFFF;
			}
			
			
			
			.line {
				width: 100%;
				height: 5px;
				margin: 30px auto 15px auto;
				border-bottom: 2px solid #2e3459;
			}
			.search_category {
				font-size: 18pt;
				font-weight: bold;
			}
			.search_category_cnt {
				font-size: 12pt;
				font-weight: 600;
				margin: 5px 0px 20px 0px;
			}
			
			/* 여기부터 여행게시판 css*/
			.gallery {
				padding: 30px 0 0 45px;
				display: table;
			}
			.search_post {
				float: left;
				width: 340px;
				height: 390px;
				margin: 0 0 40px 40px;
				border: 1px solid #f1f1f1;
				font-size: 10pt;
				color: black;
				cursor: pointer;
			}
			.search_post:hover {
				box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
			}
			.thumb {
				height: 210px;
				display: block;
				position: relative;
			}
			
			.thumb img {
				width: 292px;
				height: 170px;
				margin: 23px;
			}
			
			.post_info {
				height: 110px;
				position: relative;
				display: inline-block;
				padding: 0 23px 0 23px;
			}
			
			.post_info p:first-child {
				margin-top: 0;
			}
			
			.post_info strong {
				font-size: 12pt;
			}
			
			.post_profile {
				position: absolute;
				width: 317px;
				height: 50px;
				margin: 10px 0 0 23px;
			}
			
			.post_profile img {
				width: 42px;
				height: 42px;
			}
			
			.post_profile>span {
				position: absolute;
				line-height: 42px;
				margin-left: 8px;
			}
			
			.post_profile>div {
				float: right;
				margin-top: 5px;
			}
			
			.post_profile>div>span {
				float: right;
				margin-right: 23px;
			}
			
			.post_profile>div>div {
				margin-right: 23px;
			}
			
			.post_profile>div span {
				margin-top: 5px;
			}
			
			.post_profile>div>div .cnt {
				color: #F1404B;
			}
			/* 여기까지 여행게시판 css*/
			
			
			.more_entity {
				font-size: 12pt;
				font-weight: bold;
				color: #FFFFFF;
				text-align: center;
				background-color: #2e3459;
				margin: 50px 0px 50px 0px;
				width: 100%;
				height: 30px;
				line-height: 30px;
				cursor: pointer;
			}
			.more_entity:hover {
				background-color: #294a37;
			}
			
			
			
		   table {
	         	border-collapse: collapse;
	       } 
			/* 여행꿀팁 */
			.td_t {
				color: #8000ff;
			}
			/* QnA */
			.td_q {
				color: #4d94ff;
			}
			/* 잡담 */
			.td_c {
				 color: #00592d;
			}
	       caption {
	         	display: none;
	       }
	       .board_list {
	         	width: 100%;
	         	border-top: 1px solid #2e3459;
	         	margin-top: 30px;
	       }
	       .board_list_off {
	       		width: 100%;
	         	border-top: 2px solid #2e3459;
	         	margin-top: 30px;
	         	display: none;
	       }
	       .board_list tr {
	         	border-bottom: 1px solid #ccc;
	         	background-color: #FFFFFF;
	       }
	       .board_list th,
	       .board_list td{
	         	padding: 10px;
	         	font-size: 12pt;
	       }
	       .board_list td{
	         	text-align: center;
	       }        
	       .board_list tbody tr {
	       		background-color: #f9f9f9;
	       		cursor: pointer;
	       }
	       .board_list tbody tr:hover {
	       		background-color: #FFFFFF;
	       }
	       .board_list tbody tr td:nth-child(2) {
	          	font-weight:550;
	       }     
	       .board_list tbody tr td:nth-child(3) {
	         	text-align: left;
	       }   
	       .board_list tbody tr td:nth-child(3):hover {
	         	text-decoration: underline;
	       }
	       .board_list > tbody >.notice_board {
	          	font-weight: 550;
	          	background: #faf9f7;
	       } 
	       .board_list > tbody >.notice_board >td:nth-child(2) {
	          	color: red;
	       } 
	       .board_list > tbody >.notice_board >td>span {
	          	padding:5px 10px;
	          	border-radius:5px;
	          	background-color: #2e3459;
	          	color: white; 
	       }
	       .board_list_wrap .paging {
	         	margin-top: 30px; 
	         	font-size: 0;
	         	text-align: center;
	       }  
	       .board_list_wrap .paging a {
	         	display: inline-block;
	         	margin-left: 10px;
	         	padding: 5px 10px;
	         	border-radius: 5px;
	         	font-size: 12pt; 
	       }   
	       .board_list_wrap .paging a.paging_btn {
	         	background-color: none;
	         	color: #2e3459;
	         	letter-spacing:-5px;
	         	font-size: 15pt;
	         	font-weight: bold;
	       }
	       .board_list_wrap .paging a.num {        	
	         	border: 1px solid #2e3459;
	         	background-color: #2e3459;
	         	color: white;
	         	font-weight: bold;
	       }
	       .board_list_wrap .paging a:first-child {
	         	margin-left: 0;
	       } 
	       .board_list_wrap .paging a.num:hover {
	         	border-color:#fcba03;
	         	background-color: #fcba03;
	         	color: #2e3459;
	       }
	       .board_list_wrap .paging a.paging_btn:hover {
	         	color: #fcba03;
	       }
	       .board_list_wrap .paging a.num.on {
	         	border-color:#fcba03;
	         	background-color: #fcba03;
	         	color: #2e3459;
	       }
	       .board_title {
	       		text-align: left;
	       		text-decoration: none;
	       }
			
			
			.search_nic {
				width: 520px;
				margin: 0px auto;
			}
			.search_nic_off {
				width: 520px;
				margin: 0px auto;
				display: none;
			}
			.search_nic table {
				border-collapse: collapse;
			}
			.article {
				color: #000000;
				height: 40px;
				border-top: 2px solid #2e3459;
				border-bottom: 1px solid #ccc;
			}
			.article th {
				padding: 0px 17px;
				font-size: 12pt;
				font-weight: 600;
				background-color: #FFFFFF;
			}
			.click_article {
				cursor: pointer;
			}
			.click_article:hover {
				color: #fcba03;
			}
			.search_nic table > tbody > tr{
				border-bottom: 1px solid #ccc;
				height: 40px;
				text-align: center;
				background-color: #f9f9f9;
			}
			.search_nic table > tbody > tr > td {
				font-size: 10pt;
				font-weight: 300;
			}
			.nic {
				cursor: pointer;
			}
			.nic:hover {
				background-color: #FFFFFF;
			}.popup {
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
				
				// 셀렉터 옵션 유지
				if("${param.mainSearchFilter}" != "") {
					$("#mainSearchFilter").val("${param.mainSearchFilter}");
				}
				$("#mainSearchTxt").val("${param.mainSearchTxt}");
				
				// 검색처리
				$(".search_btn").on("click", function() {
					if($("#mainSearchFilter").val() == 0) {
						reloadList();
					} else if($("#mainSearchFilter").val() == 1) {
						$("#actionForm").attr("action", "searchTravelDiary");
						$("#actionForm").submit();
					} else if($("#mainSearchFilter").val() == 2) {
						$("#actionForm").attr("action", "searchHashtag");
						$("#actionForm").submit();
					} else if($("#mainSearchFilter").val() == 3) {
						$("#actionForm").attr("action", "searchCommunity");
						$("#actionForm").submit();
					} else {
						$("#actionForm").attr("action", "searchNic");
						$("#actionForm").submit();
					}
				});
				
				// 더보기 처리
				$("#journalMore").on("click", function() {
					$("#actionForm").attr("action", "searchTravelDiary");
					$("#actionForm").submit();
				});
				$("#hashMore").on("click", function() {
					$("#actionForm").attr("action", "searchHashtag");
					$("#actionForm").submit();
				});
				$("#boardMore").on("click", function() {
					$("#actionForm").attr("action", "searchCommunity");
					$("#actionForm").submit();
				});
				$("#nicMore").on("click", function() {
					$("#actionForm").attr("action", "searchNic");
					$("#actionForm").submit();
				});
				
				// 여행게시판 이동
				$("#journalGallery").on("click", ".search_post", function() {
					$("#journalNo").val($(this).attr("journalno"));
					
					$("#journalForm").attr("action", "journal");
					$("#journalForm").submit();
				});
				// 여행게시판(해시) 이동
				$("#HashGallery").on("click", ".search_post", function() {
					$("#journalNo").val($(this).attr("journalno"));
					
					$("#journalForm").attr("action", "journal");
					$("#journalForm").submit();
				});
				// 자유게시판 이동
				$(".board_list").on("click", "tr", function() {
					$("#postNo").val($(this).attr("postNo"));
					
					$("#postForm").attr("action", "post");
					$("#postForm").submit();
				});
				// 회원프로필 이동
				$(".search_nic").on("click", "tr", function() {
					$("#userNo").val($(this).attr("memNo"));
					
					$("#userForm").attr("action", "userPage");
					$("#userForm").submit();
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
			function reloadList() {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "searchs",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						if(res.msg = "Filter0") {
							drawList1(res.journalList);
							drawList2(res.hashList);
							drawList3(res.boardList);
							drawList4(res.nicList);
							
							journalCnt(res.journalCnt);
							hashCnt(res.hashCnt);
							boardCnt(res.boardCnt);
							nicCnt(res.nicCnt);
							
							$("#hashTxt").html("");
							$("#hashMore").html("");
							$("#hashTxt").html("#" + res.txt);
							$("#hashMore").html("#" + res.txt + " 더보기");
						} else if(res.msg == "Filter1") {
							
						} else if(res.msg == "Filter2") {
							
						} else if(res.msg == "Filter3") {
							
						} else if(res.msg == "Filter4") {
							
						} else if(res.msg == "failed") {
							alert("검색에 실패했습니다.");
						} else {
							alert("검색중 문제가 발생하였습니다.");
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				}); // ajax end..
			} // reloadList() end..
			function journalCnt(journalCnt) {
				$("#journalCnt").html("");
				var html = "";
				html = journalCnt + "개의 여행게시판이 검색되었습니다.";
				$("#journalCnt").html(html);
				
				$("#journalMore").html("");
				var htmlM = "";
				if(journalCnt > 10) {
					$("#journalMore").show();
					htmlM = "<div class=\"more_entity\" id=\"journalMore\">여행게시판 더보기</div>";
				} else {
					$("#journalMore").hide();
				}
				$("#journalMore").html(htmlM);
			}
			function drawList1(journalList) {
				
				$("#journalGallery").html("");
				var html = "";
				
				for(d of journalList) {
					html += "<div class=\"search_post\" journalNo=\"" + d.JOURNAL_NO + "\">";
					html += "	<span class=\"thumb\"><img alt=\"썸네일\"";
					html += "			src=\"./resources/upload/" + d.JOURNAL_PHOTO_PATH + "\"></span>";
					html += "	<div class=\"post_info\">";
					html += "		<p>";
					html += "			<span>" + d.CATEGORY_NAME + " > " + d.SUB_CATEGORY_NAME + "(" + d.REGION_NAME + ")</span>";
					html += "		</p>";
					html += "		<p>";
					html += "			<strong>" + d.TITLE + "</strong>";
					html += "		</p>";
					html += "		<p>";
					html += "			<em>" + d.HASH + "</em>";
					html += "		</p>";
					html += "	</div>";
					html += "	<div class=\"post_profile\">";
					html += "		<img alt=\"작성자\" src=\"./resources/upload/" + d.MEM_PHOTO_PATH + "\"> <span>" + d.NIC + "</span>";
					html += "		<div>";
					html += "			<div>";
					html += "				<span>조회수</span> <span class=\"cnt\">" + d.HIT + "</span> <span>좋아요</span>";
					html += "				<span class=\"cnt\">" + d.JOURNAL_LIKE_CNT + "</span>";
					html += "			</div>";
					html += "			<span>" + d.JOURNAL_DATE + "</span>";
					html += "		</div>";
					html += "	</div>";
					html += "</div>";
				}
				
				$("#journalGallery").html(html);
				
			} //  function drawList(journalList) end..
			
			function hashCnt(hashCnt) {
				$("#hashCnt").html("");
				var html = "";
				html = hashCnt + "개의 여행게시판이 검색되었습니다.";
				$("#hashCnt").html(html);
				
				$("#hashMore").html("");
				var htmlM = "";
				if(hashCnt > 10) {
					$("#hashMore").show();
					htmlM = "<div class=\"more_entity\" id=\"hashMore\">#" + ${mainSearchTxt} + "더보기</div>";
				} else {
					$("#hashMore").hide();
				}
				$("#hashMore").html(htmlM);
			}
			function drawList2(hashList) {
				
				$("#HashGallery").html("");
				var html = "";
				
				for(d of hashList) {
					html += "<div class=\"search_post\" journalNo=\"" + d.JOURNAL_NO + "\">";
					html += "	<span class=\"thumb\"><img alt=\"썸네일\"";
					html += "			src=\"./resources/upload/" + d.JOURNAL_PHOTO_PATH + "\"></span>";
					html += "	<div class=\"post_info\">";
					html += "		<p>";
					html += "			<span>" + d.CATEGORY_NAME + " > " + d.SUB_CATEGORY_NAME + "(" + d.REGION_NAME + ")</span>";
					html += "		</p>";
					html += "		<p>";
					html += "			<strong>" + d.TITLE + "</strong>";
					html += "		</p>";
					html += "		<p>";
					html += "			<em>" + d.HASH + "</em>";
					html += "		</p>";
					html += "	</div>";
					html += "	<div class=\"post_profile\">";
					html += "		<img alt=\"작성자\" src=\"./resources/upload/" + d.MEM_PHOTO_PATH + "\"> <span>" + d.NIC + "</span>";
					html += "		<div>";
					html += "			<div>";
					html += "				<span>조회수</span> <span class=\"cnt\">" + d.HIT + "</span> <span>좋아요</span>";
					html += "				<span class=\"cnt\">" + d.JOURNAL_LIKE_CNT + "</span>";
					html += "			</div>";
					html += "			<span>" + d.JOURNAL_DATE + "</span>";
					html += "		</div>";
					html += "	</div>";
					html += "</div>";                                                                                    
				}
				
				$("#HashGallery").html(html);
				
			} // function drawList(hashList) end..
			function boardCnt(boardCnt) {
				$("#boardCnt").html("");
				var html = "";
				html = boardCnt + "개의 자유게시글이 검색되었습니다.";
				$("#boardCnt").html(html);
				
				$("#boardMore").html("");
				if(boardCnt > 10) {
					var htmlM = "";
					$(".board_list_off").attr("class", "board_list");
					$("#boardMore").show();
					htmlM = "<div class=\"more_entity\" id=\"boardMore\">자유게시판 더보기</div>";
					$("#boardMore").html(htmlM);
				} else if(0 < boardCnt <= 10) {
					$(".board_list_off").attr("class", "board_list");
					$("#boardMore").hide();
				} else if(boardCnt == 0) {
					$(".board_list").attr("class", "board_list_off");		
					$("#boardMore").hide();
				}
				
			}
			function drawList3(boardList) {
				$("#boardGallery").html("");
				var html = "";
				
				for(d of boardList) {
					html += "<tr class=\"board_data\" postNo=\"" + d.POST_NO + "\">";
	    			html += "<td>" + d.POST_NO + "</td>";
	    			if(d.CATEGORY_NO == 2) {
	    				html += "<td class=\"td_t\">" + d.CATEGORY_NAME + "</td>";
	    			} else if(d.CATEGORY_NO == 3) {
	    				html += "<td class=\"td_q\">" + d.CATEGORY_NAME + "</td>";
	    			} else if(d.CATEGORY_NO == 4){
	    				html += "<td class=\"td_c\">" + d.CATEGORY_NAME + "</td>";
	    			}
	    			html += "<td class=\"board_title\">" + d.TITLE + "</td>";
	    			html += "<td>" + d.GRADE_NAME + "</td>";
	    			html += "<td>" + d.NIC + "</td>";
	    			html += "<td>" + d.BOARD_DATE + "</td>";
	    			html += "<td>" + d.HIT + "</td>";
	    			html += "<td>" + d.POST_LIKE_CNT + "</td>";
	    			html += "</tr>";
				}
				
				$("#boardGallery").html(html);
				
			} // function drawList(boardList) end..
			
			function nicCnt(nicCnt) {
				$("#nicCnt").html("");
				var html = "";
				html = nicCnt + "개의 닉네임이 검색되었습니다.";
				$("#nicCnt").html(html);
				
				$("#nicMore").html("");
				if(nicCnt > 10) {
					var htmlM = "";
					$(".search_nic_off").attr("class", "search_nic");
					$(".search_nic").show();
					$("#nicMore").show();
					htmlM = "<div class=\"more_entity\" id=\"nicMore\">닉네임 더보기</div>";
					$("#nicMore").html(htmlM);
				} else if(0 < nicCnt <= 10) {
					$(".search_nic_off").attr("class", "search_nic");
					$(".search_nic").show();
					$("#nicMore").hide();
				} else if(nicCnt == 0) {
					$(".search_nic").attr("class", "search_nic_off");			
					$("#nicMore").hide();
				}
				
			}
			function drawList4(nicList) {
				$("#nicGallery").html("");
				var html = "";
				
				for(d of nicList) {
					html += "<tr class=\"nic\" memNo=\"" + d.MEM_NO + "\">";
					html += "	<td>" + d.MEM_NO + "</td>";
					html += "	<td>" + d.GRADE_NAME + "</td>";
					html += "	<td>" + d.JOURNAL_CNT + "</td>";
					html += "	<td>" + d.LIKE_SUM + "</td>";
					html += "	<td>" + d.FOLLOW_CNT + "</td>";
					html += "</tr>";
				}
				
				$("#nicGallery").html(html);
				
			} // function drawList(nicList) end..
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
		<input type="hidden" id="memNo" name="memNo" />
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
						<li>여행게시판</li>
						<li id="community">자유게시판</li>
						<li id="travelWriter">여행작가</li>
						<li id="clientCenter">고객센터</li>
						<li id="admin">내부관리자</li>
					</ul>
				</nav>
				<%-- <img alt="search" src="./resources/images/search.png" class="search_icon"/>
				<input type="text" class="search" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" placeholder="검색">
				<select class="filter" id="mainSearchFilter" name="mainSearchFilter">
					<option value="0" selected="selected">통합검색</option>
					<option value="1">여행게시판</option>
					<option value="2">해시태그</option>
					<option value="3">자유게시판</option>
					<option value="4">닉네임</option>
				</select> --%>
			</div>
			<div id="container">
				<form action="#" id="hidden" method="post">
					<input type="hidden" id="sTxt" value="${param.mainSearchTxt}" />
					<input type="hidden" id="sFilter" value="${param.mainSearchFilter}" />
				</form>
				<div class="search_area">
					<form action="#" id="actionForm" method="post">
						<div class="sub_search">
							검색 :
							<select class="search_filter" id="mainSearchFilter" name="mainSearchFilter">
									<option value="0" selected="selected">통합검색</option>
									<option value="1">여행게시판</option>
									<option value="2">해시태그</option>
									<option value="3">자유게시판</option>
									<option value="4">닉네임</option>
							</select>
							<input class="search_txt" type="text" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" />
							<input class="search_btn" type="button" value="검색" />
						</div>
					</form>
					<div class="line"></div>
					<div class="search_category">여행게시판</div>
					<div class="search_category_cnt" id="journalCnt">${journalCnt}개의 여행게시판이 검색되었습니다.</div>
					<!-- 여행게시판 검색결과 시작 -->
					<div class="gallery" id="journalGallery">
						<c:choose>
							<c:when test="${journalCnt > 0}">
								<c:forEach var="data" items="${journalList}">
									<div class="search_post" journalNo="${data.JOURNAL_NO}">
										<span class="thumb"><img alt="썸네일"
												src="./resources/upload/${data.JOURNAL_PHOTO_PATH}"></span>
										<div class="post_info">
											<p>
												<span>${data.CATEGORY_NAME} > ${data.SUB_CATEGORY_NAME}(${data.REGION_NAME})</span>
											</p>
											<p>
												<strong>${data.TITLE}</strong>
											</p>
											<p>
												<em>${data.HASH}</em>
											</p>
										</div>
										<div class="post_profile">
											<c:choose>
												<c:when test="${!empty data.MEM_PHOTO_PATH}">
													<img alt="작성자" src="./resources/upload/${data.MEM_PHOTO_PATH}"> <span>${data.NIC}</span>
												</c:when>
												<c:otherwise>
													<img alt="작성자" src="./resources/images/profile3.png"> <span>${data.NIC}</span>
												</c:otherwise>
											</c:choose>
											<div>
												<div>
													<span>조회수</span> <span class="cnt">${data.HIT}</span> <span>좋아요</span>
													<span class="cnt">${data.JOURNAL_LIKE_CNT}</span>
												</div>
												<span>${data.JOURNAL_DATE}</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${journalCnt > 10}">
							<div class="more_entity" id="journalMore">여행게시판 더보기</div>
						</c:when>
					</c:choose>
					<!-- 여행게시판 검색결과 끝  -->
					<!-- 해시태그 검색결과 시작 -->	
					<div class="line"></div>		
					<div class="search_category" id="hashTxt">#${param.mainSearchTxt}</div>
					<div class="search_category_cnt" id="hashCnt">${hashCnt}개의 여행게시판이 검색되었습니다.</div>
					<div class="gallery" id="HashGallery">
						<c:choose>
							<c:when test="${hashCnt > 0}">
								<c:forEach var="data" items="${hashList}">
									<div class="search_post" journalno="${data.JOURNAL_NO}">
										<span class="thumb"><img alt="썸네일"
												src="./resources/upload/${data.JOURNAL_PHOTO_PATH}"></span>
										<div class="post_info">
											<p>
												<span>${data.CATEGORY_NAME} > ${data.SUB_CATEGORY_NAME}(${data.REGION_NAME})</span>
											</p>
											<p>
												<strong>${data.TITLE}</strong>
											</p>
											<p>
												<em>${data.HASH}</em>
											</p>
										</div>
										<div class="post_profile">
											<c:choose>
												<c:when test="${!empty data.MEM_PHOTO_PATH}">
													<img alt="작성자" src="./resources/upload/${data.MEM_PHOTO_PATH}"> <span>${data.NIC}</span>
												</c:when>
												<c:otherwise>
													<img alt="작성자" src="./resources/images/profile3.png"> <span>${data.NIC}</span>
												</c:otherwise>
											</c:choose>
											<div>
												<div>
													<span>조회수</span> <span class="cnt">${data.HIT}</span> <span>좋아요</span>
													<span class="cnt">${data.JOURNAL_LIKE_CNT}</span>
												</div>
												<span>${data.JOURNAL_DATE}</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${hashCnt > 10}">
							<div class="more_entity" id="hashMore">#${param.mainSearchTxt} 더보기</div>				
						</c:when>
					</c:choose>
					<!-- 해시태그 검색결과 끝 -->	
						
					<!-- 자유게시판 검색결과 시작 -->	
					<div class="line"></div>
					<div class="search_category">자유게시판</div>
					<div class="search_category_cnt" id="boardCnt">${boardCnt}개의 자유게시글이 검색되었습니다.</div>
					<c:choose>
						<c:when test="${boardCnt > 0}">
							<table class="board_list">
			            		<caption>게시판 목록</caption>
			            		<colgroup>
										<col width="106px" /> <!-- 글번호 -->
										<col width="124px" /> <!-- 카테고리 -->
										<col width="430px" /> <!-- 제목 -->
										<col width="124px" /> <!-- 등급 -->
										<col width="101px" /> <!-- 닉네임 -->
										<col width="161px" /> <!-- 작성일 -->
										<col width="92px" /> <!-- 조회 -->
										<col width="102px" /> <!-- 좋아요 -->
								</colgroup>
			            		<thead>
			            			<tr>
			            				<th>글번호</th>
			            				<th>카테고리</th>
			            				<th>제목</th>
			            				<th>등급</th>
			            				<th>닉네임</th>
			            				<th>작성일</th>
			            				<th>조회</th>
			            				<th>좋아요</th>
			            			</tr>
			            		</thead>
			            		<tbody id="boardGallery">
			            			<c:forEach var="data" items="${boardList}">
				            			<tr class="board_data" postNo="${data.POST_NO}">
				            				<td>${data.POST_NO}</td>
				            				<td>${data.CATEGORY_NAME}</td>
				            				<td class="board_title">${data.TITLE}</td>
				            				<td>${data.GRADE_NAME}</td>
				            				<td>${data.NIC}</td>
				            				<td>${data.BOARD_DATE}</td>
				            				<td>${data.HIT}</td>
				            				<td>${data.POST_LIKE_CNT}</td>
				            			</tr>
			            			</c:forEach>
			            		</tbody>
		            		</table>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${boardCnt > 10}">
		            		<div class="more_entity" id="boardMore">자유게시판 더보기</div>					
						</c:when>
					</c:choose>
					<!-- 자유게시판 검색결과 끝 -->		
					
					<!-- 닉네임 검색결과 시작 -->		
					<div class="line"></div>		
					<div class="search_category">닉네임</div>
					<div class="search_category_cnt" id="nicCnt">${nicCnt}개의 닉네임이 검색되었습니다.</div>
					<c:choose>
						<c:when test="${nicCnt > 0}">
							<div class="search_nic">
								<table>
									<colgroup>
										<col width="120px" /> <!-- 닉네임 -->
										<col width="100px" /> <!-- 등급 -->
										<col width="120px" /> <!-- 여행게시판 -->
										<col width="100px" /> <!-- 좋아요 -->
										<col width="100px" /> <!-- 팔로워 -->
									</colgroup>
									<thead>
										<tr class="article">
											<th>닉네임</th>
											<th>등급</th>
											<th>여행게시판</th>
											<th>좋아요</th>
											<th>팔로워</th>
										</tr>
									</thead>
									<tbody id="nicGallery">
										<c:forEach var="data" items="${nicList}">
											<tr class="nic" memNo="${data.MEM_NO}">
												<td>${data.NIC}</td>
												<td>${data.GRADE_NAME}</td>
												<td>${data.JOURNAL_CNT}</td>
												<td>${data.LIKE_SUM}</td>
												<td>${data.FOLLOW_CNT}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${nicCnt > 10}">
							<div class="more_entity" id="nicMore">닉네임 더보기</div>
						</c:when>
					</c:choose>
					<!-- 닉네임 검색결과 끝 -->		
				</div> <!-- search area end -->
			</div>
			
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
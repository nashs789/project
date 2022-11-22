
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,
							   maximum-scale=1.0, user-scalable=no" />
<title>마이페이지</title>
<style type="text/css">
/* #fcba03 노랑
   #2e3459 남색
   #f37321 주황
   #294a37 초록
*/
body {
	margin: 0px;
	font-size: 10pt;
	font-family: 'Black Han Sans', sans-serif;
}
#wrap {
	width: 100%;
	height: 100%;
	background-color: #FFFFFF;
}
#header {
	width: 100%;
	height: 7vh;
	position: relative;
	padding-top: 18px;
}
.logo_photo {
	display: block;
	width: 80vw;
	height: 5vh;
	margin: 0 auto;
}
input[type='text']:focus, input[type='password']:focus, select:focus {
	outline-color: #fcba03;
}
#container {
	display: block;
	width: 100%;
	margin: 0 auto;
}

.sub_profile {
	z-index: 100;
	width: 100%;
	height: 35vh;
	background-color: #fcba03;
}
.info {
	position: relative;
	z-index: 1;
	width: 100%;
	padding-top: 3vh;
	text-align: center;
	font-size: 1.5em;
	font-weight: bold;
	color: #2e3459;
}
.info img {
	border-radius: 50%;
	width: 150px;
	height: 150px;
}
.board_menu {
	width: 100%;
	height: 8vh;
	border-bottom: 2px solid #2e3459;
	background-color: #2e3459;
}
.board_menu div {
	text-align: center;
	height: 100%;
	line-height: 8.2vh;
}
.board_menu div span {
	font-size: 1.5em;
	color: #FFFFFF;
	font-weight: 600;
}

.board_list_wrap {
	margin: 0;
	padding: 0;
	font-weight: 500;
}
a {
	text-decoration: none;
	color: inherit;
}
.board_list {
	width: 100%;
	border-top: 2px solid #2e3459;
}
#path_info {
	height: 4vh;
	font-size: 1em;
	padding-top: 1vh;
	padding-left: 5vw;
	margin-bottom: 3vh;
}
#path_info {
	text-decoration: none;
	color: black;
}
.home_icon {
	position: relative;
	top: 3px;
	width: 20px;
	height: 20px;
}
#post {
	float: left;
	width: 90vw;
	height: 47vh;
	margin: 0 5vw 3vh 5vw;
	border: 1px solid #f1f1f1;
	font-size: 1em;
	color: black;
}
.thumb {
	height: 26vh;
	display: block;
	position: relative;
}
.thumb img {
	width: 77.6vw;
	height: 21vh;
	margin: 6.78%;
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
	font-size: 1.2em;
}
#post_profile {
	position: absolute;
	width: 317px;
	height: 50px;
	margin: 10px 0 0 23px;
}
.post_profile img {
	visibility: hidden;
	width: 42px;
	height: 42px;
}
.post_profile>span {
	visibility: hidden;
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
	margin-top: 0.5em;
}
.post_profile>div>div .cnt {
	color: #F1404B;
}
.paging_wrap {
	font-size: 1.3em;
	display: inline-block;
	width: 100%;
	padding-bottom: 3vh;
	text-align: center;
}
.paging_wrap div {
	display: inline-block;
	padding: 5px;
	margin-left: 3px;
	margin-right: 3px;
	background-color: #e6f2ff;
	border: 0px;
	border-radius: 5px;
	cursor: pointer;
	width: 10vw;
	height: 3.5vh;
	text-align: center;
	font-weight: bold;
	padding: 14px 5px 8px 5px;
}
.paging_wrap div:active {
	background-color: #0047ab;
	color: #FFFFFF;
}
.paging_wrap .on {
	background-color: #AACCFF;
	color: #FFFFFF;
}
#footer {
	display: block;
	width: 100%;
	height: 100px;
	background-color: #2e3459;
	color: #FFFFFF;
	font-size: 1em;
}
#footer p {
	margin: 0px auto;
	padding-top: 2.4vh;
	width: 85%;
	height: 80px;
}
#admin{
	display: none;	
}
#intro{
	font-size: 0.8em;
}
#point{
	font-size: 0.8em;
}
input[type='button']{
	padding: 4px 0px;
	background-color: white;
	border: 2px solid #2e3459;
	border-radius: 20px;
	height: 4vh;
	cursor: pointer;
	width: 20vw;
	margin-left: 10px;
	box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
	font-weight: bold;
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
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var path = "";
	var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수

 	var params = $("#memForm").serialize();

	$.ajax({
		url: "CJMMyPageJournals",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			if(result.msg == "success")
			{
				makeGallery(result.myPage);
				makePage(result.pb);
			}
			else
			{
				popupText = "오류가 발생했습니다.";
				commonPopup(popupText);
			}
		},//success end
		error: function(error){
			console.log(error);
		}//error end
	}); //ajax end 
	
	params = $("#memForm").serialize();

	$.ajax({
		url: "CJMCheckPoints",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result)
		{
			$("#point").val(result.data.TOTAL_POINT);
			
			if(result.msg == "success")
			{
				var html = "";
				
				if("${sPHOTO_PATH}" != "")
				{
					path = "resources/upload/" + "${sPHOTO_PATH}";
					html += "<img alt=\"profile\" src=\"" + path + "\"class=\"profile_img\">";
				}
				else
				{
					path = "./resources/images/profile3.png";
					html += "<img alt=\"profile\" src=\"" + path + "\"class=\"profile_img\">";
				}
				
				html += "<div>${sNIC}";
				if("${sGRADE_NO}" == "0")
				{
					html += "[관리자]";
				}
				else if("${sGRADE_NO}" == "1")
				{
					html += "[여행꾼]";
				}
				else
				{
					html += "[여행작가]";
				}
				
				html +="</div>";
				html += "<div id=\"intro\">${sINTRO}</div>";
				html += "<sapn id=\"point\">여행점수: " + result.data.TOTAL_POINT + "  <input type=\"button\" id=\"logoutBtn\" value=\"로그아웃\"/></span>";
				
				$(".info").html(html);
				
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
	
	$(".paging_wrap").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		
		var params = $("#memForm").serialize();
		
		$.ajax({
			url: "CJMMyPageJournals",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				if(result.msg == "success")
				{
					makeGallery(result.myPage);
					makePage(result.pb);
					$("html").scrollTop(300);
				}
				else
				{
					popupText = "오류가 발생했습니다.";
					commonPopup(popupText);
				}
			},//success end
			error: function(error){
				console.log(error);
			}//error end
		}); //ajax end 
	}); //paging_wrap click end
	
  	$("#wrap").on("click", "#logoutBtn", function(){
		$.ajax({
			url: "CJMLogouts",
			type: "post",
			dataType: "json",
			success: function(result) {
				location.href ="CJMLogin";
			},
			error: function(request, status, error) {
				console.log(error);
			}
		});
  	});
}); //document ready end
function makeGallery(myPage)
{
	var html = "";
	
	for(data of myPage)
	{ 
		html += "   <div id=\"post\">";
		html += "   <span class=\"thumb\" thumb=\"" + data.JOURNAL_NO + "\"><img alt=\"썸네일\" src=\"resources/upload/" + data.PHOTO_PATH + "\"></span>";
		html += "   	<div class=\"post_info\">";
		html += "   		<p>";
		html += "   			<span>" + data.CATEGORY + " > " + data.SUB_CATEGORY + "(" + data.REGION + ") </span>";
		html += "   		</p>";
		html += "   		<p>";
		html += "   			<strong class=\"journal\" journal=\"" + data.JOURNAL_NO + "\">" + data.TITLE + "</strong>";
		html += "   		</p>";
		html += "   		<p>";
		html += "   			<em>";
		if(data.PATH != null)
		{
			var hashTag = data.PATH;
			var arr =[];
			arr = hashTag.split(",");
			
			if(arr.length != 0)
			{
				for(var i = 0; i < arr.length; i++)
				{
					 html += "#" + arr[i]+ " "; 
				}
			}
		}
		html += "</em>"; 
		html += "   		</p>";
		html += "   	</div>";
		html += "   	<div class=\"post_profile\">";
		html += "   		<div>";
		html += "   			<div>";
		html += "   				<span>조회수</span> <span class=\"cnt\">" + data.HIT + "</span>";
		html += "   				<span>좋아요</span> <span class=\"cnt\">" + data.LIKE_CNT + "</span>";
		html += "   			</div>";
		html += "   			<span>" + data.JOURNAL_DATE + "</span>";
		html += "   		</div>";
		html += "   	</div>";
		html += "   </div>";
	}
	$(".gallery").html(html);
}
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
function makePage(pb) {
	
var html = "";
	
	if($("#page").val() == "1") {
		html += "<div name=\"1\">이전</div>";
	} else {
		html += "<div name=\"" + ($("#page").val() - 1) + "\">이전</div>";
	}
	
	html += "<div><b>" + $("#page").val() + "</b></div>";
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div name=\"" + pb.maxPcount + "\">다음</div>";
	} else {
		html += "<div name=\"" + ($("#page").val() * 1 + 1) + "\">다음</div>";
	}
	
	$(".paging_wrap").html(html);
}
</script>
</head>
<body>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="grade" name="grade" value="${sGRADE_NO}"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="point" name="point"/>
</form>
	<div id="wrap">
		<div id="header">
			<img alt="로고" src="./resources/images/logo.png" class="logo_photo">
		</div>
		<div class="sub_profile">
			<div class="info"></div>
		</div>
		<div id="container">
			<div class="board_list_wrap">
				<div class="board_menu">
					<div>
						<span>여행일지 ${sJOURNAL}</span>
						<span>팔로워 ${sFOLLOWER}</span>
						<span>팔로잉 ${sFOLLOWING}</span>
					</div>
				</div> <!-- board_menu end -->
				<div id="path_info">
					<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
					</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 마이페이지 </span>
					&nbsp;&nbsp;>&nbsp;&nbsp; <span> 여행일지 </span>
					&nbsp;>&nbsp;&nbsp;썸네일
				</div> <!-- path_info end -->
				<div class="gallery"></div>
				<div class="paging_wrap"></div>
			</div> <!-- board_list_wrap end -->
		</div>
	</div>
	<div id="footer">
		<p>
			POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
			Copyright© POPJOURNEY. All Rights Reserved.
		</p>
	</div>
</body>
</html>
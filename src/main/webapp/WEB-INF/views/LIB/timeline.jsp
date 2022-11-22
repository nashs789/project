<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  box-sizing: border-box;
}
body {
   margin: 0px;      
   min-width: 1480px;
   background-color: #f9f9f9;
}
#wrap {
   width: 100%;
}
#header {
   width: 100%;
   height: 140px;
   background-color: #2e3459;
   position: relative;
   font-size: 0px;
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
   position: absolute; 
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
    display: inline-block;
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
#profilePhoto {
   height: 40px;
   width: 40px;
   margin-right: 20px;
   margin-top: 15px;
   cursor: pointer;
   border-radius: 50%;
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
#notificationPhoto {
   margin-left: 200px;
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
#timeline{
	background-color: #f37321;
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
#admin{
	display:none;
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
#container{
	width: 1280px;
	margin: 0px auto;
    background-color: #474e5d;
  	font-family: Helvetica, sans-serif;
}
#cityName{ 
	display: inline-block;
	width: 680px;
	text-align: center;
	font-size: 18pt;
	font-weight: bold;
	margin-top: 30px;
}
/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: white;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background-color: white;
  border: 4px solid #FF9F55;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid white;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent white;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.content {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
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
   width: 800px;
   height: 80px;
}
.space{
	height: 50px;
	width: 630px;
	margin: 0px auto;
	background-color: #474e5d;
	color: white;
	font-family: cursive;
	font-size: 18pt;
	text-align: center;
	text-shadow: 1px 1px 1px white;
	padding: 5px;
}

.date_area{
	text-align: left;
	font-size: 16pt;
	font-weight: bold;
}
.img_area{
	display:inline-block;
	vertical-align: top;
	height: 150px;
	width: 460px;
	margin-top: 10px;
	display: block;
	box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
}
.fisrt{
	display:inline-block;
	vertical-align: top;
	wdith: 200px;
}
.last{
	display:inline-block;
	vertical-align: top;
	width: 260px;
}
.timeline img{
	display:inline-block;
	vertical-align: top;
	height: 150px;
	width: 170px;
}
.txt_area{
	height: 30px;
	width: 100%;
	margin: 5px 0px 0px 0px;
}
.timeline span, .timeline img{
	cursor: pointer;
    font-weight: bold;
}
.timeline span:hover{
	text-decoration: underline;
	color: blue;
}
#upIcon{
	width: 50px;
	height: 50px;
	cursor: pointer;
	position: fixed;
    bottom: 100px;
    right: 20px;
}
#downIcon{
	width: 50px;
	height: 50px;
	cursor: pointer;
	position: fixed;
    bottom: 20px;
    right: 20px;
}
.popup {
   width: 300px;
   height: 450px;
   background-color: #fcfcfc;
   box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
   z-index: 500;
   font-size: 16pt;
   border-radius: 10px;
   font-size: 0px;
   border: 0px;
   position: fixed;
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
#miniPhoto{
	width: 100%;
	height: 150px;
	box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0; 
}
#miniPhoto img{
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-top: 25px;
}
#miniNic{
	width: 250px;
	height: 50px;
	margin: 0px auto;
}
/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
  left: 31px;
  }
  
  /* Full-width containers */
  .container {
  width: 100%;
  padding-left: 70px;
  padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .container::before {
  left: 60px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
  left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .right {
  left: 0%;
  }
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"/></script>
<script type="text/javascript">
$(document).ready(function(){
	
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
				alert("오류가 발생했습니다.");
			}
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end 

	params = $("#memForm").serialize();
	var flag = 1;
	
	$.ajax({
		url: "timelinePageCnts",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			if(result.msg == "success")
			{
				$("#pageCnt").val(result.pageCnt);

				var params = $("#memForm").serialize();
				
				$.ajax({
					url: "timelines",
					data: params,
					dataType: "json",
					type: "post",
					success: function(result){
						if(result.msg == "success")
						{
							$("#firstPage").val(result.firstPage);
							$("#lastPage").val(result.lastPage);
							makeTimeline(result.timeline);
						}
						//result.msg에 실패시 failed 에러시 error들어가 있음
					}, //success end
					error: function(error){
						console.log(error);
					} //error end
				}); // ajax end
			} // if end
			//result.msg에 실패시 failed 에러시 error들어가 있음
		}, //success end
		error: function(error){
			console.log(error);
		} //error end
	}); // ajax end
	
	$("#upIcon").on("click", function(){
		$("html").scrollTop(0);
	}); //upIcon click end
	
	$("#downIcon").on("click", function(){
		$("html").scrollTop($(document).height());
	}); //upIcon click end
	
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
	
	$("#notificationPhoto").on("click", function(){
		$("#profileSlidedown").css("display", "none");
		if($("#notification").css("display") == "block")
		{
			$("#notification").css("display", "none");
		}
		else
		{
			$("#notification").css("display", "block");
		}
	}); //notificationPhoto click end
	
	$(".timeline").on("click", "span, img", function(){
		if($(this).attr("class") == "journal")
		{
			$("#journalNo").val($(this).attr($(this).attr("class")));
			$("#journalForm").submit();
		}
		else if($(this).attr("class") == "nic")
		{
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		}
		else if($(this).attr("class") == "post")
		{
			$("#postNo").val($(this).attr($(this).attr("class")));
			$("#postForm").submit();
		}
	}); //timeline span click end 
	
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
	
	$(".timeline").on("mouseover", ".nic", function(){
		var x = event.clientX;
	    var y = event.clientY; 
	    
		$("#memNo").val($(this).attr($(this).attr("class")));
		var params = $("#memNoForm").serialize();
		
		$.ajax({
			url:"miniProfiles",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				if(result.msg == "success")
				{
					makeProfilePopup(result.mini, x, y);
				}
				else
				{
					alert("정보가 없습니다");
				}
			}, //success end
			error: function(error){
				console.log(error);
			} //error end
		}); //ajax end
	}); //timeline nic mouseover end
	
	$(".timeline").on("mouseout", ".nic", function(){
		$(".popup").remove();
	}); //timeline nic mouseout end

	$(window).on("scroll", function(){
	    var $window = $(this);
	    var scroll = $window.scrollTop();
	    var wheigth = $window.height();
	    var dheight = $(document).height();
	   
        if(scroll + wheigth + 200 > dheight && flag == 1)
        {
        	flag--;
        	var params = $("#memForm").serialize();
        	
        	$.ajax({
        		url: "timelines",
        		data: params,
        		dataType: "json",
        		type: "post",
        		success: function(result){
        			if(result.msg == "success")
        			{
        				$("#firstPage").val(result.firstPage);
        				$("#lastPage").val(result.lastPage);
        				makeTimeline(result.timeline);
        				flag ++;
        			}
        			else if(result.msg == "full")
        			{
        				alert("마지막 입니다");
        			}
        			//result.msg에 실패시 failed 에러시 error들어가 있음
        		}, //success end
        		error: function(error){
        			console.log(error);
        		} //error end
        	}); // ajax end
        } //if end
	}); // window scroll end
    $("#journalBoard").on("click", function(){
    	location.href = "journalBoard";
    });//postBoard click end
    
    $("#community").on("click", function(){
    	location.href = "community";
    });//community click end
  
   	$("#travelWriter").on("click", function() {
  		location.href = "travelWriterRank";
  	}); //travelWriter click end
   	
	$("#clientCenter").on("click", function() {
  		location.href = "clientCenterQuestion";
  	}); //clientCenter click end
	
  	$("#admin").on("click", function() {
  		location.href = "memAdmin";
  	}); //admin click end
  	
  	$("#myPage").on("click", function(){
  		location.href = "myPage";
	}); //find click endmyPage
  	
  	$("#editProfile").on("click", function(){
  		location.href = "editProfile";
  	}); //editProfile click end
  	
	$("#editInfo").on("click", function(){
		location.href = "editInfo";
  	}); //editInfo click end
	
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
  	
 	// 메인검색창 넘어가는 부분
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
});//document ready end 
function makeTimeline(timeline)
{
	var flag = 1;
	var html = "";

	for(time of timeline)
	{
		if(flag == 1)
		{
			html += " <div class=\"container left\">";
			flag--;
		}
		else
		{
			html += " <div class=\"container right\">";
			flag++;
		}
		
		html += "   <div class=\"content\">";
		html += "     <div class=\"date_area\">" + time.YEAR + time.MONTH + time.DAY + "("+time.CHA_DATE +")"+ "</div>";
	 	html += "     <div class=\"contents_area\">";
		html += "     	<div class=\"img_area\">";
		html += "     		<div class=\"first\" style=\"display: inline-block\">";
		
		switch(time.GBN)
		{
		case 0:
		 	html += "     			<img class=\"post\" post=\"" + time.POST_NO + "\" src=\"./resources/images/board.jpg\">";
			html += "     		</div>";
			html += "     		<div class=\"last\">";
			html += "     			<span class=\"post\" post=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
			html += "               <span class=\"post\" post=\"" + time.POST_NO + "\">" + time.CONTENTS + "</span>"
			html += "     		</div>";
			html += "     	</div>";
			html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 게시물을 포스트 하셨습니다. </div>";  
			break;
		case 1:
			if(time.THUMB_PHOTO_PATH != null)
			{
				html += "     			<img class=\"journal\" journal=\"" + time.POST_NO + "\" src=\"resources/upload/" + time.THUMB_PHOTO_PATH + "\">";
			}
			else
			{
				html += "     			<img class=\"journal\" journal=\"" + time.POST_NO + "\" src=\"./resources/images/switzerland.jpg\">";
			}
			html += "     		</div>";
			html += "     		<div class=\"last\">";
			html += "     			<span class=\"journal\" journal=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
			html += "               <span class=\"journal\" journal=\"" + time.POST_NO + "\">" + time.CONTENTS + "</span>"
			html += "     		</div>";
			html += "     	</div>";
			html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 여행 일지를 포스트 하셨습니다. </div>";  
			break;
		case 2:
		 	html += "     			<img class=\"post\" post=\"" + time.POST_NO + "\" src=\"./resources/images/board.jpg\">";
			html += "     		</div>";
			html += "     		<div class=\"last\">";
			html += "     			<span class=\"post\" post=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
			html += "               [댓글]<span class=\"post\" post=\"" + time.POST_NO + "\"> " + time.CONTENTS + "</span> 라고 남기셨습니다."
			html += "     		</div>";
			html += "     	</div>";
			html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 게시물에 댓글을 남기셨습니다. </div>";  
			break;
		case 3:
			html += "     			<img class=\"journal\" journal=\"" + time.POST_NO + "\" src=\"./resources/images/switzerland.jpg\">";
			html += "     		</div>";
			html += "     		<div class=\"last\">";
			html += "     			<span class=\"journal\" journal=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
			html += "               [댓글]<span class=\"journal\" journal=\"" + time.POST_NO + "\"> " + time.CONTENTS + "</span> 라고 남기셨습니다."
			html += "     		</div>";
			html += "     	</div>";
			html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 여행 일지에 댓글을 남기셨습니다. </div>";
			break;
		case 4:
			html += "     			<img src=\"./resources/images/birthday.jpg\">";
			html += "     		</div>";
			html += "     		<div class=\"last\">";
			html += "     			<span></span><br>";
			html += "               <span></span>"
			html += "     		</div>";
			html += "     	</div>";
			html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님의 생일 이였습니다. </div>";
			break;
		case 5:
			html += "     			<img class=\"nic\" nic=\"" + time.MEM_NO + "\" src=\"resources/upload/" + time.PHOTO_PATH + "\">";
			html += "     		</div>";
			html += "     		<div class=\"last\">";
			html += "     			<span></span><br><br>";
			html += "               <span></span>"
			html += "     		</div>";
			html += "     	</div>";
			html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 여행 작가가 되셨습니다. </div>";
			break;
		default:
			console.log("흠");
		}
			
		html += "     </div>";
		html += "   </div>";
		html += " </div>";
	} // for문  end

	$(".timeline").append(html);
}
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
}
function makeProfilePopup(mini, x, y)
{
	var html = "";
	
	html += "	<div class=\"popup\">";
	html += "	<div class=\"popup_entity_txt\">";
	html += "		<div id=\"miniPhoto\"><img src=\"resources/upload/" + mini.PHOTO_PATH + "\"></div>";
	html += "		<div id=\"miniNic\">" + mini.NIC + " (" + mini.GRADE_NAME + ")</div>";
	html += "		<table>";
	html += "			<colgroup>";
	html += "				<col width=\"150px\">";
	html += "				<col width=\"150px\">";
	html += "			</colgroup>";
	html += "			<tbody>";
	html += "				<tr>";
	html += "					<td>방문일수</td>";
	html += "					<td>" + mini.ACC_CNT + "</td>";
	html += "				</tr>";
	html += "				<tr>";
	html += "					<td>팔로워</td>";
	html += "					<td>" + mini.FOLLOWER_CNT + "</td>";
	html += "				</tr>";
	html += "				<tr>";
	html += "					<td>게시글</td>";
	html += "					<td>" + mini.POST_CNT + "</td>";
	html += "				</tr>";
	html += "				<tr>";
	html += "					<td>여행일지</td>";
	html += "					<td>" + mini.JOURNAL_CNT + "</td>";
	html += "				</tr>";
	html += "			</tbody>";
	html += "		</table>";
	html += "	</div>";
	html += "</div>";
	
	$("body").append(html);
	
 	if(y < 330)
	{
		$(".popup").css("top", y);
	}
	else if(y >= 330 && y <= 415)
	{
		y-= 200;
		$(".popup").css("top", y);
	}
	else
	{
		y-= 445;
		$(".popup").css("top", y);
	}
	
	$(".popup").css("left", x);
}                                                                  
</script>
</head>
<body>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	<input type="hidden" id="lastPage" name="lastPage" value="10"/>
	<input type="hidden" id="pageCnt" name="pageCnt" value=""/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="page" name="page" value="${page}"/>
</form>
<form action="#" id="memNoForm">
	<input type="hidden" id="memNo" name="memNo"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>
	<div id="wrap">
         <!-- header부분 고정 -->
         <div id="header">
            <div class="banner">
               <div class="top">
                  <div class="logo_area">
                     <a href="main"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
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
							<li><img alt="프로필" src="./resources/images/profile.png" id="profilePhoto">
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
               </div>
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
         </div> <!-- header end -->

		<div id="container">
			<div class="space">[ T I M E L I N E ]</div>
			<div class="timeline">

			</div> <!-- timeline end -->
			<div class="space">[ E N D ]</div>
		</div> <!-- container end -->
		<img src="./resources/images/up.png" id="upIcon">
		<img src="./resources/images/down.png" id="downIcon">
		<div id="footer">
            <p>
               POPJOURNEY<br/>
               GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br/>
               Copyright© POPJOURNEY. All Rights Reserved.
            </p>   
        </div> 
	</div> <!-- wrap end -->
</body>
</html>
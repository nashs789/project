<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다른 사용자</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ500Css/PJ507C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ500Js/PJ507S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if($("#loginMem").val() == $("#MEM_NO").val()) {
		location.href = "myPage";
	}
	
	if($("#mem").val() == 1) {
		history.back();
	}
	
	
	if("${sMEM_NO}" != "") {
		
		var params = $("#memForm").serialize();

		$.ajax({
			url: "followStatus",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				var html = "";
				
				if(result.msg == "success")  {
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "checkPoints",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result) {
							if(result.msg == "success") {
								var html = "";
								html +="<li><img alt=\"follow\" id=\"following\" src=\"static/images/follower.png\"><br />언팔로우" + result.data.FOLLOWER_CNT + "</li>";
								$(".right_group").html(html);
							} else {
								popupText = "오류가 발생했습니다.";
								commonPopup(popupText);
							}
				},//success end
				error: function(error){
					console.log(error);
				}//error end
			}); //ajax end 
				} else if(result.msg == "failed") {
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "checkPoints",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result) {
							if(result.msg == "success") {
								var html = "";
								html +="<li><img alt=\"follow\" id=\"follow\" src=\"static/images/follower.png\"><br />팔로우" + result.data.FOLLOWER_CNT + "</li>";
								
								$(".right_group").html(html);
							} else {
								popupText = "오류가 발생했습니다.";
								commonPopup(popupText);
							}
						},//success end
						error: function(error){
							console.log(error);
						}//error end
					}); //ajax end 
				}
			},//success end
			error: function(error){
				console.log(error);
			} //error end
		});//ajax end
	}
	
	var params = $("#memForm").serialize();

	$.ajax({
		url: "myPageProfiles",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			var html = ""; 
			if(result.myProfile.PHOTO_PATH != null) {
				html += "<img alt=\"profile\" src=\"resources/upload/" + result.myProfile.PHOTO_PATH + "\"class=\"profile_img\">";
			} else {
				html += "<img alt=\"profile\" src=\"static/images/profile3.png\"class=\"profile_img\">";
			}
			html += "<div>" + result.myProfile.NIC + "</div>";
			html += "<span>" + result.myProfile.INTRO + "</span>"; 
			
			$(".info").html(html);
		},//success end
		error: function(error){
			console.log(error);
		} //error end
	});//ajax end
	
	params = $("#memForm").serialize();
	
	$.ajax({
		url: "myPageJournals",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			if(result.msg == "success") {
				makeGallery(result.myPage);
				makePage(result.pb);
			} else {
				alert("오류 발생");
			}
		},//success end
		error: function(error){
			console.log(error);
		}//error end
	}); //ajax end
	
	$(".right_group").on("click", "#follow, #following", function(){
		if("${sMEM_NO}" == "") {
			popupText = "로그인이 필요한 서비스입니다.";
			commonPopup(popupText);
		} else if($(this).attr("id") == "following") {
			var params = $("#memForm").serialize();
			
			$.ajax({
				url: "unfollows",
				data: params,
				dataType: "json",
				type: "post",
				success: function(result){
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "checkPoints",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result) {
							if(result.msg == "success") {
								var html = "";
								html +="<li><img alt=\"follow\" id=\"follow\" src=\"static/images/follower.png\"><br />팔로우" + result.data.FOLLOWER_CNT + "</li>";
								
								$(".right_group").html(html);
							} else {
								popupText = "오류가 발생했습니다.";
								commonPopup(popupText);
							}
						},//success end
						error: function(error){
							console.log(error);
						}//error end
					}); //ajax end
				},//success end
				error: function(error){
					console.log(error);
				}//error end
			}); //ajax end 
		} else {
			var params = $("#memForm").serialize();
			
			$.ajax({
				url: "follows",
				data: params,
				dataType: "json",
				type: "post",
				success: function(result){
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "checkPoints",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result) {
							if(result.msg == "success") {
								var html = "";
								html +="<li><img alt=\"follow\" id=\"following\" src=\"static/images/follower.png\"><br />팔로우" + result.data.FOLLOWER_CNT + "</li>";
								
								$(".right_group").html(html);
							} else {
								popupText = "오류가 발생했습니다.";
								commonPopup(popupText);
							}
						},//success end
						error: function(error){
							console.log(error);
						}//error end
					}); //ajax end
				},//success end
				error: function(error){
					console.log(error);
				}//error end
			}); //ajax end 
		}//if ~ else end
	}); //right_group click end
	
	$(".paging_wrap").on("click", "span", function() {
		$("#page").val($(this).attr("name"));
		
		var params = $("#memForm").serialize();
		
		$.ajax({
			url: "myPageJournals",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				if(result.msg == "success") {
					makeGallery(result.myPage);
					makePage(result.pb);
					$("html").scrollTop(300);
				} else {
					alert("오류 발생");
				}
			},//success end
			error: function(error){
				console.log(error);
			}//error end
		}); //ajax end 
	}); //paging_wrap click end
	
	$("#userPageMap").on("click", function(){
		$("#memForm").attr("action", "userPageMap");
		$("#memForm").submit();
	}); //userPageMap click end
	
	$(".gallery").on("click", "span, strong", function(){
		$("#journalNo").val($(this).attr($(this).attr("class")));
		$("#journalForm").submit();
	}); //post click span end
	
	 $("#userMap").on("click", function(){
	    	location.href = "userPageMapDetail";
	    });//postBoard click end
}); //document ready end

</script>
</head>

<form action="#" id="memForm" method="post">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${userNo}"/> <!-- 쿼리랑 이름 맞춰야 해서 변경  -->
	<input type="hidden" id="loginMem" name="loginMem" value="${sMEM_NO}"/> <!-- 로그인 한 사람의 아이디 -->
	<input type="hidden" id="page" name="page" value="${page}"/>
	<input type="hidden" id="mem" value="${userNo}"/> <!-- 쿼리랑 이름 맞춰야 해서 변경  -->
</form>
<form action="#" id="memForm1">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" name="page" value="1"/>
	<input type="hidden" name="GBN" value="1"/>
	<input type="hidden" name="firstPage" value="1"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div class="sub_profile">
			<div class="info">

			</div>
		</div>
		<div id="container">
			<div class="board_list_wrap">
				<div class="board_menu">
					<nav class="menu_nav">
						<ul id="left_group">
							<li><img alt="thumbnail" id="userPageImg" src="static/images/flag.png"><br />여행일지&nbsp${cnt}</li>
						</ul>
						<ul class="right_group">

						</ul>
					</nav>
				</div>
				<div id="path_info">
					<span> <img alt="메인페이지" src="static/images/home.png" class="home_icon">
					</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 닉네임 </span>
					&nbsp;&nbsp;>&nbsp;&nbsp; <span> 여행일지 </span>
					&nbsp;>&nbsp;&nbsp;썸네일
				</div>
				<div class="gallery">

				</div>
				<div class="paging_wrap">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
</body>
</html>
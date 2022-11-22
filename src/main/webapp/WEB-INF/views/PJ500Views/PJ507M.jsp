<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다른 사용자</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ500Css/PJ507C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ500Js/PJ507S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if($("#loginMem").val() == $("#MEM_NO").val())
	{
		location.href = "myPage";
	}

	
	if($("#mem").val() == 1)
	{
		history.back();
	}
	
	
	if("${sMEM_NO}" != "")
	{
		$(".logins").css("display", "none");
		$(".btns").css("display", "inline-block");
		
		var path = "";
		
		if("${sPHOTO_PATH}" != "")
		{
			path = "resources/upload/" + "${sPHOTO_PATH}";
			
			$("#profilePhoto").attr("src", path);
		}
		else
		{
			path = "./resources/images/profile.png";

			$("#profilePhoto").attr("src", path);
		}
		
		if("${sGRADE_NO}" == "0")
		{
			$("#admin").show();
		}
		
		var params = $("#memForm").serialize();

		$.ajax({
			url: "followStatus",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				var html = "";
				
				if(result.msg == "success") 
				{
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "checkPoints",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result)
						{
							if(result.msg == "success")
							{
								var html = "";
								html +="<li><img alt=\"follow\" id=\"following\" src=\"./resources/images/follower.png\"><br />언팔로우" + result.data.FOLLOWER_CNT + "</li>";
								$(".right_group").html(html);
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
				}
				else if(result.msg == "failed")
				{
					var params = $("#memForm").serialize();
					
					$.ajax({
						url: "checkPoints",
						data: params,
						dataType: "json",
						type: "post",
						success:function(result)
						{
							if(result.msg == "success")
							{
								var html = "";
								html +="<li><img alt=\"follow\" id=\"follow\" src=\"./resources/images/follower.png\"><br />팔로우" + result.data.FOLLOWER_CNT + "</li>";
								
								$(".right_group").html(html);
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
			if(result.myProfile.PHOTO_PATH != null)
			{
				html += "<img alt=\"profile\" src=\"resources/upload/" + result.myProfile.PHOTO_PATH + "\"class=\"profile_img\">";
			}
			else
			{
				html += "<img alt=\"profile\" src=\"./resources/images/profile3.png\"class=\"profile_img\">";
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
			if(result.msg == "success")
			{
				makeGallery(result.myPage);
				makePage(result.pb);
			}
			else
			{
				alert("오류 발생");
			}
		},//success end
		error: function(error){
			console.log(error);
		}//error end
	}); //ajax end 
	
	params = $("#memForm1").serialize();
	
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
	
	$(".right_group").on("click", "#follow, #following", function(){
		if("${sMEM_NO}" == "")
		{
			popupText = "로그인이 필요한 서비스입니다.";
			commonPopup(popupText);
		}
		else if($(this).attr("id") == "following")
		{
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
						success:function(result)
						{
							if(result.msg == "success")
							{
								var html = "";
								html +="<li><img alt=\"follow\" id=\"follow\" src=\"./resources/images/follower.png\"><br />팔로우" + result.data.FOLLOWER_CNT + "</li>";
								
								$(".right_group").html(html);
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
				},//success end
				error: function(error){
					console.log(error);
				}//error end
			}); //ajax end 
		}
		else
		{
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
						success:function(result)
						{
							if(result.msg == "success")
							{
								var html = "";
								html +="<li><img alt=\"follow\" id=\"following\" src=\"./resources/images/follower.png\"><br />팔로우" + result.data.FOLLOWER_CNT + "</li>";
								
								$(".right_group").html(html);
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
				if(result.msg == "success")
				{
					makeGallery(result.myPage);
					makePage(result.pb);
					$("html").scrollTop(300);
				}
				else
				{
					alert("오류 발생");
				}
			},//success end
			error: function(error){
				console.log(error);
			}//error end
		}); //ajax end 
	}); //paging_wrap click end
	
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
	});
	
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
			$("#notification").css("display", "inline-block");
		}
	}); //notificationPhoto click end
	
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
  	
  	$("#timeline").on("click", function(){
  		location.href = "timeline";
  	}); //timeline click end
  	
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
		<!-- header부분 고정 -->
		<div id="header">
			<div class="banner">
				<div class="top">
					<div class="logo_area">
						<a href="main"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
						<div class="site_name">우리들의 여행일지</div>
					</div>
					<div class="btns">
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
		<div class="sub_profile">
			<div class="info">

			</div>
		</div>
		<div id="container">
			<div class="board_list_wrap">
				<div class="board_menu">
					<nav class="menu_nav">
						<ul id="left_group">
							<li><img alt="thumbnail" id="userPageImg" src="./resources/images/flag.png"><br />여행일지&nbsp${cnt}</li>
						</ul>
						<ul class="right_group">

						</ul>
					</nav>
				</div>
				<div id="path_info">
					<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
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
	<div id="footer">
		<p>
			POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
			Copyright© POPJOURNEY. All Rights Reserved.
		</p>
	</div>
</body>
</html>
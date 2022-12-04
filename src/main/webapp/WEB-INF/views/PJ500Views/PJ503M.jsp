
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로잉</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ500Css/PJ502C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ500Js/PJ502S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var boxName =""; //체크박스 class이름 담을곳
	var path = "";
	var html = "";  

	var params = $("#memForm").serialize();
	
	$.ajax({
		url: "myFollowings",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			if(result.msg == "success") {
				$("#firstPage").val(result.firstPage);
				$("#lastPage").val(result.lastPage);
				makeFollowing(result.myFollowing);
			} else {
				popupText = "오류가 발생했습니다.";
				commonPopup(popupText);
			}
		},//success end
		error: function(error){
			console.log(error);
		}//error end
	}); //ajax end
	
	$.ajax({
		url: "checkPoints",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result)
		{
			if(result.msg == "success")
			{
				$("#point").val(result.data.TOTAL_POINT);
				
				var html = "";

				html += "<div>${sNIC}";
				if("${sGRADE_NO}" == "0") {
					html += "[관리자]";
				} else if("${sGRADE_NO}" == "1") {
					html += "[여행꾼]";
				} else {
					html += "[여행작가]";
				}
				
				html +="</div>";
				html += "<div id=\"intro\">${sINTRO}</div>";
				html += "<sapn id=\"point\">여행점수: " + result.data.TOTAL_POINT + "  <input type=\"button\" id=\"upgradeBtn\" value=\"작가 신청\"/></span>";
				
				$(".info").html(html);
				
				html = "";
				
				html += "<li><img alt=\"thumbnail\" id=\"myPageImg\" src=\"./resources/images/flag.png\"><br />여행일지</li>";
				html += "<li><img alt=\"map\" id=\"map\" src=\"./resources/images/map.png\"><br />&nbsp;&nbsp;" + result.data.JOURNAL_CNT + "</li>";
				
				$("#left_group").html(html);
				
				
				html = "";
				
				html += "<li><img alt=\"bookmark\" id=\"bookmark\" src=\"./resources/images/bmrk.png\"><br />북마크" + result.data.BMK_JOURNAL_CNT + "</li>";
				html += "<li><img alt=\"follower\" id=\"follower\" src=\"./resources/images/follower.png\"><br />팔로워" + result.data.FOLLOWER_CNT + "</li>";
				html += "<li><img alt=\"following\" id=\"following\" src=\"./resources/images/following.png\"><br />팔로잉" + result.data.FOLLOWING_CNT + "</li>";
						
				$(".right_group").html(html);
			} else {
				popupText = "오류가 발생했습니다.";
				commonPopup(popupText);
			}
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end 

	$(".info").on("click", "#upgradeBtn", function(){
		if("${sGRADE_NO}" == 2) {
			popupText = "이미 여행작가 입니다.";
			commonPopup(popupText);
			return false;
		}

		var params = $("#memForm").serialize();

		$.ajax({
			url: "upgrades",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result) {
				if(result.msg == "success") {
					popupText = "신청 완료.";
					commonPopup(popupText);
				} else if(result.msg == "notEnough") {
					popupText = "100점 이상되어야 합니다.";
					commonPopup(popupText);
				} else {
					popupText = "오류가 발생 했습니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //info upgradeBtn click end
	
	$(".follow_list").on("click", "input[type='button']", function(){
		$("#userNo").val($(this).attr($(this).attr("class")));
		$("#userForm").submit();
	}); //follow_list click button end
	
	$("#moreBtn").on("click", function(){
		var params = $("#memForm").serialize();
		
		$.ajax({
			url: "myFollowings",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				if(result.msg == "success") {
					$("#firstPage").val(result.firstPage);
					$("#lastPage").val(result.lastPage);
					makeFollowing(result.myFollowing);
				} else if(result.msg == "full") {
					popupText = "마지막 페이지 입니다.";
					commonPopup(popupText);
				} else {
					popupText = "오류가 발생 했습니다.";
					commonPopup(popupText);
				}
			},//success end
			error: function(error){
				console.log(error);
			}//error end
		}); //ajax end 
	}); //moreBtn click end
	
	$(window).on("scroll", function(){
	    var $window = $(this);
	    var scroll = $window.scrollTop();
	    var wheigth = $window.height();
	    var dheight = $(document).height();
	   
        if(scroll + wheigth + 100 > dheight)  {
        	$(".edit_btn").css("bottom", 110);
        } else {
        	$(".edit_btn").css("bottom", 20);
        }
	}); // window scroll end
	
	$(".follow_list").on("change", "input:checkbox", function(){
		$("input:checkbox").prop("checked", false);
		$(this).prop("checked", true);
		boxName = $(this).attr("class");
	}); //follow_list input:checkbox changed end
	
	$(".edit_btn").on("click", function(){
		if($("input[type='checkbox']").filter(':checked').size() == 0)
		{
			popupText = "유저를 선택해 주세요.";
			commonPopup(popupText);
			return false;
		}
		
		$("#box").val(boxName.substring(2));
		
		var params = $("#boxNumber").serialize();
		
		$.ajax({
			url: "followingMemos",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				makeMemo(result.followingMemo);
			},//success end
			error: function(error){
				console.log(error);
			}//error end
		}); //ajax end 
	}); //editMemo click end
	
	$(".right_group").on("click", "#bookmark", function(){
		location.href = "myPageBMK";
	});//bookmark click end
	
	$("#left_group").on("click", "#map", function(){
		location.href = "myPageMap";
	});//map click end
	
	$(".right_group").on("click", "#follower", function(){
		location.href = "myPageFollower";
	}); //follower click end
	
	$("#left_group").on("click", "#myPageImg", function(){
		location.href = "myPage";
	}); //myPageImg click end
}); //document ready end
</script>
</head>

<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	<input type="hidden" id="lastPage" name="lastPage" value="15"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="point" name="point"/>
</form>
<form action="#" id="boxNumber">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="box" name="box" value=""/>
	<input type="hidden" id="memo" name="memo"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
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
		
						</ul>
						<ul class="right_group">
	
						</ul>
					</nav>
				</div> <!-- board_menu end -->
				<div id="path_info">
					<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
					</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 마이페이지 </span>
					&nbsp;>&nbsp;&nbsp;팔로잉
				</div>
				<div class="follow_btn_list">
					<div class="edit_btn">
						<span> ⚙️</span> <br />수 정
					</div>
				</div>
				<div class="follow_list">

				</div> <!-- follow_list -->
			</div> <!-- board_list_wrap -->
			<div class="more_btn">
				<input type="button" id="moreBtn" value="더 보 기" />
			</div>
		</div> <!-- container end -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div> <!-- Wrap end -->
</body>
</html>
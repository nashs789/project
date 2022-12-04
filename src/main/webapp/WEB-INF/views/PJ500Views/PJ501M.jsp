<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ500Css/PJ501C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ500Js/PJ501S.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var html = "";
	
	var params = $("#memForm").serialize();
	
	$.ajax({
		url:"myBMKs",
		data:params,
		dataType:"json",
		type:"post",
		success:function(result){
			if(result.msg == "success") {
				makeBMK(result.BMK);	
			} else {
				popupText = "오류가 발생 했습니다.";
				commonPopup(popupText);
			}
		},//success end
		error:function(error){
			console.log(error);
		}//error end
	}); //ajax end
	
	$.ajax({
		url: "checkPoints",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result) {
			if(result.msg == "success") {
				$("#point").val(result.data.TOTAL_POINT);
				
				var html = "";
				
				if("${sPHOTO_PATH}" != "") {
					path = "resources/upload/" + "${sPHOTO_PATH}";
					
					$("#profilePhoto").attr("src", path);
					html += "<img alt=\"profile\" src=\"" + path + "\"class=\"profile_img\">";
				} else {
					path = "./resources/images/profile.png";
					$("#profilePhoto").attr("src", path);
					path = "./resources/images/profile3.png";
					html += "<img alt=\"profile\" src=\"" + path + "\"class=\"profile_img\">";
				}
				
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
	
	params = $("#memForm").serialize();
	
	$.ajax({
		url:"myBMKCnts",
		data:params,
		dataType:"json",
		type:"post",
		success:function(result){
			if(result.msg == "success") {
				$("#BMKCnt").val(result.cnt);
			}
		},//success end
		error:function(error){
			console.log(error);
		}//error end
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
					popupText = "오류 발생.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //info upgradeBtn click end

	$(".gallery").on("change", "input:checkbox", function(){
		$("input:checkbox").prop("checked", false);
		$(this).prop("checked", true);
		$("#box").val($(this).attr($(this).attr("class")));
	}); //follow_list input:checkbox changed end
	
	$(".edit_btn").on("click", function(){
		if($("input[type='checkbox']").filter(':checked').size() == 0) {
			popupText = "북마크를 선택하세요.";
			commonPopup(popupText);
		} else {
			editBMK();
		}
	}); //edit_btn click end
	
	$(".add_btn").on("click", function(){
		if($("#BMKCnt").val() == 9) {
			popupText = "생성 가능한 최대수 도달";
			commonPopup(popupText);
		} else {
			makeAddPopup();
		}
	}); //add_btn click end
	
	$(".del_btn").on("click", function(){
		if($("input[type='checkbox']").filter(':checked').size() == 0) {
			popupText = "북마크를 선택하세요.";
			commonPopup(popupText);
			return false;
		}
		
		var params = $("#BMKForm").serialize();
		
		$.ajax({
			url:"delBMKs",
			data:params,
			dataType:"json",
			type:"post",
			success:function(result){
					location.reload();
			},//success end
			error:function(error){
				console.log(error);
			}//error end
		}); //ajax end
	}); //del_btn click end
	
 	$(".gallery").on("click", ".folder_thumb, .folder_info", function(){
		$("#BMKNo").val($(this).parent().attr($(this).parent().attr("class")));

		$("#detailForm").submit();
	});//gallery folder click end
	
	$(".right_group").on("click", "#follower", function(){
		location.href = "myPageFollower";
	}); //follower click end
	
	$(".right_group").on("click", "#following", function(){
		location.href = "myPageFollowing";
	}); //following click end
	
	$("#left_group").on("click", "#map", function(){
		location.href = "myPageMap";
	});//map click end
	
	$("#left_group").on("click", "#myPageImg", function(){
		location.href = "myPage";
	}); //myPageImg click end
}); //document ready end

</script>
</head>
<body>
<form action="myPageBMKDetail" id="detailForm" method="post">
	<input type="hidden" id="BMKNo" name="BMKNo" value=""/>
</form>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="BMKCnt" name="BMKCnt" value=""/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	<input type="hidden" id="point" name="point"/>
</form>
<form action="#" id="BMKForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="box" name="box" value=""/>
	<input type="hidden" id="memo" name="memo"/>
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
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
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
				</div>
				<div id="path_info">
					<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
					</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 마이페이지 </span>
					&nbsp;&nbsp;>&nbsp;&nbsp; <span> 북마크 </span> &nbsp;>&nbsp;&nbsp;폴더
				</div>
				<div class="folder_btn_list">
						<div class="add_btn">
							<span> &#43;</span> <br/>추  가
						</div>
						<div class="edit_btn">
							<span>  ⚙️</span> <br/>수  정
						</div>
						<div class="del_btn">
							<span> &#45;</span> <br/>삭  제
						</div>
				</div>
				<div class="gallery">

				</div><!-- gallery end -->
			</div>
		</div>
	</div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
<form action="#" id="editForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="BMKNO" name="BMKNO" value=""/>
</form>
</body>
</html>
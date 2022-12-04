<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의사항 작성</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ900Css/PJ904C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/script/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ900Js/PJ904S.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수

		CKEDITOR.replace("matterContents", {
			resize_enabled : false,
			language : "ko",
			enterMode : "2",
			width : "1280",
			height : "500"
		});

		$("#backBtn").on("click", function() {
			$("#goForm").submit();
		});

		$("#addForm").on("keypress", "input", function(event) {
			if(event.keyCode == 13) {
				return false;
			}
		});

		$("#updateBtn").on("click", function() {
			$("#matterContents").val(CKEDITOR.instances['matterContents'].getData());

			if($.trim($("#matterTitle").val()) == "") {
				alert("제목을 입력해 주세요.");
				$("#matterTitle").focus();
			} else if($.trim($("#matterContents").val()) == "") {
				alert("내용을 입력해 주세요.");
				$("#matterContents").focus();
			} else {
				var params = $("#updateForm").serialize();

				$.ajax({
					url: "clientCenterMatterUpdates",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						if(res.msg == "success") {
							location.href = "clientCenterMatter";
						} else if(res.msg == "failed") {
							alert("수정에 실패하였습니다.");
						} else {
							alert("수정중 문제가 발생하였습니다.");
						}
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			}
		});
	}); // document ready end..
</script>
</head>

<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
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
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="path_info">
			<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 문의사항 </span>
			&nbsp;>&nbsp;&nbsp;문의 작성
		</div>
		<form action="clientCenterMatter" id="goForm" method="post">
				<input type="hidden" name="page" value="${param.page}" />
				<input type="hidden" name="searchFilter" value="${param.searchFilter}" />
				<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
				<input type="hidden" id="writeMemNo" name="writeMemNo" />
		</form>
		<form action="#" id="updateForm" method="post">
			<input type="hidden" id="memNo" name="memNo" value="${param.memNo}" />
			<input type="hidden" id="qNo" name="qNo" value="${param.qNo}" />
			<input type="hidden" id="nic" name="nic" value="${param.nic}" />
			<input type="hidden" id="page" name="page" value="${param.page}" />
			<input type="hidden" id="searchOldTxt" name="searchOldTxt" value="${param.searchTxt}" />
			<input type="hidden" id="writeMemNo" value="${data.MEM_NO}" />
			<div class="title_area">
				<div>작성자 : ${sNIC}</div>
				<input type="text" class="input_title" id="matterTitle" name="matterTitle" value="${data.TITLE}" placeholder="문의 제목" size="50" maxlength="30" autofocus required/>
			</div>
			<div class="container_wrap">
				<div class="txt_area">
					<textarea rows="30" cols="150" placeholder="내용을 입력하시오" id="matterContents" name="matterContents">${data.CONTENTS}</textarea>
				</div>
				<div class="post_bottom">
					<div class="btn_list">
						<input type="button" id="updateBtn" class="add_btn"  value="수 정" />
						<input type="button" id="backBtn" class="del_btn" value="뒤로가기" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
</body>
</html>
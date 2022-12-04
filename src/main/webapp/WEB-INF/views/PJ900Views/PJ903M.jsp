<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터-문의사항-세부</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ900Css/PJ903C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ900Js/PJ903S.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var popupText = "";

			// 로그인 정보 유지
			if("${sMEM_NO}" != "") {
				var path = ""; //사진경로 담아줄 변수

				$(".logins").css("display", "none");
				$(".btns").css("display", "inline-block");
				$(".back_btn").css("margin-top", "30px");

				// 답변있을 경우 답변창 보여주고 없을 경우 숨기기
				if($("#cmtContents").val() != "") {
					$("#adminMatterDetailTitle").css("display", "block");
					$(".matter_detail_btn").css("display", "none");
					//$("#matterBtns").hide();
				} else {
					$("#adminMatterDetailTitle").css("display", "none");
				}

				// 매니저로 로그인 아닌 경우 답글버튼 히든
				if("${sMEM_NO}" != 1) {
					$(".matter_detail_btn").hide();
					$("#adminMatterBtns").hide();

					// 회원번호와 작성번호가 같을 경우 수정/삭제 버튼 생성
					if("${sMEM_NO}" == $("#writeMemNo").val()) {
						$("#matterBtns").show();
						if($("#cmtContents").val() != "") {
							$(".matter_edit_btn").hide();
						}
					} else {
						$("#matterBtns").hide();
					}
				}
			} else {
				$(".logins").css("display", "inline-block");
				$(".btns").css("display", "none");
				$(".matter_detail_btn").css("display", "none");
				$("#matterDetailTitle").css("margin-bottom", "30px");
				$("#matterBtns").hide();
			}

			$(".matter_cmt_btn").on("click", function() {
				$(".cmt_area").css("display", "block");
				$(".cmt_edit").hide();
			});

			$(".cmt_cancel").on("click", function() {
				$(".cmt_area").css("display", "none");
				$(".cmt_text").val("");
			});

			// 답글작성
			$(".cmt_write").on("click", function() {
				if($.trim($(".cmt_contents").val()) == "") {
					alert("내용을 넣어주세요.");
					$(".cmt_contents").focus();
				} else {
					var params = $("#actionForm").serialize();

					$.ajax({
						url: "clientCenterMatterDetailCmt",
						type: "post",
						dataType: "json",
						data: params,
						success: function(res) {
							redrawCmt(res);
							$(".matter_detail_btn").hide();
							$(".cmt_area").hide();
							$("#adminMatterDetailTitle").css("display", "block");
							location.reload();
						},
						error: function(request, status, error) {
							console.log(error);
						}
					});
				}
			});

			// 뒤로가기 버튼
			$("#backBtn").on("click", function() {
				location.href = "clientCenterMatter";
			})

			$(".sidebar1").on("click", function() {
				location.href = "clientCenterQuestion";
			});

			// 회원이 작성한 글 수정하기
			$(".matter_edit_btn").on("click", function() {
				$("#actionForm").attr("action", "clientCenterMatterUpdate");
				$("#actionForm").submit();
			});

			// 회원이 작성한 글 삭제하기
			$(".matter_del_btn").on("click", function() {
				if(confirm("삭제하시겠습니까?")) {
					var params = $("#actionForm").serialize();

					$.ajax({
						url: "clientCenterMatterDeletes",
						type: "post",
						dataType: "json",
						data: params,
						success: function(res) {
							if(res.msg == "success") {
								location.href = "clientCenterMatter";
							} else if(res.msg == "failed") {
								alert("삭제에 실패하였습니다.");
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error: function(request, status, error) {
							console.log(error);
						}
					});
				}
			});

			// 매니저 답변 수정하기
			$("#adminMatterEditBtn").on("click", function() {
				$(".cmt_area").show();
				$(".cmt_contents").val($("#cmtContents").val());
				$(".cmt_write").hide();
			});

			$(".cmt_edit").on("click", function() {
				if($.trim($(".cmt_contents").val()) == "") {
					alert("내용을 넣어주세요.");
					$(".cmt_contents").focus();
				} else {
					var params = $("#actionForm").serialize();

					$.ajax({
						url: "clientCenterMatterDetailCmtUpdates",
						type: "post",
						dataType: "json",
						data: params,
						success: function(res) {
							redrawCmt(res);
							$(".matter_detail_btn").hide();
							$(".cmt_area").hide();
							$("#adminMatterDetailTitle").css("display", "block");
						},
						error: function(request, status, error) {
							console.log(error);
						}
					});
				}
			});

			// 매니저 답변 삭제하기
			$("#adminMatterDelBtn").on("click", function() {
				if(confirm("삭제하시겠습니까?")) {
					$("#obNo").val($(this).parent().parent().attr("name"));

					var params = $("#actionForm").serialize();

					$.ajax({
						url : "clientCenterMatterDetailCmtDeletes",
						type : "post",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.msg == "success") {
								$("#adminMatterDetailTitle").hide();
								$(".matter_detail_btn").show();
							} else if(res.msg == "failed") {
								alert("삭제에 실패하였습니다.");
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
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
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="journalNo" name="journalNo" value=""/>
				<input type="hidden" id="memNo" name="memNo" value="${param.memNo}" />
				<input type="hidden" id="qNo" name="qNo" value="${param.qNo}" />
				<input type="hidden" id="nic" name="nic" value="${param.nic}" />
				<input type="hidden" id="pages" name="pages" value="${param.pages}" />
				<input type="hidden" id="searchOldTxt" name="searchOldTxt" value="${param.searchTxt}" />
				<input type="hidden" id="writeMemNo" name="writeMemNo" value="${data.MEM_NO}" />
				<div class="sidebar">
					<div class="sidebar1">자주 묻는 질문</div><div class="sidebar2">문의사항</div>
					<div class="sidebar3">
						<p>
							고객센터 1577-8253<br/>
							365일, 24시간 운영
						</p>
					</div>
				</div>
				<div id="matterDetailTitle">
					<div class="matter_detail_title">
						<span>문의번호</span><span>${data.QNA_NO}</span>
						<span>작성자</span><span>${data.NIC}</span>
						<span>제목</span><span>${data.TITLE}</span>
						<span>작성일</span><span>${data.QNA_DATE}</span>
						<span id="matterBtns" class="matter_btns">
							<input type="button" value="삭제" class="matter_del_btn"/>
							<input type="button" value="수정" class="matter_edit_btn"/>
						</span>
					</div>
					<div class="text_area">
						<p>${data.CONTENTS}</p>
					</div>
				</div>
				<div id="adminMatterDetailTitle">
					<div class="admin_matter_detail_title">
						<span>작성자</span><span>Manager</span>
						<span>작성일</span><span>${cmtDate.CMT_DATE}</span>
						<span id="adminMatterBtns" class="matter_btns2">
							<input type="button" value="삭제" id="adminMatterDelBtn" class="matter_del_btn2"/>
							<input type="button" value="수정" id="adminMatterEditBtn" class="matter_edit_btn2"/>
						</span>
					</div>
					<div class="admin_text_area">
						<p class="admin_text_areas">${data.CMT_CONTENTS}</p>
						<input type="hidden" id="cmtContents" value="${data.CMT_CONTENTS}" />
					</div>
				</div>

				<div class="matter_detail_btn">
					<input type="button" value="답변" class="matter_cmt_btn"/>
				</div>
				<div class="cmt_area">
					<textarea class="cmt_contents" name="cmt_contents" cols="50" rows="20"></textarea>
					<div>
						<input type="button" value="취소" class="cmt_cancel"/>
						<input type="button" value="작성" class="cmt_write"/>
						<input type="button" value="수정" class="cmt_edit"/>
					</div>
				</div>
				<div class="back_btn">
					<input type="button" id="backBtn" value="뒤로가기" />
				</div>
			</form>
		</div> <!-- container end -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
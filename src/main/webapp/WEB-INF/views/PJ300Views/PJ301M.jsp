<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
	   <link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	   <link href="static/css/PJ300Css/PJ301C.css" rel="stylesheet" type="text/css">
	   <script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	   <script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	   <script type="text/javascript" src="static/js/common.js"></script>
	   <script type="text/javascript" src="static/js/PJ300Js/PJ301S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();

	if("{sMEM_NO}" == ""){
		$(".reaction").css("display","none");
	}
	
	var params = $("#tempForm").serialize();
	
	$.ajax({
		url: "checkPoints",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result) {
			if(result.msg == "success") {
				var html = "";
				
				html += "<span>총 게시글  " + result.data.JOURNAL_CNT + "</span> <span>팔로워 " + result.data.FOLLOWER_CNT + "</span>";
				
				$(".cnt").html(html);
			} else {
				popupText = "오류가 발생했습니다.";
				commonPopup(popupText);
			}
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end 
	
	likeLoad();

	$(".report_btn").on("click", function(){
		if("{sMEM_NO}" == ""){
			popupText = "로그인이 필요한 기능입니다.";
			commonPopup(popupText);
			return false;
		}
		reportPopup();
	}); 
	
	$(".container_wrap").on("click", ".report_btn", function(){
		if("{sMEM_NO}" == "") {
			popupText = "로그인이 필요한 기능입니다.";
			commonPopup(popupText);
			return false;
		}

		reportPopup();
	});

	$(".follow_btn_area").on("click", "input[type='button']", function(){
		if("{sMEM_NO}" != "{data.MEM_NO}") {
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		} else {
			location.href = "myPage";
		}
	});

	$(".bnt_lists").on("click","#editBtn", function () {
		$("#goForm").attr("action","postUpdate");
		$("#goForm").submit();
	});

	//게시글 삭제
	$(".bnt_lists").on("click", ".del_btn", function () {
		if(confirm("삭제하시겠습니까?")){
			var params = $("#goForm").serialize();
			
			$.ajax({
				url:"postDeletes", 
				type: "post",
				dataType: "json",
				data : params,
				success: function(res){
					if(res.msg == "success"){
						location.href = "community";
					} else if (res.msg =="failed") {
						popupText = "삭제중 문제가 발생하였습니다.";
						commonPopup(popupText);
					} else {
						popupText = "삭제중 문제가 발생하였습니다.";
						commonPopup(popupText);
					}
				}, 
				error: function (request, status, error) {
					console.log(error);
				}
			});
		}
	});

	//좋아요 버튼
	$(".reaction").on("click","img", function(){
		var like = $(this).attr("like");
		var params = $("#likeForm").serialize();

		if(like == 0){ //좋아요 x : 좋아요 기능
			$.ajax({
				url:"postLikes", 
				type: "post",
				dataType: "json",
				data : params,
				success: function(res){
					if(res.msg == "success") {
						likeReload();
					}
				}, //success end
				error: function (request, status, error) {
					console.log(error);
				}//error end
			});//ajax end
		} else if(like == 1) { //좋아요 o : 좋아요 취소기능
			$.ajax({
				url:"postLikeCancles", 
				type: "post",
				dataType: "json",
				data : params,
				success: function(res){
					if(res.msg == "success")
					{
						likeReload();
					}
				}, //success end
				error: function (request, status, error) {
					console.log(error);
				}//error end
			});//ajax end
		}
	});

 	// 페이징 처리
	$(".paging").on("click", "div", function() {
		$($("#pages").val($(this).attr("pages")));
		reloadList();
	});
  	
	// 댓글작성
	$("#addBtn").on("click", function() {
		if($("#loginUserNo").val() == "") {
			popupText = "로그인이 필요한 기능입니다.";
			commonPopup(popupText);
			$("#cmtContents").val("");
		} else {
			if($.trim($("#cmtContents").val()) == "") {
				popupText = "내용이 비어있습니다.";
				commonPopup(popupText);
				$("#cmtContents").focus();
			} else {
				$("#getCmtContents").val($("#cmtContents").val());
				var params = $("#goForm").serialize();
				
				$.ajax({
					url: "postCmtAdds",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						$("#cmtList").val("");
						$("#cmtContents").val("");
						reloadList();
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
			}
		}
	});
	
	// 자유게시판 작성자 번호 가져오기
	$("#postWriteMemNo").val($(".title_area").attr("postMno"));
	
	//댓글 수정 클릭 시
	$("#cmtList").on("click", ".cmt_edit_btn", function() {
		$("#cmtEditContents").remove();
		$("#cmtCmtContents").remove();
		$("#cmtNo").val($(this).parent().parent().parent().parent().attr("cmtno"));
		var cmtNo = $("#cmtNo").val();
		var html = "";
		
		html += "<div class=\"cmt_cmt_contents\" id=\"cmtEditContents\">";
		html += "	<div class=\"cmt_contents_right\">";
		html += "		<div class=\"cmt_bottom\">";
		html += "			<textarea id=\"editCmt\" class=\"reply\"  rows=\"8\" cols=\"150\" placeholder=\"댓글을 입력하십시오\"></textarea>";
		html += "			<br/><input type=\"button\" class=\"reply_edit_btn\" id=\"editBtn\" value=\"수  정\" />";
		html += "		</div>";
		html += "	</div>";
		html += "</div>";
	
		$(".cmt_content_list[cmtno=" + cmtNo + "]").append(html);
		
	});

	// 댓글 수정 후 수정버튼 클릭 시
	$("#cmtList").on("click", "#editBtn", function() {
		if($.trim($("#editCmt").val()) == "") {
			popupText = "내용이 비어있습니다.";
			commonPopup(popupText);
			$("#editCmt").focus();
		} else {
			$("#getCmtContents").val($("#editCmt").val());
			var params = $("#goForm").serialize();
			
			$.ajax({
				url: "postCmtEdits",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					$("#cmtEditContents").remove();
					reloadList();
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});

	//대댓글 수정 클릭 시
	$("#cmtList").on("click", ".cmt_cmt_edit_btn", function() {
		$("#cmtEditContents").remove();
		$("#cmtCmtContents").remove();
		$("#cmtNo").val($(this).parent().parent().parent().parent().attr("cmtcmtnos"));
		var cmtNo = $("#cmtNo").val();
		var html = "";
		
		html += "<div class=\"cmt_cmt_contents\" id=\"cmtEditContents\">";
		html += "	<div class=\"cmt_contents_right\">";
		html += "		<div class=\"cmt_bottom\">";
		html += "			<textarea id=\"editCmt\" class=\"reply\"  rows=\"8\" cols=\"150\" placeholder=\"댓글을 입력하십시오\"></textarea>";
		html += "			<br/><input type=\"button\" class=\"reply_edit_btn\" id=\"editBtn\" value=\"수  정\" />";
		html += "		</div>";
		html += "	</div>";
		html += "</div>";
	
		$(".cmt_cmt_contents_list[cmtcmtnos=" + cmtNo + "]").append(html);
	});

	// 대댓글 수정 후 수정버튼 클릭 시
	$("#cmtList").on("click", "#editBtn", function() {
		if($.trim($("#editCmt").val()) == "") {
			popupText = "내용이 비어있습니다.";
			commonPopup(popupText);
			$("#editCmt").focus();
		} else {
			$("#getCmtContents").val($("#editCmt").val());
			var params = $("#goForm").serialize();
			
			$.ajax({
				url: "postCmtEdits",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					$("#cmtEditContents").remove();
					reloadList();
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});

	//댓글 답글 클릭 시
	$("#cmtList").on("click", ".add_cmt_cmt", function() {
		if($("#memNo").val() != "") {
			// 여행게시판 댓글 작성자 번호 가져오기
			$("#cmtWriteMemNo").val($(this).parent().parent().parent().attr("cmtmemno"));

			$("#cmtEditContents").remove();
			$("#cmtCmtContents").remove();
			$("#cmtNo").val($(this).parent().parent().parent().parent().attr("cmtno"));
			var cmtNo = $("#cmtNo").val();
			var html = "";
			
			html += "<div class=\"cmt_cmt_contents\" id=\"cmtCmtContents\">";
			html += "	<div class=\"cmt_contents_right\">";
			html += "		<div class=\"cmt_bottom\">";
			html += "			<textarea id=\"addCmt\" class=\"reply\"  rows=\"8\" cols=\"150\" placeholder=\"댓글을 입력하십시오\"></textarea>";
			html += "			<br/><input type=\"button\" class=\"reply_edit_btn\" id=\"cmtAddBtn\" value=\"등  록\" />";
			html += "		</div>";
			html += "	</div>";
			html += "</div>";
		
			$(".cmt_content_list[cmtno=" + cmtNo + "]").append(html);
		} else {
			popupText = "로그인이 필요한 기능입니다.";
			commonPopup(popupText);
		}
	});

	// 댓글 답글 클릭 후 등록 버튼 클릭 시
	$("#cmtList").on("click", "#cmtAddBtn", function() {
		if($.trim($("#addCmt").val()) == "") {
			popupText = "내용이 비어 있습니다.";
			commonPopup(popupText);
			$("#addCmt").focus();
		} else {
			$("#getCmtContents").val($("#addCmt").val());
			var params = $("#goForm").serialize();
			
			$.ajax({
				url: "postCmtCmtAdds",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					$("#cmtCmtContents").remove();
					reloadList();
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});

	// 댓글 삭제버튼 클릭 시
	$("#cmtList").on("click", ".cmt_delete_btn", function() {
		$("#cmtWriteMemNo").val($(this).parent().parent().parent().parent().attr("cmtno"));
		$("#cmtNo").val($(this).parent().parent().parent().parent().attr("cmtno"));
		
		if(confirm("삭제하시겠습니까?")) {
			
			var params = $("#goForm").serialize();
			
			$.ajax({
				url: "postCmtDeletes",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.msg == "success") {
						reloadList();
					} else if(res.msg == "failed") {
						popupText = "삭제에 실패하였습니다.";
						commonPopup(popupText);
					} else {
						popupText = "삭제중 문제가 발생하였습니다.";
						commonPopup(popupText);
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
	
	// 대댓글 삭제버튼 클릭 시
	$("#cmtList").on("click", ".cmt_cmt_delete_btn", function() {
		$("#cmtWriteMemNo").val($(this).parent().parent().parent().attr("cmtcmtno"));
		if(confirm("삭제하시겠습니까?")) {
			
			var params = $("#goForm").serialize();
			
			$.ajax({
				url: "postCmtCmtDeletes",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.msg == "success") {
						reloadList();
					} else if(res.msg == "failed") {
						popupText = "삭제에 실패하였습니다.";
						commonPopup(popupText);
					} else {
						popupText = "삭제중 문제가 발생하였습니다.";
						commonPopup(popupText);
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
	
	if($("#MEM_NO").val() == $("#postMem").val() || $("#MEM_NO").val() == 1) {
		var html = "";
		
		html += "<div class=\"btn_list\">";
		html += "<input type=\"button\" id=\"editBtn\" class=\"edit_btn\" value=\"수  정\" />";
		html += "<input type=\"button\" class=\"del_btn\" value=\"삭  제\" />";
		html += "</div>";
		$(".bnt_lists").html(html);
	}
});// document ready end

</script>
</head>

<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
</form>
<form action="" id="tempForm">
	<input type="hidden" name="MEM_NO" value="${data.MEM_NO}"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
</form>
<form action="post" id="postForm1" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" name="loginUserNo" value="${sMEM_NO}" />
</form>
<form action="#" id="likeForm" method="post">
	<input type="hidden" id="lLoginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
	<input type="hidden" id="likePostNo" name="postNo" value="${data.POST_NO}"/>
	<input type="hidden" id="postMem" name="postMem" value="${data.MEM_NO}"/>
</form>

<body>
  <div id="wrap">
	  <jsp:include page="../Frame/header.jsp"></jsp:include>

	 <form action="userPage" id="userForm" method="post">
		<input type="hidden" id="userNo" name="userNo" value=""/>
	 </form>
	 <form action="#" id="goForm" method="post">
		<input type="hidden" name="postNo" value="${data.POST_NO}"/>
		<input type="hidden" name="editPostNo" value="${data.POST_NO}"/>
		<input type="hidden" name="postTitle" value="${data.TITLE}"/>
		<input type="hidden" name="postCategoryNo" value="${data.CATEGORY_NO}"/>
		<input type="hidden" name="postContents" value="${data.CONTENTS}"/>
		<input type="hidden" id="pages" name="pages" value="${pages}" />
		<input type="hidden" name="searchFilter" value="${param.searchFilter}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
		<input type="hidden" id="getCmtContents" name="getCmtContents"/>
		<input type="hidden" id="postWriteMemNo" name="postWriteMemNo" />
		<input type="hidden" id="cmtWriteMemNo" name="cmtWriteMemNo" />
		<input type="hidden" id="cmtNo" name="cmtNo" />
	 </form>
	<div id="path_info">
		<span>
		<img alt="메인페이지" src="static/images/home.png" class="home_icon">
		</span>
		&nbsp;&nbsp;>&nbsp;&nbsp;
		<span> 자유게시판 </span>
		&nbsp;&nbsp;>&nbsp;&nbsp;
		<c:choose>
			<c:when test="${data.CATEGORY_NO eq 1}">
				공지사항
			</c:when>
			<c:when test= "${data.CATEGORY_NO eq 2}">
				여행꿀팁
			</c:when>
			<c:when test="${data.CATEGORY_NO eq 3}">
				Q & A
			</c:when>
			<c:when test="${data.CATEGORY_NO eq 4}">
				잡&nbsp;&nbsp;&nbsp;담
			</c:when>
		</c:choose>
		&nbsp;>&nbsp;&nbsp;${data.TITLE}

	</div>
	<div class= "title_area" postMno="${data.MEM_NO}">
		<div class="title_left">
			<strong>${data.TITLE}</strong><br />

			<br /> <span>작성일</span> <span>${data.BOARD_DATE}</span> <span>조회</span><span>${data.HIT}</span>
			<span>좋아요</span><span>${data.LIKE_CNT}</span> <span>댓글</span><span>${data.POST_CMT_CNT}</span>
		</div>
		<div class="title_right">
			<span class="report_btn">신고하기</span>
		</div>
	 </div>
	 <div class="container_wrap">
		<div class = "text_area">
					<p>${data.CONTENTS}</p>
		</div>
		<div class="category_area">
				<div class="category_label">
					카테고리
				</div>
				<div class="category_txt">
					<c:choose>
						<c:when test="${data.CATEGORY_NO eq 1}">
						<span>공지사항</span>
						</c:when>
						<c:when test="${data.CATEGORY_NO eq 2}">
						<span>여행꿀팁</span>
						</c:when>
						<c:when test="${data.CATEGORY_NO eq 3}">
						<span>Q & A</span>
						</c:when>
						<c:when test="${data.CATEGORY_NO eq 4}">
						<span>잡&nbsp;&nbsp;&nbsp;담</span>
						</c:when>
						</c:choose>
				</div>
			</div>
		<div class="sub_profile">
				<div class="profile_info">
					<div>
						<c:choose>
							<c:when test="${data.PHOTO_PATH eq null}">
								<img alt="profile" src="static/images/profile3.png" class="profile_img">
							</c:when>
							<c:otherwise>
								<img alt="profile" src="static/upload/${data.PHOTO_PATH}" class="profile_img">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="info">
						<span>${data.NIC}</span>
					<div class="grade">
						<img alt="icon" src="static/images/grade.png">
						<c:choose>
						<c:when test="${data.GRADE_NO eq 0}">
						<span>관리자</span>
						</c:when>
						<c:when test="${data.GRADE_NO eq 1}">
						<span>여행꾼</span>
						</c:when>
						<c:when test="${data.GRADE_NO eq 2}">
						<span>여행작가</span>
						</c:when>
						</c:choose>
					</div>
					<div class="cnt">
						<span>총 게시글 ${data.POST_CNT}</span> <span>총 댓글</span>
					</div>
					</div>
				</div>
				<div class="follow_btn_area">
					<input type="button" id="userPage" class="user" user="${data.MEM_NO }" value="여 행 일 지&nbsp;&nbsp;&nbsp;&nbsp;모 아 보 기 &nbsp;&nbsp;&nbsp;&nbsp;&#62;"/>
				</div>
			</div>
		<div class="post_bottom">
			<div class="bnt_lists"></div>
			<div class="reaction">
				<ul><li><img alt="좋아요" src="static/images/like.png" id="likeImg" class="like" like="0"><br/><span class="likeText">좋아요</span></li></ul>
			</div>
		</div>
		<div class="cmt_area">
			<div class="cmt_top">
				<span>댓글 </span><span>${data.POST_CMT_CNT}</span><span> 개</span>
			</div>
			<div class="cmt_bottom">
				<textarea id="cmtContents" name="cmtContents" rows="8" cols="150" placeholder="댓글을 입력하십시오"></textarea>
				<input type="button" class="edit_btn" id="addBtn" value="등  록" />
			</div>
			<div class="cmt_list" id="cmtList"></div>
			<div class="paging"></div>
		</div>
		</div>
	 </div>
	 <jsp:include page="../Frame/footer.jsp"></jsp:include>
	 <form action="#" id="reportForm">
		 <input type="hidden" name="MEM_NO" value="${sMEM_NO}" />
		 <input type="hidden" name="writeMemNo" value="${data.MEM_NO}"/>
		 <div id="pop"></div>
	 </form>
</body>
</html>
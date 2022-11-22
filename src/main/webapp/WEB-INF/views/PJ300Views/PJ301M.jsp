<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>게시글 상세보기</title>

	   <%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	   <link href="static/css/PJ301Css/PJ301C.css" rel="stylesheet" type="text/css">
	   <script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	   <script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	   <script type="text/javascript" src="static/js/callServer.js"></script>
	   <script type="text/javascript" src="static/js/callPopup.js"></script>
	   <script type="text/javascript" src="static/js/common.js"></script>
	   <script type="text/javascript" src="static/js/PJ301Js/PJ301S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	if("${sMEM_NO}" == "${data.MEM_NO}") {
		$(".btns").css("display","inline-block");
		$(".logins").css("display","none");
		$(".btn_list").css("display","inline-block");
	} 
	if("${sMEM_NO}" == ""){
		$(".reaction").css("display","none");
	}
	if("${sMEM_NO}" != "1"){
		$("#admin").css("display","none");
	} 
	
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
	
	var params = $("#tempForm").serialize();
	
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
				
				html += "<span>총 게시글  " + result.data.JOURNAL_CNT + "</span> <span>팔로워 " + result.data.FOLLOWER_CNT + "</span>";
				
				$(".cnt").html(html);
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
	
	likeLoad();
	//상단메뉴 (여행게시판, 자유게시판, 여행작가,고객센터, 내부관리자) 페이지 이동
	$(".logo_photo").on("click", function() {
  		location.href = "main";
  	});
	$("#journalBoard").on("click", function() {
  		location.href = "journalBoard";
  	});
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
	$(".report_btn").on("click", function(){
		if("${sMEM_NO}" == "")
		{
			popupText = "로그인이 필요한 기능입니다.";
			commonPopup(popupText);
			return false;
		}
			
		reportPopup();
	}); 
	
	$(".container_wrap").on("click", ".report_btn", function(){
		if("${sMEM_NO}" == "")
		{
			popupText = "로그인이 필요한 기능입니다.";
			commonPopup(popupText);
			return false;
		}
			
		reportPopup();
	});

	$(".follow_btn_area").on("click", "input[type='button']", function(){
		if("${sMEM_NO}" != "${data.MEM_NO}") {
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		} else {
			location.href = "myPage";
		}
	});
	
	$(".login_btn").on("click", function(){  //로그인 버튼 클릭
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
					if(res.msg == "success")
					{					
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
	
	// 메인검색창 넘어가는 부분(동기)
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
			$("#postForm1").submit();
		}//if ~ else end 클릭된 것에 따라서 해당 프로필 or 글로 이동
	}); //notification tbody span tr click end
	
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
   <body>
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
      <div id="wrap">
         <!-- header부분 고정 -->
         <div id="header">
            <div class="banner">
               <div class="top">
                  <div class="logo_area">
                     <a href="#"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
                     <div class="site_name">우리들의 여행일지</div>
                  </div>
                  <div class="btns">
						<!-- 밑에 logins와 연동 -->
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
						<form action="#" id="loginForm" method="post">
							<input type="button" class="login_btn" value="로그인" /> 
							<input type="password" class="login" id="inputPW" name="inputPW" placeholder="PW" /> 
							<input type="text" class="login" id="inputID" name="inputID" placeholder="ID" />
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
			<img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
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
									<img alt="profile" src="./resources/images/profile3.png" class="profile_img">									
								</c:when>
								<c:otherwise>
									<img alt="profile" src="./resources/upload/${data.PHOTO_PATH}" class="profile_img">
								</c:otherwise>
							</c:choose>
	         			</div>
	         			<div class="info">
	         				<span>${data.NIC}</span>
						<div class="grade">
							<img alt="icon" src="./resources/images/grade.png"> 
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
            		<ul><li><img alt="좋아요" src="./resources/images/like.png" id="likeImg" class="like" like="0"><br/><span class="likeText">좋아요</span></li></ul>
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
         <div id="footer">
            <p>
               POPJOURNEY<br/>
               GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br/>
               Copyright© POPJOURNEY. All Rights Reserved.
            </p>
         </div> 
         <form action="#" id="reportForm">
       		 <input type="hidden" name="MEM_NO" value="${sMEM_NO}" />
       		 <input type="hidden" name="writeMemNo" value="${data.MEM_NO}"/>
        	 <div id="pop"></div>   
         </form>
   </body>
</html>
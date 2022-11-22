<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일지 상세보기</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ400Css/PJ401C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ400Js/PJ401S.js"></script>
<script type="text/javascript">
	var seq = 0;
	var photoCnt = 1;
	$(document).ready(function(){
		var cnt = $("#photoCnt").val();
		reloadList();
		reloadSequence();
		likeLoad();
		
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
		
		var params = $("#checkForm").serialize();
		
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
				$("#actionForm").submit();
			}
			else if($(this).attr("class") == "post")
			{
				$("#postNo").val($(this).attr($(this).attr("class")));
				$("#postForm").submit();
			}//if ~ else end 클릭된 것에 따라서 해당 프로필 or 글로 이동
		}); //notification tbody span tr click end
		
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
		
		//상단메뉴 (여행게시판, 자유게시판, 여행작가,고객센터, 내부관리자) 페이지 이동
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
	  	
	  	$(".report_btn").on("click", function(){
			if("${sMEM_NO}" == "")
			{
				alert("로그인이 필요한 기능입니다.");
				return false;
			}
			
			$("#writeMemNo").val($(".title_area").attr("journalMno"));	
			reportPopup();
		}); 
		
		$(".container_wrap").on("click", ".report_btn", function(){
			if("${sMEM_NO}" == "")
			{
				alert("로그인이 필요한 기능입니다.");
				return false;
			}
			
			$("#writeMemNo").val($(".title_area").attr("journalMno"));
			reportPopup();
		});
		
		// 여행게시판 작성자 번호 가져오기
		$("#journalWriteMemNo").val($(".title_area").attr("journalMno"));
		
		// 페이징 처리
		$(".paging").on("click", "div", function() {
			$($("#pages").val($(this).attr("pages")));
			reloadList();
		});
		
		// 댓글작성
		$("#addBtn").on("click", function() {
			if($("#memNo").val() == "") {
				alert("로그인 후 이용 바랍니다.");
				$("#cmtContents").val("");
			} else {
				if($.trim($("#cmtContents").val()) == "") {
					alert("내용을 넣어주세요.");
					$("#cmtContents").focus();
				} else {
					$("#getCmtContents").val($("#cmtContents").val());
					var params = $("#actionForm").serialize();
					
					$.ajax({
						url: "journalCmtAdds",
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
				alert("내용을 넣어주세요.");
				$("#editCmt").focus();
			} else {
				$("#getCmtContents").val($("#editCmt").val());
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "journalCmtEdits",
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
				alert("내용을 넣어주세요.");
				$("#editCmt").focus();
			} else {
				$("#getCmtContents").val($("#editCmt").val());
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "journalCmtEdits",
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
				alert("로그인 후 이용해 주시기 바랍니다.");
			}
			
		});
		// 댓글 답글 클릭 후 등록 버튼 클릭 시
		$("#cmtList").on("click", "#cmtAddBtn", function() {
			if($.trim($("#addCmt").val()) == "") {
				alert("내용을 넣어주세요.");
				$("#addCmt").focus();
			} else {
				$("#getCmtContents").val($("#addCmt").val());
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "journalCmtCmtAdds",
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
				
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "journalCmtDeletes",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						if(res.msg == "success") {
							reloadList();
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
		// 대댓글 삭제버튼 클릭 시
		$("#cmtList").on("click", ".cmt_cmt_delete_btn", function() {
			$("#cmtWriteMemNo").val($(this).parent().parent().parent().attr("cmtcmtno"));
			if(confirm("삭제하시겠습니까?")) {
				
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "journalCmtCmtDeletes",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						if(res.msg == "success") {
							reloadList();
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
		
		// 유저페이지 이동
		$("#goUserPage").on("click", function() {
			$("#userNo").val($("#journalWriteMemNo").val());
			
			$("#actionForm").attr("action", "userPage");
			$("#actionForm").submit();
		});
		
		// 메모 기본 css
		$(".sidebar .journal_nav:nth-child(1)").css("background-color", "#ffd666");
		// 시퀀스 왼쪽 버튼 클릭
		$("#left").on("click", function() {
			seq--;
			photoCnt--;
			if(seq == -1) {
				seq = cnt - 1;
				photoCnt = cnt;
				$(".sidebar .journal_nav:nth-child(1)").css("background-color", "")
				$(".sidebar .journal_nav:nth-child(" + photoCnt + ")").css("background-color", "#ffd666");
				reloadSequence();
			} else {
				$(".sidebar .journal_nav:nth-child(" + (photoCnt + 1) + ")").css("background-color", "");
				$(".sidebar .journal_nav:nth-child(" + photoCnt + ")").css("background-color", "#ffd666");
				reloadSequence();
			}
		});
		// 시퀀스 오른쪽 버튼 클릭
		$("#right").on("click", function() {
			seq++;
			photoCnt++
			if(seq == cnt) {
				seq = 0;
				photoCnt = 1;
				$(".sidebar .journal_nav:nth-child(" + cnt + ")").css("background-color", "");
				$(".sidebar .journal_nav:nth-child(" + photoCnt + ")").css("background-color", "#ffd666");
				reloadSequence();
			} else {
				$(".sidebar .journal_nav:nth-child(" + (photoCnt - 1) + ")").css("background-color", "");
				$(".sidebar .journal_nav:nth-child(" + photoCnt + ")").css("background-color", "#ffd666");
				reloadSequence();
			}
		});
	
		$("#wrap").on("click", ".del_btn", function() {
			if(confirm("삭제하시겠습니까?")) {
				
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "journalDeletes",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						if(res.msg == "success") {
							location.href = "journalBoard";
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
		
		//좋아요 버튼
		$(".reaction").on("click","img", function(){
			var like = $(this).attr("like");
			var params = $("#actionForm").serialize();
			console.log(like);
			//console.log(params);
			if(like == 0){ //좋아요 x : 좋아요 기능
				$.ajax({
					url:"journalLikes", 
					type: "post",
					dataType: "json",
					data : params,
					success: function(res){
						if(res.msg == "success")
						{
							console.log("좋");
							likeReload();
						}
					}, //success end
					error: function (request, status, error) {
						console.log(error);
					}//error end
				});//ajax end
			} else if(like == 1) { //좋아요 o : 좋아요 취소기능
				console.log("좋아요 취소");
				$.ajax({
					url:"journalLikeCancles", 
					type: "post",
					dataType: "json",
					data : params,
					success: function(res){
						if(res.msg == "success")
						{
							console.log("취소");
							likeReload();
						}
					}, //success end
					error: function (request, status, error) {
						console.log(error);
					}//error end
				});//ajax end
			}
		});
		// bmkcheck = 0 (북마크 체크 안한 상태) , 1 (북마크 체크되있는 상태)
		getBmkNo();
		$("#bmkBtn").on("click", function() {
			if($("#memNo").val() == "") {
				alert("로그인 후 이용 바랍니다.");
			} else if($("#bmkCnt").val() == 0) {
				alert("북마크 폴더를 생성해주세요.");
			} else {
				if($("#bmkBtn").attr("bmkcheck") == 0) {
					roadBmkFolder();
					$("#wrap").on("click", "#no", function() {
						$(".bmk_popup").remove();
						$(".bmk_bg").remove();
					});
					$("#wrap").on("click", ".folder_radio_box", function() {
						var bmkNo = $(this).attr("bmkno");
						$("#bmkNo").val(bmkNo);
						console.log("bmkNo >> " + $("#bmkNo").val());
					});
		
					
				} else {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						url: "journalBmkDeletes",
						type: "post",
						dataType: "json",
						data: params,
						success: function(res) {
							$("#bmkBtn").css("background-color", "");
							$(".bmkText").css("color", "");
							$("#bmkBtn").attr("bmkcheck","0");
						},
						error: function(request, status, error) {
							console.log(error);
						}
					}); // ajax end..
				}
				
			}
		});
		
		if($("#memNo").val() == $("#journalWriteMemNo").val() || $("#memNo").val() == 1) {
			var html = "";
			
			html += "<div class=\"btn_list\">";
			html += "<input type=\"button\" class=\"edit_btn\" value=\"수  정\" />";
			html += "<input type=\"button\" class=\"del_btn\" value=\"삭  제\" />";
			html += "</div>";
			$(".bnt_lists").html(html);
		}
		
		$(".edit_btn").on("click", function() {
			$("#actionForm").attr("action", "journalUpdate");
			$("#actionForm").submit();
		});
	}); // document ready end
</script>
</head>
<body>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>
<form action="#" id="checkForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${data.MEM_NO}"/>
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
			<img alt="search" src="./resources/images/search.png" class="search_icon" />
			<input type="text" class="search" placeholder="검색" />
			<select
				class="filter">
				<option value="0">통합검색</option>
				<option value="1">여행일지</option>
				<option value="2">자유게시판</option>
				<option value="3">닉네임</option>
			</select>
		</div>
		<div id="path_info">
			<span><img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span>여행일지
			</span> &nbsp;>&nbsp;&nbsp;여행일지 제목
		</div>
		<div class="title_area" journalMno="${data.MEM_NO}">
			<div class="title_left">
				<strong>${data.TITLE}</strong><br /> <br /> <br /> <span>일지번호</span><span>${data.JOURNAL_NO}</span><span>작성일</span> <span>${data.JOURNAL_DATE}</span>
				<span>조회</span><span>${data.HIT}</span> <span>좋아요</span><span>${data.JOURNAL_LIKE_CNT}</span> <span>댓글</span><span>${data.JOURNAL_CMT_CNT}</span>
				<span>시작일</span><span>${data.START_DATE}</span><span>종료일</span><span>${data.END_DATE}</span>
			</div>
			<div class="title_right">
				<span class="report_btn">신고하기</span>
			</div>
		</div>
		<div class="container_wrap">
			<div id="container">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="journalNo" name="journalNo" value="${param.journalNo}" />
					<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
					<input type="hidden" id="pages" name="pages" value="${pages}" />
					<input type="hidden" id="getCmtContents" name="getCmtContents"/>
					<input type="hidden" id="journalWriteMemNo" name="journalWriteMemNo" />
					<input type="hidden" id="cmtWriteMemNo" name="cmtWriteMemNo" />
					<input type="hidden" id="cmtNo" name="cmtNo" />
					<input type="hidden" id="userNo" name="userNo" />
					<input type="hidden" id="photoCnt" name="photoCnt" value="${cnt}" />
					<input type="hidden" id="bmkNo" name="bmkNo" />
					<input type="hidden" id="bmkCnt" name="bmkCnt" value="${bmkFolderCnt}" />
				</form>
				<div class="content_area">
					<div class="img_nav">
						<a>&#60;</a> <a>&#62;</a>
					</div>
					<span>/ ${cnt}</span> <span class="photo_cnt"></span>
					<div class="img_slide">
						<span class="left_arrow"><img alt="왼쪽" src="./resources/images/left_arrow.png" id="left" class="arrow_img"></span>
							<span id="nextImg"><img alt="사진" src="./resources/upload/${data.JOURNAL_PHOTO_PATH}" class="img_on"></span>
						<span class="right_arrow"><img alt="오른쪽" src="./resources/images/right_arrow.png" id="right" class="arrow_img"></span>
					</div>
					<div class="txt_area">
						<p>${data.CONTENTS}</p>
					</div>
				</div>
				<div class="category_area">
					<div class="category_label">카테고리</div>
					<div class="category_txt">${data.CATEGORY_NAME} > ${data.SUB_CATEGORY_NAME}</div>
				</div>
				<div class="hash_area">
					<div class="hash_label">해시태그</div>
					<div class="hash_txt" id="hashTxt">
						<ul>
							<c:forEach items="${hash}" var="h">
								<li> #${h.HASH_NAME}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="sub_profile">
					<div class="profile_info">
						<div>
							<c:choose>
								<c:when test="${data.MEM_PHOTO_PATH eq null}">
									<img alt="profile" src="./resources/images/profile3.png" class="profile_img">									
								</c:when>
								<c:otherwise>
									<img alt="profile" src="./resources/upload/${data.MEM_PHOTO_PATH}" class="profile_img">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="info">
							<span>${data.NIC}</span>
							<div class="grade">
								<c:choose>
									<c:when test="${data.GRADE_NO eq 2}">
										<img alt="icon" src="./resources/images/grade.png"> <span>${data.GRADE_NAME}</span>
									</c:when>
									<c:otherwise>
										<span>${data.GRADE_NAME}</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="cnt">
							
							</div>
						</div>
					</div>
					<div class="follow_btn_area">
						<input type="button" id="goUserPage"
							value="여 행 일 지&nbsp;&nbsp;&nbsp;&nbsp;모 아 보 기 &nbsp;&nbsp;&nbsp;&nbsp;&#62;" />
					</div>
				</div>
			</div>
			<div class="sidebar">
				<c:forEach items="${memoData}" var="d" varStatus="status">
					<div class="journal_nav" num="${status.count}">
						<div class="idx">${status.count}</div>
						<span>
							<p>${d.MEMO}</p>
						</span>
					</div>
				</c:forEach>
			</div>
			<div class="post_bottom">
				<div class="bnt_lists"></div>
				<div class="reaction">
					<ul>
						<li><img alt="좋아요" src="./resources/images/like.png" id="likeImg" class="like" like="0"><br/><span class="likeText">좋아요</span></li>
						<li><img alt="북마크" src="./resources/images/bmrk.png" id="bmkBtn" bmkcheck="0" bmkno=""><br /><span class="bmkText">북마크</span></li>
					</ul>
				</div>
			</div>
			<div class="cmt_area">
				<div class="cmt_top">
					<span>댓글 </span><span>${data.JOURNAL_CMT_CNT}</span><span> 개</span>
				</div>
				<div class="cmt_bottom">
					<textarea id="cmtContents" name="cmtContents" rows="8" cols="150" placeholder="댓글을 입력하십시오"></textarea>
					<input type="button" id="addBtn" value="등  록" />
				</div>
				<div class="cmt_list" id="cmtList"></div>
				<div class="paging"></div>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>
			POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
			Copyright© POPJOURNEY. All Rights Reserved.
		</p>
	</div>
	<form action="#" id="reportForm">
       		 <input type="hidden" name="MEM_NO" value="${sMEM_NO}" />
       		 <input type="hidden" id="writeMemNo" name="writeMemNo"/>
        	 <div id="pop"></div>   
    </form>
</body>
</html>
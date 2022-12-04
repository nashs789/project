<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일지 상세보기</title>
	<link href="static/css/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ400Css/PJ401C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
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

		var params = $("#checkForm").serialize();
		
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
	  	
	  	$(".report_btn").on("click", function(){
			if("${sMEM_NO}" == "") {
				alert("로그인이 필요한 기능입니다.");
				return false;
			}
			
			$("#writeMemNo").val($(".title_area").attr("journalMno"));	
			reportPopup();
		}); 
		
		$(".container_wrap").on("click", ".report_btn", function(){
			if("${sMEM_NO}" == "") {
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

			if(like == 0){ //좋아요 x : 좋아요 기능
				$.ajax({
					url:"journalLikes", 
					type: "post",
					dataType: "json",
					data : params,
					success: function(res){
						if(res.msg == "success") {
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
						if(res.msg == "success") {
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

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>

		<div id="path_info">
			<span>
				<img alt="메인페이지" src="static/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp;
			<span>
				여행일지
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
						<span class="left_arrow"><img alt="왼쪽" src="static/images/left_arrow.png" id="left" class="arrow_img"></span>
							<span id="nextImg"><img alt="사진" src="static/upload/${data.JOURNAL_PHOTO_PATH}" class="img_on"></span>
						<span class="right_arrow"><img alt="오른쪽" src="static/images/right_arrow.png" id="right" class="arrow_img"></span>
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
									<img alt="profile" src="static/images/profile3.png" class="profile_img">									
								</c:when>
								<c:otherwise>
									<img alt="profile" src="static/upload/${data.MEM_PHOTO_PATH}" class="profile_img">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="info">
							<span>${data.NIC}</span>
							<div class="grade">
								<c:choose>
									<c:when test="${data.GRADE_NO eq 2}">
										<img alt="icon" src="static/images/grade.png"> <span>${data.GRADE_NAME}</span>
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
						<li><img alt="좋아요" src="static/images/like.png" id="likeImg" class="like" like="0"><br/><span class="likeText">좋아요</span></li>
						<li><img alt="북마크" src="static/images/bmrk.png" id="bmkBtn" bmkcheck="0" bmkno=""><br /><span class="bmkText">북마크</span></li>
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
	<jsp:include page="../Frame/footer.jsp"></jsp:include>

	<form action="#" id="reportForm">
       		 <input type="hidden" name="MEM_NO" value="${sMEM_NO}" />
       		 <input type="hidden" id="writeMemNo" name="writeMemNo"/>
        	 <div id="pop"></div>   
    </form>
</body>
</html>
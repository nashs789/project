<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터-문의사항-세부</title>
		<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
		<link href="static/css/PJ900Css/PJ903C.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
		<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
		<script type="text/javascript" src="static/js/callServer.js"></script>
		<script type="text/javascript" src="static/js/callPopup.js"></script>
		<script type="text/javascript" src="static/js/common.js"></script>
		<script type="text/javascript" src="static/js/PJ900Js/PJ903S.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var popupText = "";
				$(".logo_photo").on("click", function() {
					location.href = "main";
				});
				
				$("#journalBoard").on("click", function(){
			    	location.href = "journalBoard";
			    });//postBoard click end
				
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
				
				$("#question").on("click", function() {
					location.href = "clientCenterQuestion";
				});
				$("#matter").on("click", function() {
					location.href = "clientCenterMatter";
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
						$("#actionForm").attr("action", "journal");
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

				$("#inputPW, #inputID").on("keypress", function(){
					$(".popup").remove();
					$(".bg").remove();
					if(event.keyCode == 13)
						$("#loginBtn").click();
				});//inputPW, inputID 
				//keypress end 엔터시 로그인 버튼 클릭
				
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
				
				// 로그인 정보 유지
				if("${sMEM_NO}" != "") {
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
				
				
			}); // document ready end..
			
			function redrawCmt(res) {
				var html = "";
				
				html = "<p class=\"admin_text_areas\">" + res.cmt_contents + "</p>"
				
				$(".admin_text_area").html(html);
			}
			
			function findBtnPopup()
			{
				var html = "";
				
				html +="<div class=\"popup\">";
				html +="	   <div class=\"popup_entity_txt\">무엇이 필요하십니까?</div>";
				html +="       <div class=\"btn_list\">";
				html +="       		<a href=\"findID\">ID찾기</a>";
				html +="      		<a href=\"findPW\">PW찾기</a>";
				html +="       <img src=\"./resources/images/cancel.png\" id=\"cancelImg\"/>";
				html +="    </div>";
				html +="</div>";
				html +="<div class=\"bg\"></div>";
				
				$("body").append(html);
				
				$("#cancelImg").on("click", function(){ 
					$(".popup").remove();
					$(".bg").remove();
				}); //cancelImg click end
			}//findBtnPopup end
			
			function commonPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열 
			{
				var html = "";
				
				html 	 +="<div class=\"popup\">";
				html	 +="	 <div class=\"popup_entity_txt\">"+ txt +"</div>";
				html	 +="     <div class=\"btn_list\">";
				html	 +="        <div id=\"yesBtn\">예</div>";
				html	 +="     </div>";
				html	 +="</div>";
				html	 +="<div class=\"bg\"></div>";
				
				$("body").append(html);
				
				$("#yesBtn").on("click", function(){ 
					$(".popup").remove();
					$(".bg").remove();
				}); //yesBtn click end
			}//commonPopup end
			
			function makeNotification(notification)
			{
				var html = ""; //알림 표현용
				var readCnt = 0;
				var html1 = "";  //알림 개수 표현용
				
				for(noti of notification)
				{
					if(noti.READ == 1)
					{
						html += "<tr class=\"notRead\" notRead=\"" + noti.NOTF_NO + "\">";
						readCnt++;
					}
					else
					{
						html += "<tr class=\"read\" read=\"" + noti.NOTF_NO + "\">";
					}
					
					var path ="";
					
					if(noti.PHOTO_PATH != null)
					{
						path = "resources/upload/"+noti.PHOTO_PATH;
					}
					else
					{
						path = "./resources/images/profile.png";
					}
					
					switch(noti.EVENT_NO)
					{
						case 0:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th><span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST +"</span>님이 당신을 팔로우 하셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 1:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[여행일지]<span class=\"journal\" journal=\"" + noti.JOURNAL_NO + "\">" + noti.JTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.JOURNAL_NO + "\">" + noti.JCONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;	
						case 2:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[게시글]<span class=\"post\" post=\"" + noti.POST_NO + "\">" + noti.BTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.POST_NO + "\">" + noti.BCONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 3:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[여행일지]<span class=\"journal\" journal=\"" + noti.JCJOURNAL_NO + "\">" + noti.JCTITLE + "</span>에  <span class=\"user\" user=" + noti.NOTF_MEM_NO + ">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.JCJOURNAL_NO + "\">" + noti.JUP_CONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 4:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>[게시글]<span class=\"post\" post=\"" + noti.BCPOST_NO + "\">" + noti.BCTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.BCPOST_NO + "\">" + noti.BUP_CONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 5:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.JCCMEM_NO + "\"></th>";
							html +=" 	<th>내 댓글<span class=\"journal\" journal=\"" + noti.CCJOURNAL_NO + "\">" + noti.UPJCONTENTS + "</span>에  <span class=\"user\" user=\"" + noti.JCCMEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.CCJOURNAL_NO + "\">" + noti.DOWNJCONTENTS + "...</span> 답글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 6:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.BCCMEM_NO + "\"></th>";
							html +=" 	<th>내 댓글<span class=\"post\" post=\"" + noti.CCPOST_NO + "\">" + noti.UPBCONTENTS + "</span>에  <span class=\"user\" user=\"" + noti.BCCMEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.CCPOST_NO + "\">" + noti.DOWNBCONTENTS + "...</span> 댓글을 다셨습니다</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 7:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>관리자가 내가 올린 [문의사항]<span class=\"qna\" qna=\"" + noti.GBN_NO + "\">" + noti.QTITLE + "</span>에 답글을 남기셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 8:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>관리자가 내가 올린 [문의사항]<span class=\"qna\" qna=\"" + noti.GBN_NO + "\">" + noti.QTITLE + "</span>에 답글을 수정 하셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 9:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>내가 작성한 [여행일지]<span class=\"journal\" journal=\"" + noti.GBN_NO + "\">" + noti.LIKE_TITLE + "</span> 를 좋아요 누르셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						case 10:
							html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
							html +=" 	<th>내가 작성한 [게시글]<span class=\"post\" post=\"" + noti.GBN_NO + "\">" + noti.LIKE_TITLE2 + "</span> 를 좋아요 누르셨습니다.</th>";
							html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
							html +=" </tr>";
							break;
						default:
							console.log("여긴 뭐넣을까?");
					}
				}
				html1 = "<div id=\"notificationTxt\">" + readCnt + "<div>";
				
				$("#cnt").prepend(html1);
				$("#notification tbody").html(html);
			} //makeNotification end
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
	<form action="userPage" id="userForm" method="post">
		<input type="hidden" id="userNo" name="userNo" value=""/>
	</form>
	<form action="post" id="postForm" method="post">
		<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
		<input type="hidden" id="postNo" name="postNo" value=""/>
		<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
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
						<div class="btns"> <!-- 밑에 logins와 연동 -->
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
			<div id="footer">
				<p>
					POPJOURNEY<br/>
					GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br/>
					Copyright© POPJOURNEY. All Rights Reserved.
				</p>
			</div>			
		</div>
	</body>
</html>
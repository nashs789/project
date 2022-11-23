<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의사항 작성</title>
		<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
		<link href="static/css/PJ900Css/PJ900C.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
		<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
		<script type="text/javascript" src="static/script/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="static/js/callServer.js"></script>
		<script type="text/javascript" src="static/js/callPopup.js"></script>
		<script type="text/javascript" src="static/js/common.js"></script>
		<script type="text/javascript" src="static/js/PJ900Js/PJ900S.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수
				
				//로그인 상태 확인
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
			  	});
				
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
				
			}); // document ready end..
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
	<div id="footer">
		<p>
			POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
			Copyright© POPJOURNEY. All Rights Reserved.
		</p>
	</div>
	</body>
</html>
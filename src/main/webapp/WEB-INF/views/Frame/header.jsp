<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/Common/popup.css" rel="stylesheet" type="text/css">
	<link href="static/css/Frame/header.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" language="JavaScript" src="static/script/jquery/jquery.i18n.properties.js"></script>
	<script type="text/javascript" src="static/js/Common/popup.js"></script>
	<script type="text/javascript" src="static/js/Common/common.js"></script>
	<script type="text/javascript" src="static/js/Common/callServer.js"></script>
	<script type="text/javascript" src="static/js/Frame/header.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			chkStatHeader();
			setEventHeader();

			/*
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

			$("#notification tbody").on("click", "span, tr, img", function(){
				if($(this).attr("class") == "notRead")
				{
					$("#NOTF_NO").val($(this).attr($(this).attr("class")));

					var params = $("#notificationForm").serialize();

					$.ajax({
						url: "updateCommonReads",
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

			$("#inputPW, #inputID").on("keypress", function(){
				$(".popup").remove();
				$(".bg").remove();
				if(event.keyCode == 13)
					$("#btn_login").click();
			});//inputPW, inputID
			//keypress end 엔터시 로그인 버튼 클릭

			*/
		}); // document ready end

		function chkStatHeader(){
			//로그인 상태 확인
			if('${sMemVo.mem_no}' != ""){
				$(".logins").css("display", "none");
				$(".btns").css("display", "inline-block");
				//로그인 상태에 따라서 우측 상단 제어

				var path = ""; //사진경로 담아줄 변수

				if('${photo_path}' != "") {
					//path = "resources/upload/" + "{sPHOTO_PATH}";

					//$("#profilePhoto").attr("src", path);
				} else {
					path = "static/images/profile.png";

					$("#profilePhoto").attr("src", path);
				}//if ~ else end

				if('${sMemVo.grade_no}' == "0") {
					$("#admin").show();
				}//등급에 따라서 내부 관리자 보이기

				/*
				var params = $("#memForm").serialize();

				$.ajax({
					url: "selectCommonNotifications",
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
				 */
			}//if end -> 로그인 상태여부에 따른 처리
		} // function chkStat end

		function setEventHeader(){
			$("#sel_language").on("change", function(){
				setChangeLanguage($("#sel_language").val());
			});

			//로그인 버튼 클릭
			$("#btn_login").on("click", function(){
				if(trim("inp_header_id") == "") {
					commonPopup('<spring:message code="header.alert.inputId"/>');
				} else if(trim("inp_header_pw") == "") {
					commonPopup('<spring:message code="header.alert.inputPw"/>');
				} else {
					commonLogin();
				}
			}); //btn_login click end

			// 로그아웃 버튼 클릭
			$("#logoutBtn").on("click", function(){
				commonLogout();
			}); //logoutBtn click end

			$("#find").on("click", function(){
				findBtnPopup();
			}); //find click end

			$("#profilePhoto").on("click", function(){
				$("#notification").css("display", "none");
				if($("#profileSlidedown").css("display") == "block") {
					$("#profileSlidedown").css("display", "none");
				} else {
					$("#profileSlidedown").css("display", "block");
				}
			}); //profilePhoto click end
			//프로필 사진 클릭 시 하위메뉴 나왔다 사라졌다 & 알람 팝업은 안보이도록

			$("#notificationPhoto").on("click", function(){
				$("#profileSlidedown").css("display", "none");
				if($("#notification").css("display") == "block") {
					$("#notification").css("display", "none");
				} else {
					$("#notification").css("display", "inline-block");
				}
			}); //notificationPhoto click end
			//알람 아이콘 클릭 시 알람 팝업 나왔다 사라졌다 & 프로필 하위메뉴는 안보이도록

			// 메인검색창 넘어가는 부분
			$(".search_icon").on("click", function() {
				if($("#sel_main_search_filter").val() == 0) {
					$("#goSearch").attr("action", "PJ600M");
				} else if($("#sel_main_search_filter").val() == 1) {
					$("#goSearch").attr("action", "PJ601M");
				} else if($("#sel_main_search_filter").val() == 2) {
					$("#goSearch").attr("action", "PJ602M");
				} else if($("#sel_main_search_filter").val() == 3) {
					$("#goSearch").attr("action", "PJ603M");
				} else {
					$("#goSearch").attr("action", "PJ604M");
				}
				$("#goSearch").submit();
			});

			// =============== location.href ===============

			// 마이페이지
			$("#myPage").on("click", function(){
				location.href="PJ500M";
			});

			// 타임라인 페이지
			$("#timeline").on("click", function(){
				location.href="PJ700M";
			});

			// 프로필수정 페이지
			$("#editProfile").on("click", function(){
				location.href="PJ204M";
			});

			// 회원정보수정 페이지
			$("#editInfo").on("click", function(){
				location.href="PJ203M";
			});

			// 약관 동의 페이지
			$("#join").on("click", function(){
				location.href="PJ200M";
			});

			// 여행게시판 페이지
			$("#journalBoard").on("click", function(){
				location.href="PJ400M";
			});

			// 자유게시판 페이지
			$("#community").on("click", function(){
				location.href="PJ300M";
			});

			// 여행작가 랭킹 페이지
			$("#travelWriter").on("click", function() {
				location.href="PJ800M";
			});

			// 고객센터 페이지
			$("#clientCenter").on("click", function() {
				location.href="PJ900M";
			});

			// 내부관리자 페이지
			$("#admin").on("click", function() {
				location.href="PJ000M";
			});

			// 알람 모아보기 페이지
			$("#notificationMore").on("click", function(){
				location.href="PJ701M";
			});

			// 마이페이지 북마크 페이지
			$("#bookmarkPhoto").on("click", function(){
				location.href="PJ501M";
			});
		} // function setHeaderEvent end

		function setChangeLanguage(language){
			jQuery.i18n.properties({
				name:'messages',
				path:'/bundle/',
				mode:'map',
				language: language,
				callback: function () {
					$(".site_name").text(getMsgI18n("header.siteName"));
				}
			});
		}
	</script>
</head>
<body>
	<div id="header">
		<div class="banner">
			<div class="top">
				<select id="sel_language" style="position: absolute">
					<option value="ko">ko</option>
					<option value="en">en</option>
				</select>
				<div class="logo_area">
					<a href="PJ100M"><img alt="<spring:message code="header.text.logo"/>" src="static/images/logo.png" class="logo_photo"></a>
					<div class="site_name"><spring:message code="header.siteName"/></div>
				</div>
				<div class="btns">
					<ul>
						<li><img alt="bell" src="static/images/bell.png" id="notificationPhoto">
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
										<th colspan="3" id="notificationMore">...<spring:message code="header.text.more"/></th>
									</tr>
									</tfoot>
								</table>
							</div></li>
						<li><img alt="bookmark" src="static/images/bmk.png" id="bookmarkPhoto"></li>
						<li><img alt="프로필" src="" id="profilePhoto">
							<ul id="profileSlidedown">
								<li id="myPage"><spring:message code="header.userMenu.myPage"/></li>
								<li id="timeline"><spring:message code="header.userMenu.timeline"/></li>
								<li id="editProfile"><spring:message code="header.userMenu.editProfile"/></li>
								<li id="editInfo"><spring:message code="header.userMenu.editInfo"/></li>
								<li id="logoutBtn"><spring:message code="header.userMenu.logoutBtn"/></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="logins">
					<div class="sub_login1">
						<form action="#" id="loginForm">
							<input type="button" id="btn_login" value="<spring:message code="header.text.login"/>" />
							<input type="password" id="inp_header_pw" name="inputPW" placeholder="<spring:message code="header.text.pw"/>" />
							<input type="text" id="inp_header_id" name="inputID" placeholder="<spring:message code="header.text.id"/>" />
						</form>
					</div>
					<div class="sub_login2">
						<span id="join"><spring:message code="header.text.join"/></span>
						<span id="find"><spring:message code="header.text.findIdAndPw"/></span>
					</div>
				</div>
			</div>
		</div>
		<nav class="menu">
			<ul>
				<li id="journalBoard"><spring:message code="header.bannerMenu.journalBoard"/></li>
				<li id="community"><spring:message code="header.bannerMenu.community"/></li>
				<li id="travelWriter"><spring:message code="header.bannerMenu.travelWriter"/></li>
				<li id="clientCenter"><spring:message code="header.bannerMenu.clientCenter"/></li>
				<li id="admin"><spring:message code="header.bannerMenu.admin"/></li>
			</ul>
		</nav>
		<form action="#" id="goSearch" method="post" >
			<img alt="search" src="static/images/search.png" class="search_icon"/>
			<input type="text" class="search" id="inp_main_search_txt" name="inp_main_search_txt" value="${param.inp_main_search_txt}" placeholder="검색">
			<select class="filter" id="sel_main_search_filter" name="sel_main_search_filter" >
				<option value="0" selected="selected"><spring:message code="header.text.search"/></option>
				<option value="1"><spring:message code="header.text.journey"/></option>
				<option value="2"><spring:message code="header.text.hashTag"/></option>
				<option value="3"><spring:message code="header.text.community"/></option>
				<option value="4"><spring:message code="header.text.nicName"/></option>
			</select>
		</form>
	</div> <!-- header end -->
</body>
</html>
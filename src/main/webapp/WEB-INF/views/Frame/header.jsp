<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link href="static/css/Frame/header.css" rel="stylesheet" type="text/css">
	<link href="static/css/Common/popup.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/js/Common/popup.js"></script>
	<script type="text/javascript" src="static/js/Frame/header.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			chkStat();
			setHeaderEvent();

			/*
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
			*/

			/* 로그아웃
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
			*/
		}); // document ready end

		function chkStat(){
			/*
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
					path = "static/images/profile.png";

					$("#profilePhoto").attr("src", path);
				}//if ~ else end
				//프로필 사진이 DB에 있는경우 저장된 사진으로, 없는 경우 기본 사진으로

				if("${sGRADE_NO}" == "0")
				{
					$("#admin").show();
				}//등급에 따라서 내부 관리자 보이기

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
			}//if end -> 로그인 상태여부에 따른 처리
			*/
		} // function chkStat end

		function setHeaderEvent(){
			$("#find").on("click", function(){
				findBtnPopup();
			}); //find click end

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
			//알람 아이콘 클릭 시 알람 팝업 나왔다 사라졌다 & 프로필 하위메뉴는 안보이도록

			// 메인검색창 넘어가는 부분
			$(".search_icon").on("click", function() {
				if($("#mainSearchFilter").val() == 0) {
					$("#goSearch").attr("action", "PJ600M");
					$("#goSearch").submit();
				} else if($("#mainSearchFilter").val() == 1) {
					$("#goSearch").attr("action", "PJ601M");
					$("#goSearch").submit();
				} else if($("#mainSearchFilter").val() == 2) {
					$("#goSearch").attr("action", "PJ602M");
					$("#goSearch").submit();
				} else if($("#mainSearchFilter").val() == 3) {
					$("#goSearch").attr("action", "PJ603M");
					$("#goSearch").submit();
				} else {
					$("#goSearch").attr("action", "PJ604M");
					$("#goSearch").submit();
				}
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
	</script>
</head>
<body>
	<div id="header">
		<div class="banner">
			<div class="top">
				<div class="logo_area">
					<a href="#"><img alt="로고" src="static/images/logo.png" class="logo_photo"></a>
					<div class="site_name">우리들의 여행일지</div>
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
										<th colspan="3" id="notificationMore">...더보기</th>
									</tr>
									</tfoot>
								</table>
							</div></li>
						<li><img alt="bookmark" src="static/images/bmk.png" id="bookmarkPhoto"></li>
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
			<img alt="search" src="static/images/search.png" class="search_icon"/>
			<input type="text" class="search" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" placeholder="검색">
			<select class="filter" id="mainSearchFilter" name="mainSearchFilter" >
				<option value="0" selected="selected">통합검색</option>
				<option value="1">여행일지</option>
				<option value="2">해시태그</option>
				<option value="3">자유게시판</option>
				<option value="4">닉네임</option>
			</select>
		</form>
	</div> <!-- header end -->
</body>
</html>
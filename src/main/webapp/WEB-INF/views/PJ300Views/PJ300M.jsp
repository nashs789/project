<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ300Css/PJ300C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ300Js/PJ300S.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var popupText = "";
	
	if("${sMEM_NO}" != "") { // 로그인 상태
		$(".btns").css("display","inline-block");
		$(".sub_profile").css("display","block");
		$(".logins, .sub_area").css("display","none");
	} else { // 비 로그인 상태
		$(".logins, .sub_area").css("display","inline-block");
		$(".btns, .sub_profile").css("display","none");
	}
	//관리자 외 내부관리자 X
	if("${sMEM_NO}" != "1"){
		$("#admin").css("display","none");
	}
	
	var path = "";
	var path2 = "";
	
	if("${sPHOTO_PATH}" != "")
	{
		path = "resources/upload/" + "${sPHOTO_PATH}";
		
		$("#profilePhoto").attr("src", path);
		$(".profile_img").attr("src", path);
	}
	else
	{	
		$("#profilePhoto").attr("src", "./resources/images/profile.png");
		$(".profile_img").attr("src", "./resources/images/profile3.png");
	}//if ~ else end
	
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
	
	$(".login_btn").on("click", function () {
		if($.trim($("#inputID").val())==""){
			popupText = "아이디를 입력해 주세요.";
			commonPopup(popupText);
			$("#inputID").focus();
		} else if ($.trim($("#inputPW").val())=="") {
			popupText = "비밀번호를 입력해 주세요.";
			commonPopup(popupText);
			$("#inputPW").focus();
		} else {
			var params = $("#loginForm").serialize();
			$.ajax({
				url:"logins", 
				type: "post", 
				dataType: "json", 
				data : params, 
				success: function(res){
					if(res.msg == "success")
					{
						location.reload();						
					}
					else
					{
						popupText = "ID와 PW가 일치하지 않습니다.";
						commonPopup(popupText);
						$("#inputID").val("");
						$("#inputPW").val("");
					}
				}, 
				error: function (request, status, error) {
					console.log(error);
				}
			});
		}
	});//login_btn end
	
	$("#categoryNo").val(0);
	$("#gradeNo").val(0);
	if("${param.boardSearchFilter}" != ""){
		$("#boardSearchFilter").val("${param.boardSearchFilter}");
	} 
	reloadList();
	makePathInfo();
	$(".logo_photo").on("click", function() {
  		location.href = "main";
  	});
	$("#journalBoard").on("click", function() {
  		location.href = "journalBoard";
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
	$("#newPost").on("click", function() {
		if("${sMEM_NO}" == "") { // 비로그인 상태
			popupText = "로그인이 필요한 서비스입니다.";
			commonPopup(popupText);
		} else {
			location.href = "postWrite";
		}
  		
  	});
	
	$("#searchBtn").on("click", function () {
		$("#Pages").val(1);
		reloadList();
		makePathInfo();
	});
	
	$(".paging").on("click", "span", function () {
		$("#Pages").val($(this).attr("name"));
		reloadList();
		makePathInfo();
	});	
	
	$(".board_list").on("click", "td", function(){
		if($(this).attr("class") == "title")
		{
			$("#postNo").val($(this).attr($(this).attr("class")));
			$("#postForm").submit();
		}
	}); //board_list click td end
	
	$(".board_list").on("click", "td", function(){
		if($(this).attr("class") == "user")
		{
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		}
	}); //board_list click td end
	
	$(".order_list").on("click", "li", function () {
		$(".categoryNo").css("color","#2e3459");
		$(".gradeNo").children("img").css("background-color","#2e3459");
		$("#postAll").children("span").children("img").css("background-color","#f37321");

		$("#gradeNo").val(0);
		$("#categoryNo").val($(this).attr($(this).attr("class")));
		if($("#categoryNo").val() == 1){ //공지사항
			noticeList();
			$(this).css("color","#f37321");
			$(".gradeNo").children("img").css("cursor","auto");
		} else {
			$(this).css("color","#f37321");
			$(".gradeNo").children("img").css("cursor","pointer");
			$("#Pages").val(1);
			reloadList();
		}
	}); //order_list li  end
	$(".left_nav").on("click", "span", function(){ //작성자 여행등급 필터
		$(".gradeNo").children("img").css("background-color","#2e3459");
		console.log($(this).attr($(this).attr("class")));
		$("#gradeNo").val($(this).attr($(this).attr("class")));
		if($("#categoryNo").val() != 1){ //전체보기, 여행꿀팁, Q&A, 잡담
			console.log($(this).children());
			$(this).children("img").css("background-color","#f37321");
			$("#Pages").val(1);
			reloadList();
		} else {
			$("#postAll").children("span").children("img").css("background-color","#f37321");
		}
	}); //left_nav span click end
	 
	$(".right_nav").on("click", "span", function(){ //내가 쓴 글, 댓글쓴 글, 글쓰기
		console.log($(this).attr($(this).attr("class")));
		$(".gradeNo").children("img").css("background-color","#2e3459");
		$(this).children("img").css("background-color","#f37321");
		$("#gradeNo").val($(this).attr($(this).attr("class")));
		if("${sMEM_NO}" == "") { // 비로그인 상태
			popupText = "로그인이 필요한 서비스입니다.";
			commonPopup(popupText);
			$(".gradeNo").children("img").css("background-color","#2e3459");
		} else {
			reloadList();
		}	
	}); //right_nav span click end
	
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
}); //document ready end

</script>
</head>
<body>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
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
		<div id="path_info">
			<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 자유게시판 </span>
			<div class="make_path_info">
				 &nbsp;&nbsp;>&nbsp;&nbsp;
			</div>
		</div>
		<div class= "top_msg">
			<span>자유게시판</span>
			<span>다른 사용자들과 의견을 나누세요.</span>
		</div>
		<img id="comBg" src="./resources/images/board2.png">
		<div class="sub_area">
			
			
		</div>
		
		<div id="container">
			<div class="top_area">
				<div class="sub_profile">
					<div id="tempArea">
						<img alt="profile" src="./resources/images/profile3.png" class="profile_img">
					</div>
					<div class="info">
						<span>${sNIC}</span>
						<div class="grade">
							<img alt="icon" src="./resources/images/grade.png"> 
							<c:choose>
							<c:when test="${sGRADE_NO eq 0}">
							<span>관리자</span>
							</c:when>
							<c:when test="${sGRADE_NO eq 1}">
							<span>여행꾼</span>
							</c:when>
							<c:when test="${sGRADE_NO eq 2}">
							<span>여행작가</span>
							</c:when>
							</c:choose>
						</div>
						<div class="cnt">

						</div>
					</div>
				</div>
			</div>
			<div class="category_nav">
			<nav class="order_list">
				<ul>
					<li class="categoryNo" categoryNo="0">전체보기</li>
					<li class="categoryNo" categoryNo="1">공지사항</li>
					<li class="categoryNo" categoryNo="2">여행꿀팁</li>
					<li class="categoryNo" categoryNo="3">Q & A</li>
					<li class="categoryNo" categoryNo="4">잡&nbsp;&nbsp;&nbsp;담</li>
				</ul>
			</nav>
		</div>
			<div class="board_list_wrap">
				<div class="board_menu">
					<nav class="left_nav">
						<ul>
							<li id="postAll"><span class="gradeNo" gradeNo="0"><img alt="bookmark" src="./resources/images/all.png"></span><br />전체보기</li>
							<li id="postGrade2"><span class="gradeNo" gradeNo="2"><img alt="bookmark" src="./resources/images/writer.png"></span><br />여행작가</li>
							<li id="postGrade1"><span class="gradeNo" gradeNo="1"><img alt="작성자" src="./resources/images/user2.png"></span><br />여행꾼</li>
						</ul>
					</nav>
					<nav class="right_nav">
						<ul>
							<li><span class="gradeNo" gradeNo="3"><img alt="bookmark" src="./resources/images/doc.png"></span><br />내가 쓴 글</li>			
							<li id="newPost"><img alt="bookmark" src="./resources/images/pen.png"><br />글쓰기</li>
						</ul>
					</nav>
				</div>
	
				<table class="board_list">
					<colgroup>
						<col width="5%" /> <!-- 글번호 -->
						<col width="10%" /> <!-- 카테고리 -->
						<col width="30%" /> <!-- 제목 -->
						<col width="10%" /> <!-- 등급 -->
						<col width="10%" /> <!-- 닉네임 -->
						<col width="10%" /> <!-- 작성일 -->
						<col width="5%" /> <!-- 조회 -->
						<col width="5%" /> <!-- 좋아요 -->
					</colgroup>
					<caption>게시판 목록</caption>
					<thead>
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>등급</th>
							<th>닉네임</th>
							<th>작성일</th>
							<th>조회</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div class="paging_wrap">
					<div class="paging"></div>
					<div class="board_search">
					<form action="#" id="boardForm">
						<img alt="search" src="./resources/images/search.png" class="search_icon" id="searchBtn"/>
							<input type="hidden" id="Pages" name="Pages" value="${Pages}"/>
							<input type="hidden" id="nfirstPage" name="nfirstPage" value="1"/> <!-- n이 붙은건 공지 페이지 -->
							<input type="hidden" id="nlastPage" name="nlastPage" value="5"/>
							<input type="hidden" id="categoryNo" name="categoryNo" value=""/>
							<input type="hidden" id="gradeNo" name="gradeNo" value=""/>
							<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
							<input type="hidden" id="memGradeNo" name="memGradeNo" value="${sGRADE_NO}"/>
				<input type="text" class="search" name="boardSearchTxt" placeholder="검색" value="${param.searchTxt}"> 
						<select class="filter" id="boardSearchFilter" name="boardSearchFilter">
							<option value="0">통합검색</option>
							<option value="1">제목</option>
							<option value="2">닉네임</option>
						</select>
						</form>
		
					</div>
				</div> <!-- PAGING_WRAP END -->
			</div>
		</div>
	</div>
	<div id="footer">
			<p>
				POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
				Copyright© POPJOURNEY. All Rights Reserved.
			</p>
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일지작성</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ400Css/PJ402C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ400Js/PJ402S.js"></script>
	<script type="text/javascript">
$(document).ready(function() {
	var index = 0;
	var photo = ["", "", "", "", ""];
	var memo = ["", "", "", "", ""];
	var contents = ["", "", "", "", ""];
	
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
	
	$(".pref_filter").on("change", function(){
		var html = "";
		
		if($(".pref_filter").val() == 2)
		{
			html +=" 	<option value=\"0\">도보</option>";
			html +=" 	<option value=\"1\">자가용</option>";
			html +=" 	<option value=\"2\">버스</option>";
			html +=" 	<option value=\"3\">기차</option>"; 
			html +=" 	<option value=\"4\">배 </option>";
			html +=" 	<option value=\"5\">자전거</option>";
		}
		if($(".pref_filter").val() == 3)
		{
			html +=" 	<option value=\"0\">바다</option>";
			html +=" 	<option value=\"1\">계곡</option>";
			html +=" 	<option value=\"2\">산</option>";
			html +=" 	<option value=\"3\">유적지</option>"; 
			html +=" 	<option value=\"4\">박물관 </option>";
			html +=" 	<option value=\"5\">테마파크</option>";
			html +=" 	<option value=\"6\">전망대</option>";
			html +=" 	<option value=\"7\">건축물</option>";
			html +="	<option value=\"8\">거리광장</option>";
			html +=" 	<option value=\"9\">시장</option>"; 
		}
		if($(".pref_filter").val() == 4)
		{
			html +=" 	<option value=\"0\">농장</option>";
			html +=" 	<option value=\"1\">공연</option>";
			html +=" 	<option value=\"2\">축제</option>";
			html +=" 	<option value=\"3\">마사지</option>"; 
			html +=" 	<option value=\"4\">온천 </option>";
			html +=" 	<option value=\"5\">투어</option>";
			html +=" 	<option value=\"6\">야외활동</option>";
			html +=" 	<option value=\"7\">식도락</option>";
		}
		
		$(".category_filter").html(html);
	});//pref_filter change end
	
	var save = 0;
	
	$(".date_nav ul").on("click", "li", function(){
		
		save = 1;
		
		$(".date_nav ul li").css("background-color", "white");
		$(".date_nav ul li").css("color", "black");
		
		contents[index] = $("#inputContents").val();
		memo[index] = $(".input_memo").val();
		
		index = $(this).attr($(this).attr("class"));
		$("#inputContents").val(contents[index]);
		$(".input_memo").val(memo[index]);
		$("#fileName").html(photo[index].substring(20));
		
		if(photo[index] != "")
		{
			var html = "";
			var path = "resources/upload/"+ photo[index];
			html = "<img src=\""+path+"\" id=\"photo\"/>";
			$("#photoArea").html(html);
		}
		else
		{
			$("#photoArea").html("");
		}
		
		if($(this).attr($(this).attr("class")) == 0)
		{
			$(".date_nav ul li:first-child").css("background-color", "#2e3459");
			$(".date_nav ul li:first-child").css("color", "white");
		}
		else if($(this).attr($(this).attr("class")) == 1)
		{
			$(".date_nav ul li:nth-child(2)").css("background-color", "#2e3459");
			$(".date_nav ul li:nth-child(2)").css("color", "white");
		}
		else if($(this).attr($(this).attr("class")) == 2)
		{
			$(".date_nav ul li:nth-child(3)").css("background-color", "#2e3459");
			$(".date_nav ul li:nth-child(3)").css("color", "white");
		}
		else if($(this).attr($(this).attr("class")) == 3)
		{
			$(".date_nav ul li:nth-child(4)").css("background-color", "#2e3459");
			$(".date_nav ul li:nth-child(4)").css("color", "white");
		}
		else
		{
			$(".date_nav ul li:last-child").css("background-color", "#2e3459");
			$(".date_nav ul li:last-child").css("color", "white");
		}
	}); //date_nav ul click end
	
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
	
	$("#photoBtn").on("click", function(){
		$("#att").click();
	}); //photoBtn
	
	$("#att").on("change", function() {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
		
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
				success : function(res) {
				if(res.result == "SUCCESS") {
					// 올라간 파일명 저장
					if(res.fileName.length > 0) 
					{
						photo[index] = res.fileName[0];
						
						var path = "resources/upload/"+res.fileName[0];
						html = "<img src=\""+path+"\" id=\"photo\"/>";
						$("#photoArea").html(html);
					}
				} 
				else 
				{
					popupText = "파일 업로드중 문제 발생.";
					commonPopup(popupText);
				}
			},
			error : function() {
				popupText = "파일 업로드중 문제 발생.";
				commonPopup(popupText);
			}
		}); // ajaxForm end
		fileForm.submit();
	}); //att change end
	
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
	
	$(".enroll_btn").on("click", function(){
		$("#dateNav ul li:first-child").click();

		if($.trim($(".input_title").val()) == "")
		{
			popupText = "제목을 입력하세요.";
			commonPopup(popupText);
			return false;
		}
		else if($(".pref_filter option:selected").val() == 0)
		{
			popupText = "선호도를 선택하세요.";
			commonPopup(popupText);
			return false;
		}
		
		if(save == 0)
		{
			contents[0] = $("#inputContents").val();
			memo[0] = $(".input_memo").val();
		}
		var c = "#contents";
		var m = "#memo";
		var p = "#photo";
		
		for(var i = 0; i < 5; i++)
		{
			c += i;
			m += i;
			p += i;
			
			$(c).val(contents[i]);
			$(m).val(memo[i]);
			$(p).val(photo[i]);
						
			c = "#contents";
			m = "#memo";
			p = "#photo";
		}
		
		if(contents[0] == "" || memo[0] == "" || photo[0] == "")
		{
			popupText = "Diary1을 채워주세요.";
			commonPopup(popupText);
			return false;
		}
		
		var params = $("#addJournalForm").serialize();
		
		$.ajax({
			url: "addJournals",
			data: params,
			dataType:"json",
			type: "post",
			success:function(result)
			{
				location.href ="journalBoard";
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //enroll_btn click end
	
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
  	}); //logoutBtn click end
  	
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
	<form action="#" id="notificationForm">
		<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
	</form>
	<form action="userPage" id="userForm" method="post">
		<input type="hidden" id="userNo" name="userNo" value=""/>
	</form>
	<form action="journal" id="journalForm" method="post">
		<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
		<input type="hidden" id="journalNo" name="journalNo" value=""/>
	</form>
	<form action="post" id="postForm" method="post">
		<input type="hidden" id="postNo" name="postNo" value=""/>
		<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
		<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
	</form>
	<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
		<input type="file" name="att" id="att" /> <!-- attach : 첨부 -->
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
			<span> <a href="#"><img alt="메인페이지" src="./resources/images/home.png"
					class="home_icon"></a>
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> <a href="#">여행일지</a>
			</span> &nbsp;>&nbsp;&nbsp;일지 작성
		</div>
		<div id="container">
		<form action="journalBoard" id="addJournalForm" method="post">
			<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
			
			<input type="hidden" id="contents0" name="contents"/>
			<input type="hidden" id="memo0" name="memo"/>
			<input type="hidden" id="photo0" name="photo"/>
			
			<input type="hidden" id="contents1" name="contents"/>
			<input type="hidden" id="memo1" name="memo"/>
			<input type="hidden" id="photo1" name="photo"/>
			
			<input type="hidden" id="contents2" name="contents"/>
			<input type="hidden" id="memo2" name="memo"/>
			<input type="hidden" id="photo2" name="photo"/>
			
			<input type="hidden" id="contents3" name="contents"/>
			<input type="hidden" id="memo3" name="memo"/>
			<input type="hidden" id="photo3" name="photo"/>
			
			<input type="hidden" id="contents4" name="contents"/>
			<input type="hidden" id="memo4" name="memo"/>
			<input type="hidden" id="photo4" name="photo"/>
			<div class="title_area">
				<div class="title_top">
					<strong class="title_font">1. 제목 입력</strong> <span>필수 입력 사항</span>
				</div>
				<div class="title_bottom">
					<input type="text" class="input_title" name="inputTitle" placeholder="여행일지 제목"
						size="50" maxlength="30" autofocus required />
				</div>
			</div>
			<div class="date_area">
				<div class="title_top">
					<strong class="title_font">2. 일정 추가</strong> <span>필수 입력 사항</span>
				</div>
				<div class="schedule">
					<nav class="date_nav" id="dateNav">
							<ul>
								<li class="diary" diary="0">DIARY 1</li>
								<li class="diary" diary="1">DIARY 2</li>
								<li class="diary" diary="2">DIARY 3</li>
								<li class="diary" diary="3">DIARY 4</li>
								<li class="diary" diary="4">DIARY 5</li>
							</ul>
					</nav>
				</div>
				<div class="write_area">
					<span class="text_area"><textarea rows="50" cols="15" id="inputContents" class="text_area_style"></textarea></span>
				</div>
			</div>
			<div class="spot_area">
				<div class="title_top">
					<strong class="title_font">3. 메모 & 사진 추가</strong> <span>필수 입력 사항</span>
				</div>
				<div class="help">
					<span>일정 선택 후 수정, 삭제가 가능합니다.&#9;일정은 하나씩 선택하십시오</span>
				</div>
				<div class="schedule">
					<nav class="date_nav">
							<ul>
								<li class="diary" diary="0">DIARY 1</li>
								<li class="diary" diary="1">DIARY 2</li>
								<li class="diary" diary="2">DIARY 3</li>
								<li class="diary" diary="3">DIARY 4</li>
								<li class="diary" diary="4">DIARY 5</li>
							</ul>
					</nav>
				</div>
				<input type="text" class="input_memo" placeholder="메모"
						size="50" maxlength="10" autofocus required />
				<input type="button" value="사진 추가" id="photoBtn"/><span id="fileName"></span>
				<div id="photoArea"></div>
			</div>
			<div class="hash_area">
				<div class="title_top">
					<strong class="title_font">4. 등록</strong> <span>필수 입력 사항 </span><span
						class="asterisk">&#42;</span>
				</div>
				<div class="help">
					<span>선호도 선택 후 카테고리를 지정하십시오.&#9;해시태그는 선택 사항이며 '#키워드' 형태로
						입력하십시오.</span>
				</div>
				<div class="hash_box">
					<div class="category_area">
						<span class="asterisk">&#42;</span><span>카테고리</span> <select
							class="pref_filter" name="inputCategory">
							<option value="0">선호도</option>
							<option value="2">교통</option>
							<option value="3">관광</option>
							<option value="4">활동</option>
						</select> <select class="category_filter" name="inputSubCategory">
							<option value="0">카테고리</option>
						</select>
					</div>
					<div class="hash">
						<label>해시태그<input type="text" class="hash_input" name="inputHashtag" size="70" maxlength="70" placeholder="#해시태그1#해시태그2"></label>
					</div>
				</div>
				<div class="enroll_area">
					<input type="button" class="enroll_btn" value="등 록" /> <input type="button" class="cancel_btn" value="취 소" />
				</div>
			</div>
		   <input type="hidden" id="startDate" name="startDate" value="${startDate }"/>
		   <input type="hidden" id="endDate" name="endDate" value="${endDate }"/>
		   <input type="hidden" id="regionNo" name="regionNo" value="${regionNo }"/>
		</form>
		</div>
		<div id="footer">
			<p>
				POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
				Copyright© POPJOURNEY. All Rights Reserved.
			</p>
		</div>
	</div>
</body>
</html>
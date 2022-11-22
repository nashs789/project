<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ303Css/PJ303C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/script/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ303Js/PJ303S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	if("editPostNo" != null){
		//$("input[name=postTitle]").attr("value",${data.TITLE});	
		//$("#postCon").val(CKEDITOR.instances['postCon'].getData());
	}
	CKEDITOR.replace("postCon", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		width : "1280",
		height : "500"
		
	});
	
	$("#writeForm").on("keypress", "input", function (event) {
		if(event.keyCode ==13) {
			return false;
		}
	});
	if("${data.CATEGORY_NO}" == "1") { 
		$("#categorySelect").val("1").prop("selected", true); 		
	} else if ("${data.CATEGORY_NO}" == "2") { 
		$("#categorySelect").val("2").prop("selected", true); 		
	} else if ("${data.CATEGORY_NO}" == "3") { 
		$("#categorySelect").val("3").prop("selected", true); 		
	} else { 
		$("#categorySelect").val("4").prop("selected", true); 		
	} 
	$("#editBtn").on("click", function () {
		$("#postCon").val(CKEDITOR.instances['postCon'].getData());

		if($.trim($("#postTitle").val()) == "") {
			popupText = "제목을 입력해 주세요.";
			commonPopup(popupText);
			$("#postTitle").focus();
			return false; // ajaxForm 실행 불가
		} else if ($.trim($("#postCon").val()) == "") {
			popupText = "내용을 입력해 주세요.";
			commonPopup(popupText);
			$("#postCon").focus();
			return false;
		}
			var params = $("#writeForm").serialize();

			$.ajax({
				url:"postUpdates", 
				type: "post",
				dataType: "json",
				data : params,
				success: function(res){
					if(res.msg == "success"){
						$("#writeForm").attr("action", "post");
						$("#writeForm").submit();
					} else if (res.msg =="failed") {
						popupText = "작성에 실패 하였습니다.";
						commonPopup(popupText);
					} else {
						popupText = "작성에 실패 하였습니다.";
						commonPopup(popupText);
					}
				}, 
				error : function (request, status, error) {
					console.log(error);
				}
			});		 
}); //editBtn click end

	$("#delBtn").on("click", function () {
		$("#postCon").val('');
		CKEDITOR.instances['postCon'].setData('');
		popupText = "글을 지웠습니다.";
		commonPopup(popupText);
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
});//document ready end
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
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 자유게시판 </span>
			&nbsp;>&nbsp;&nbsp;게시글 수정
		</div>
		<form action="#" id="writeForm" method="post">
			<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
			<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
			<input type="hidden" id="editPostNo" name="editPostNo" value="${param.postNo}"/>
			<input type="hidden" id="postNo" name="postNo" value="${param.postNo}"/>
			<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
			<div class="title_area">
				<input type="text" class="input_title" id="postTitle" name="postTitle" value="${data.TITLE}" placeholder="게시글 제목" size="50" maxlength="30" autofocus required/>
				<div class="category_area">
					<span class="asterisk">&#42;</span><span>카테고리</span> 
					<select class="category_select" id="categorySelect" name="categorySelect">
						<c:choose>
						<c:when test="${sGRADE_NO eq 0}">
						<option value="1">공지사항</option>
						</c:when>
						</c:choose>
						<option value="2">여행꿀팁</option>
						<option value="3">Q&A</option>
						<option value="4">잡담</option>
					</select>
				</div>
			</div>
			<div class="container_wrap">
				<div class="txt_area">
					<textarea rows="30" cols="150" placeholder="내용을 입력하시오" id="postCon" name="postCon">${data.CONTENTS}</textarea>
				</div>
				<div class="post_bottom">
					<div class="btn_list">
						<input type="button" id="editBtn" class="add_btn" value="수  정" /> 
						<input type="reset" id="delBtn" class="del_btn" value="글 지우기" />
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
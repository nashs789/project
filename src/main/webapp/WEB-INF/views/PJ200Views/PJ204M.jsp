<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ204Css/PJ204C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ204Js/PJ204S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${sMEM_NO}" != "")
	{	
		if("${sGRADE_NO}" == "0")
		{
			$("#admin").show();
		}
		
		var path = ""; //사진경로 담아줄 변수
		
		if("${sPHOTO_PATH}" != "")
		{
			path = "resources/upload/" + "${sPHOTO_PATH}";
			
			$("#profilePhoto").attr("src", path);
		}
		else
		{
			path = "/static/images/profile.png";

			$("#profilePhoto").attr("src", path);
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
	}//if end -> 로그인 상태여부에 따른 처리

	var params = $("#form").serialize();
	
	$.ajax({
		url: "getInfo2",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result)
		{
			if(result.msg == "success")
			{
				var path = "";
				
				if(result.PHOTO_PATH != null)
				{
					path = "resources/upload/"+result.PHOTO_PATH;
				}
				else
				{
					path = "/static/images/profile.png";
				}
				
				$("#photo").attr("src", path);
				$("#photoPath").val(result.PHOTO_PATH);
				
				$("#inputNic").val(result.NIC);
				$("#inputIntro").val(result.INTRO);
			}
			else
			{
				popupText("정보를 가져오는데 실패하였습니다.")
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
	
	var popupText = ""; //팝업 문구변경
	var nicCheck = "";  //닉네임 중복 확인용
	
	$("#nicDbCkBtn").on("click", function(){  //닉네임 중복체크
		$(".popup").remove();
		$(".bg").remove();
		if($.trim($("#inputNic").val()) == "")
		{
			popupText = "닉네임을 입력하세요.";
			commonPopup(popupText);
			$("#inputNic").focus();
			return false;
		}
		
		$("#valueStorage").val($("#inputNic").val());
		
		var params = $("#form").serialize();
		
		$.ajax({
			url: "nicDbCk",
			data: params,
			dataType:"json",
			type: "post",
			success:function(result)
			{
				if(result.msg == "success")
				{
					popupText = "사용 가능한 닉네임입니다.";
					commonPopup(popupText);
					nicCheck = $("#inputNic").val();
				}
				else
				{
					popupText = "사용 불가능한 닉네임입니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //nicDbCkBtn click end
	
	$("#findPhotoBtn").on("click", function() {
		$("#att").click();
	});
	
	$("#att").on("change", function() {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
		
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
				success : function(res) {
				if(res.result == "SUCCESS") {
					// 올라간 파일명 저장
					if(res.fileName.length > 0) 
					{
						$("#photoPath").val(res.fileName[0]);
						
						var path = "resources/upload/"+res.fileName[0];
						$("#photo").attr("src", path);
					}
				} 
				else 
				{
					alert("파일 업로드중 문제 발생");
				}
			},
			error : function() {
				alert("파일 업로드중 문제 발생");
			}
		}); // ajaxForm end
		fileForm.submit();
	}); //att change end
	
	$("#nextBtn").on("click", function(){
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
			beforeSubmit : function() { // 파일이 있던 없던 유효성 체크.
				if($.trim($("#inputIntro").val()) == "") //소개글 입력 없을 시
				{
					$("#inputIntro").val("안녕하세요~ 잘 부탁드립니다.");
				}
				if($.trim($("#inputNic").val()) == "")
				{
					popupText = "닉네임을 입력하세요.";
					commonPopup(popupText);
					$("#inputNic").focus();
					return false;
				}
				else if($("#inputNic").val() != nicCheck)
				{
					popupText = "닉네임 중복확인을 해주세요.";
					commonPopup(popupText);
					return false;
				}
			},success : function(res) {
				if(res.result == "SUCCESS") {
					// 올라간 파일명 저장
					if(res.fileName.length > 0) {
						$("#photoPath").val(res.fileName[0]);
					}
					// 글 저장
					var params = $("#editInfoForm").serialize();
					
					$.ajax({
						url: "changeProfiles",
						data: params,
						dataType:"json",
						type: "post",
						success:function(result)
						{
							var params = $("#editInfoForm").serialize();
							
							$.ajax({
								url: "editProfiles",
								data: params,
								dataType:"json",
								type: "post",
								success:function(result)
								{
									var txt = "프로필 업데이트 되었습니다.";
									endPopup(txt)
								}, //success end
								error: function(request, status, error) {
									console.log(error);
								} // error end
							}); //ajax end 
						}, //success end
						error: function(request, status, error) {
							console.log(error);
						} // error end
					}); //ajax end 
				} else {
					alert("파일 업로드중 문제 발생");
				}
			},
			error : function() {
				alert("파일 업로드중 문제 발생");
			}
		}); // ajaxForm end
		fileForm.submit();
	}); //nextBtn click end
		
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
	
	$("#preBtn").on("click", function(){ //이전버튼 클릭
		location.href="main";
	}); //preBtn click end
	
	$("#myPage").on("click", function(){
  		location.href = "myPage";
	}); //find click endmyPage
	
	$("#timeline").on("click", function(){
  		location.href = "timeline";
  	}); //timeline click end
	
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
  	
	$("#editInfo").on("click", function(){
		location.href = "editInfo";
  	}); //editInfo click end
  	
  	$("#notificationMore").on("click", function(){
		location.href="notification";
	}); //notificationMore click end
	
	$("#bookmarkPhoto").on("click", function(){
		location.href = "myPageBMK";
	}); //bookmarkPhoto click end
	
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
});//document ready end
</script>
</head>
<body>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" /> <!-- attach : 첨부 -->
</form>
<form action="#" id="form">
	<input type="hidden" id="valueStorage" name="storage"/>
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
</form>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="${page}"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
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
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
<div id="wrap">
         <!-- header부분 고정 -->
         <div id="header">
            <div class="banner">
               <div class="top">
                  <div class="logo_area">
                     <a href="main"><img alt="로고" src="/static/images/logo.png" class="logo_photo"></a>
                     <div class="site_name">우리들의 여행일지</div>
                  </div>
                  <div class="btns"> <!-- 밑에 logins와 연동 -->
                      <ul>
						<li><img alt="bell" src="/static/images/bell.png" id="notificationPhoto">
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
							<li><img alt="bookmark" src="/static/images/bmk.png" id="bookmarkPhoto"></li>
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
               </div> <!-- top end -->
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
				<img alt="search" src="/static/images/search.png" class="search_icon"/>
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
			<div class="profile">[프로필 설정]</div>
			
			<div id="infoWrap">
				<form action="#" id="editInfoForm">
					<div id="photoArea">
						<img id="photo" src="/static/images/profile.png">
						<input type="hidden" id="photoPath" name="photoPath" value=""/>
					</div>
					<input type="button" value="사진찾기" id="findPhotoBtn"/><span id="fileName"></span>
					
					<div class="title">닉네임</div>
					<input type="text" placeholder="닉네임을 입력하세요." id="inputNic" name="inputNic"/>
					<input type="button" value="중복확인" id="nicDbCkBtn"/>
					
					<div class="title">소개글</div>
					<input type="text" placeholder="안녕하세요~ 잘 부탁드립니다." id="inputIntro" name="inputIntro"/>
					<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
				</form>
			</div> <!-- infoWrap end -->
			
			<div id="btnWrap">
				<input id="preBtn" type="button" value="Prev"/>
				<input id="nextBtn" type="button" value="Next"/>
			</div> <!-- btnWrap -->
		</div><!-- container end -->
		<div id="footer">
            <p>
               POPJOURNEY<br/>
               GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br/>
               Copyright© POPJOURNEY. All Rights Reserved.
            </p>
        </div>  
   </div> <!-- wrap end -->      
</body>
</html>
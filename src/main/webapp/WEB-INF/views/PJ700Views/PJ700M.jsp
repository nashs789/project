<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ700Css/PJ700C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ700Js/PJ700S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
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
				alert("오류가 발생했습니다.");
			}
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end 

	params = $("#memForm").serialize();
	var flag = 1;
	
	$.ajax({
		url: "timelinePageCnts",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			if(result.msg == "success")
			{
				$("#pageCnt").val(result.pageCnt);

				var params = $("#memForm").serialize();
				
				$.ajax({
					url: "timelines",
					data: params,
					dataType: "json",
					type: "post",
					success: function(result){
						if(result.msg == "success")
						{
							$("#firstPage").val(result.firstPage);
							$("#lastPage").val(result.lastPage);
							makeTimeline(result.timeline);
						}
						//result.msg에 실패시 failed 에러시 error들어가 있음
					}, //success end
					error: function(error){
						console.log(error);
					} //error end
				}); // ajax end
			} // if end
			//result.msg에 실패시 failed 에러시 error들어가 있음
		}, //success end
		error: function(error){
			console.log(error);
		} //error end
	}); // ajax end
	
	$("#upIcon").on("click", function(){
		$("html").scrollTop(0);
	}); //upIcon click end
	
	$("#downIcon").on("click", function(){
		$("html").scrollTop($(document).height());
	}); //upIcon click end
	
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
			$("#notification").css("display", "block");
		}
	}); //notificationPhoto click end
	
	$(".timeline").on("click", "span, img", function(){
		if($(this).attr("class") == "journal")
		{
			$("#journalNo").val($(this).attr($(this).attr("class")));
			$("#journalForm").submit();
		}
		else if($(this).attr("class") == "nic")
		{
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		}
		else if($(this).attr("class") == "post")
		{
			$("#postNo").val($(this).attr($(this).attr("class")));
			$("#postForm").submit();
		}
	}); //timeline span click end 
	
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
	
	$(".timeline").on("mouseover", ".nic", function(){
		var x = event.clientX;
	    var y = event.clientY; 
	    
		$("#memNo").val($(this).attr($(this).attr("class")));
		var params = $("#memNoForm").serialize();
		
		$.ajax({
			url:"miniProfiles",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				if(result.msg == "success")
				{
					makeProfilePopup(result.mini, x, y);
				}
				else
				{
					alert("정보가 없습니다");
				}
			}, //success end
			error: function(error){
				console.log(error);
			} //error end
		}); //ajax end
	}); //timeline nic mouseover end
	
	$(".timeline").on("mouseout", ".nic", function(){
		$(".popup").remove();
	}); //timeline nic mouseout end

	$(window).on("scroll", function(){
	    var $window = $(this);
	    var scroll = $window.scrollTop();
	    var wheigth = $window.height();
	    var dheight = $(document).height();
	   
        if(scroll + wheigth + 200 > dheight && flag == 1)
        {
        	flag--;
        	var params = $("#memForm").serialize();
        	
        	$.ajax({
        		url: "timelines",
        		data: params,
        		dataType: "json",
        		type: "post",
        		success: function(result){
        			if(result.msg == "success")
        			{
        				$("#firstPage").val(result.firstPage);
        				$("#lastPage").val(result.lastPage);
        				makeTimeline(result.timeline);
        				flag ++;
        			}
        			else if(result.msg == "full")
        			{
        				alert("마지막 입니다");
        			}
        			//result.msg에 실패시 failed 에러시 error들어가 있음
        		}, //success end
        		error: function(error){
        			console.log(error);
        		} //error end
        	}); // ajax end
        } //if end
	}); // window scroll end
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
  	
  	$("#editProfile").on("click", function(){
  		location.href = "editProfile";
  	}); //editProfile click end
  	
	$("#editInfo").on("click", function(){
		location.href = "editInfo";
  	}); //editInfo click end
	
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
});//document ready end
</script>
</head>
<body>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	<input type="hidden" id="lastPage" name="lastPage" value="10"/>
	<input type="hidden" id="pageCnt" name="pageCnt" value=""/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="page" name="page" value="${page}"/>
</form>
<form action="#" id="memNoForm">
	<input type="hidden" id="memNo" name="memNo"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
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
	<div id="wrap">
         <!-- header부분 고정 -->
         <div id="header">
            <div class="banner">
               <div class="top">
                  <div class="logo_area">
                     <a href="main"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
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
							<li><img alt="프로필" src="./resources/images/profile.png" id="profilePhoto">
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
         </div> <!-- header end -->

		<div id="container">
			<div class="space">[ T I M E L I N E ]</div>
			<div class="timeline">

			</div> <!-- timeline end -->
			<div class="space">[ E N D ]</div>
		</div> <!-- container end -->
		<img src="./resources/images/up.png" id="upIcon">
		<img src="./resources/images/down.png" id="downIcon">
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
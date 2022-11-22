<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ203Css/PJ203C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ203Js/PJ203S.js"></script>
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
			path = "./resources/images/profile.png";

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
	
	
	var popupText = "";
	var IDCheck = "";  //아이디 중복 확인용
	var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@\#$%<>^&*]/; //특수문자 확인용 정규식
	
	var params = $("#form").serialize();

	$.ajax({
		url: "getInfo",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result)
		{
			if(result.msg == "success")
			{
				$("#inputName").val(result.NAME);
				$("#selectYear").val(result.YEAR);
				$("#selectMonth").val(result.MONTH);
				$("#selectDay").val(result.DAY);
				$(":radio[name='sex'][value='" + result.SEX + "']").attr('checked', true);
				$("#inputID").val(result.ID);
				$("#inputPW").val(result.PW);
				$("#inputRePW").val(result.PW);
				$("#inputPhone").val(result.PHONE);
				$("#inputEmail").val(result.EMAIL);
				$("#inputDomain").val(result.DOMAIN);
				$("#selectKeyword").val(result.KEYWORD_NO);
				$("#inputKeyword").val(result.KEYWORD);
				$("#sendCode").css("background-color", "#2e3459");
				$("#sendCode").css("color", "white");
				$("#sendCode").css("cursor", "default");
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
	
	$("#IDDbCkBtn").on("click", function(){  //아이디 중복체크
		$(".popup").remove();
		$(".bg").remove();
		if($.trim($("#inputID").val()) == "") //아이디가 비어있을경우
		{
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
			$("#inputID").focus();
			return false;
		}
		
		if(pattern3.test($("#inputID").val())) //아이디에 특수문자 금지
		{
			popupText = "아이디에 특수문자는 불가능합니다.";
			commonPopup(popupText);
			$("#inputID").focus();
			$("#inputID").val("");
			return false;
		}
		
		$("#valueStorage").val($("#inputID").val());
		
		var params = $("#form").serialize();
		
		$.ajax({
			url: "IDDbCk",
			data: params,
			dataType:"json",
			type: "post",
			success:function(result)
			{
				if(result.msg == "success")
				{
					popupText = "사용 가능한 아이디입니다.";
					commonPopup(popupText);
					IDCheck = $("#inputID").val();
				}
				else
				{
					popupText = "사용 불가능한 아이디입니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //IdDbCkBtn click end
	
	$("#inputPhone").on("keypress", function(){  //핸드폰 번호 숫자만 받기
		$(".popup").remove();
		$(".bg").remove();
		
		if(event.keyCode < 48 || event.keyCode > 57)
		{
			popupText = "숫자만 입력하세요.";
			commonPopup(popupText);
			return false;
		}
	}); //inputPhone keypress end
	
	$("#nextBtn").on("click", function(){      //다음 버튼을 눌렀을때 필수 입력필드가 전부 채워졌는지 확인
		if($.trim($("#inputID").val()) == "")
		{
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
			$("#inputID").focus();
		}
 		else if($("#inputID").val() != IDCheck)
		{
			popupText = "아이디 중복확인을 해주세요.";
			commonPopup(popupText);
		} 
		else if($.trim($("#inputPW").val()) == "")
		{
			popupText = "비밀번호를 입력하세요.";
			commonPopup(popupText);
			$("#inputPW").focus();
		}
		else if($.trim($("#inputRePW").val()) == "")
		{
			popupText = "비밀번호 재확인을 입력하세요.";
			commonPopup(popupText);
			$("#inputRePW").focus();
		}
		else if($("#inputPW").val() != $("#inputRePW").val())
		{
			popupText = "비밀번호가 서로 일치하지 않습니다.";
			commonPopup(popupText);
			resetPW();
		}
		else if($("#inputPW").val().length < 8) //minlength가 안먹을경우를 대비한 8글자 미만 비밀번호 거르기
		{
			popupText = "비밀번호를 8~32자리로 해주세요.";
			commonPopup(popupText);
			resetPW();
		}
		else if(!pattern1.test($("#inputPW").val())||!pattern2.test($("#inputPW").val())||!pattern3.test($("#inputPW").val()))
		{
			popupText = "숫자/영문/특수문자를 조합하세요.";
			commonPopup(popupText);
			resetPW();
		}
		else if($("#selectTelcom").val() == 0)
		{
			popupText = "통신사를 선택하세요";
			commonPopup(popupText);
			$("#selectTelcom").focus();
		}
		else if($.trim($("#inputPhone").val()) == "")
		{
			popupText = "전화번호를 입력하세요.";
			commonPopup(popupText);
			$("#inputPhone").focus();
		}
		 else if($.trim($("#inputPhone").val().length) != 8)
		{
			popupText = "8자리를 입력하세요";
			commonPopup(popupText);
			$("#inputPhone").focus();
		} 
		else if($.trim($("#inputPhone").val().indexOf('-')) == 0)
		{
			popupText = "-를 제외하고 입력하세요.";
			commonPopup(popupText);
			$("#inputPhone").focus();
		}
 		else if($("#selectKeyword").val() == 0)
		{
			console.log($("#selectKeyword").val());
			popupText = "키워드를 선택 하세요.";
			commonPopup(popupText);
			$("#selectKeyword").focus();
		}
		else if($.trim($("#inputKeyword").val()) == "")
		{
			popupText = "키워드를 입력하세요.";
			commonPopup(popupText);
			$("#inputKeyword").focus();
		} 
		else
		{
			var params = $("#editInfoForm").serialize();
			
			$.ajax({
				url: "editInfos",
				data: params,
				dataType: "json",
				type: "post",
				success:function(result)
				{
					if(result.msg == "success")
					{
						location.href="main";
					}
					else if(result.msg == "failed")
					{
						popupText = "수정에 실패하였습니다.";
						commonPopup(popupText);
					}
					else
					{
						popupText = "진행도중 에러가 발생했습니다.";
						commonPopup(popupText);
					}
				}, //success end
				error: function(request, status, error) {
					console.log(error);
				} // error end
			}); //ajax end 
		}//if ~ else end
	}); //nextBtn click end
	
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
  	
  	$("#delBtn").on("click", function(){
  		checkPopup();
  	});
  	
	$("#preBtn").on("click", function(){ //이전버튼 클릭
		location.href = "main";
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
  	
  	$("#editProfile").on("click", function(){
  		location.href = "editProfile";
  	}); //editProfile click end
  	
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
function checkPopup()
{
	var html = "";
	
	html +="<div class=\"popup\">";
	html +="	   <div class=\"popup_entity_txt\">정말로 탈퇴 하시겠습니까?</div>";
	html +="       <div class=\"btn_list\">";
	html +="       		<a id=\"ok\">확인</a>";
	html +="      		<a id=\"cancel\">취소</a>";
	html +="       </div>";
	html +="</div>";
	html +="<div class=\"bg\"></div>";
	
	$("body").append(html);
	
	$("#cancel").on("click", function(){ 
		$(".popup").remove();
		$(".bg").remove();
	}); //cancelImg click end
	
	$("#ok").on("click", function(){ 
		var params = $("#memForm").serialize();
		
		$.ajax({
			url: "deletes",
			data: params,
			dataType:"json",
			type: "post",
			success:function(result)
			{
				if(result.msg == "success")
				{
					location.href="main";
				}
				else
				{
					popupText = "탈퇴에 실패하였습니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //cancelImg click end
}//findBtnPopup end
function commonPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열 
{
	var html = "";
	
	html +="<div class=\"popup\">";
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
}
function resetPW() //비밀번호 조건이 안맞을 때 초기화
{
	$("#inputPW").val("");
	$("#inputRePW").val("");
	$("#inputPW").focus();
}
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
			<div class="join">[회원정보 수정]</div>
			
			<form action="#" id="editInfoForm">
				<div id="infoWrap">
					<div class="title">이름</div>
					<input type="text" id="inputName" name="inputName" placeholder="이름를 입력해 주세요." disabled="disabled"/> 
					
					<div class="title">생일/성별</div>
					<select id="selectYear" name="inputYear" disabled="disabled">
						<option>연도</option>
						<c:forEach var="i" begin="1900" end="2021" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<select id="selectMonth" name="inputMonth" disabled="disabled">
						<option>월</option>
						<c:forEach var="i" begin="1" end="12" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<select id="selectDay" name="inputDay" disabled="disabled">
						<option>일</option>
						<c:forEach var="i" begin="1" end="31" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select><br/>
					
					<div id="radioWrap">
						<label><input type="radio" name="sex" value="0" checked disabled="disabled"/>선택없음</label>
						<label><input type="radio" name="sex" value="1" disabled="disabled"/>남자</label>
						<label><input type="radio" name="sex" value="2" disabled="disabled"/>여자</label>
					</div>
				
					<div class="title">아이디</div>
					<input type="text" id="inputID" name="inputID" placeholder="아이디 입력를 입력해 주세요."/>
					<input type="button" id="IDDbCkBtn" value="중복확인"/>
					
					<div class="title">비밀번호</div>
					<input type="password" id="inputPW" name="inputPW" placeholder="8~32자리 특수문자포함 입력해주세요 " minlength="8" maxlength="32"/>
					
					<div class="title">비밀번호 재확인</div>
					<input type="password" id="inputRePW" name="inputRePW" placeholder="비밀번호를 재입력 해주세요."  minlength="8" maxlength="32"/>
					
					<div class="title">전화번호</div>
					
					<div>
						<select id="selectTelcom" name="selectTelcom">
							<option value="0">통신사</option>
							<option value="KT">KT</option>
							<option value="SKT">SKT</option>
							<option value="LG">LG</option>
						</select>
						<input type="text" maxlength="8" placeholder="전화번호 8자리(010 / '-'제외)" id="inputPhone" name="inputPhone"/>
					</div>
				
					<div class="title">이메일</div>
					<div>
						<input type="text" id="inputEmail" name="inputEmail" disabled="disabled"/>
						<span id="txtAt">@</span>
						<input type="text" id="inputDomain" name="inputDomain" disabled="disabled"/>
						
						<select id="selectDomain" name="selectDomain" disabled="disabled">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<input type="button" value="코드발송" id="sendCode" disabled="disabled"/>
					</div>
					
					<div class="title">키워드</div>
					<select id="selectKeyword" name="selectKeyword">
							<option value="0">키워드 질문을 골라주세요</option>
							<option value="1">당신의 첫 사랑의 이름은?</option>
							<option value="2">기분이 우울할 때 듣는 노래 제목은?</option>
							<option value="3">좋아하는 소설의 이름은?</option>
							<option value="4">감명깊게 본 영화 이름은</option>
							<option value="5">가장 존경하는 사람의 이름은?</option>
							<option value="6">나에게 가장 큰 의미가 있는 장소는?</option>
							<option value="7">내가 좋아하는 과자 이름은?</option>
							<option value="8">나의 직업은?</option>
							<option value="9">나의 버켓리스트 목록 1번은</option>
							<option value="10">당신이 다녔던 초등학교는 어딘가요?</option>
					</select>
					<input type="text" id="inputKeyword" name="inputKeyword" placeholder="키워드를 입력하세요."/>
					<input type="hidden" name="MEM_NO" value="${sMEM_NO}"/>
				</div>
			</form>
			
			<div id="btnWrap">
				<input id="preBtn" type="button" value="Prev"/>
				<input id="nextBtn" type="button" value="Next"/>
			</div>
		</div>
		<div id="deleteMem"><input type="button" id="delBtn" value="회원탈퇴"/></div>
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
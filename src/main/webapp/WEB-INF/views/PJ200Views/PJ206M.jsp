<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
	<link href="static/css/PJ205Css/PJ205C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ205Js/PJ205S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@\#$%<>^&*]/; 
	
	$("#preBtn").on("click", function(){
		location.href="main";
	}); //preBtn click end
	
	$("#selectDomain").change(function(){  //도메인 셀렉터 선택시 텍스트창으로 값 이동
		$("#inputDomain").val("");
		$("#inputDomain").val($("#selectDomain").val());
	}); //selectDomain change end
	
	$("#nextBtn").on("click", function(){
		if($.trim($("#inputName").val()) == "")
		{
			popupText = "이름을 입력하세요.";
			commonPopup(popupText);
			$("#inputName").focus();
		}
		else if(pattern3.test($("#inputName").val()))
		{
			popupText = "이름에 특수문자 사용 불가능합니다.";
			commonPopup(popupText);
			$("#inputName").val("");
			$("#inputName").focus();
		}
		else if(pattern1.test($("#inputName").val()))
		{
			popupText = "이름에 숫자는 사용 불가능합니다.";
			commonPopup(popupText);
			$("#inputName").val("");
			$("#inputName").focus();
		}
		else if($.trim($("#inputID").val()) == "")
		{
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
			$("#inputID").focus();
		}
		else if(pattern3.test($("#inputID").val()))
		{
			popupText = "아이디에 특수문자는 불가능합니다.";
			commonPopup(popupText);
			$("#inputID").focus();
			$("#inputID").val("");
			return false;
		}
		else if($.trim($("#inputEmail").val()) == "")
		{
			popupText = "이메일을 입력하세요.";
			commonPopup(popupText);
			$("#inputEmail").focus();
		}
		else if($.trim($("#inputDomain").val()) == "")
		{
			popupText = "이메일 주소를 입력하세요.";
			commonPopup(popupText);
			$("#inputDomain").focus();
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
			var params = $("#infoForm").serialize();
			
			$.ajax({
				url: "findPWs",
				data: params,
				dataType:"json",
				type: "post",
				success:function(result)
				{
					if(result.msg == "success")
					{
						findPWPopup(result.MEM_NO);
					}
					else
					{
						popupText = "일치하는 정보가 없습니다.";
						commonPopup(popupText);
					}
				}, //success end
				error: function(request, status, error) {
					console.log(error);
				} // error end
			}); //ajax end 
		} // if ~ else end
	}); //nextBtn click end
	
	$("#inputPW2, #inputID2").on("keypress", function(){
		$(".popup").remove();
		$(".bg").remove();
		if(event.keyCode == 13)
			$("#loginBtn").click();
	});
	
	$("#loginBtn").on("click", function(){  //로그인 버튼 클릭
		if($.trim($("#inputID2").val()) == "")
		{
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
		}
		else if($.trim($("#inputPW2").val()) == "")
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
					if(result.msg == "success")
					{
						location.href="main";
					}
					else
					{
						popupText = "ID와 PW가 일치하지 않습니다.";
						commonPopup(popupText);
						$("#inputID2").val("");
						$("#inputPW2").val("");
					} 
				}, //success end
				error: function(request, status, error) {
					console.log(error);
				} // error end
			}); //ajax end 
		}// if ~ else end
	}); //loginBtn click end
	
	$("#join").on("click", function(){  //회원가입 버튼 클릭
		location.href="terms";
	}); // join click end
	
	$("#find").on("click", function(){
		findBtnPopup();
	}); //find click end
	
	$("#clientCenter").on("click", function() {
  		location.href = "clientCenterQuestion";
  	}); //clientCenter click end
  	
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
<form action="" id="infoForm2">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value=""/>
	<input type="hidden" id="PW" name="inputPW" value=""/>
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
                  <div class="logins">
                     <div class="sub_login1">
                        <form action="#" id="loginForm">
	                        <input type="button" id="loginBtn" value="로그인" />
	                        <input type="password" id="inputPW2" name="inputPW" placeholder="PW" />
	                        <input type="text" id="inputID2" name="inputID" placeholder="ID" />
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
                  <li>여행게시판</li>
                  <li>자유게시판</li>
                  <li id="travelWriter">여행작가</li>
                  <li id="clientCenter">고객센터</li>
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
			<div class="findID">[비밀번호 찾기]</div>
			
			<form action="#" id="infoForm">
				<div id="infoWrap">
					<div class="title">이름</div>
					<input type="text" id="inputName" name="inputName" placeholder="이름를 입력해 주세요."/> 
					
					<div class="title">아이디</div>
					<input type="text" id="inputID" name="inputID" placeholder="아이디 입력를 입력해 주세요."/> 
				
					<div class="title">이메일</div>
					<div>
						<input type="text" id="inputEmail" name="inputEmail"/>
						<span id="txtAt">@</span>
						<input type="text" id="inputDomain" name="inputDomain"/>
						
						<select id="selectDomain" name="selectDomain">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
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
				</div>
			</form>
			
			<div id="btnWrap">
				<input id="preBtn" type="button" value="Prev"/>
				<input id="nextBtn" type="button" value="Next"/>
			</div>
		</div>
		
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
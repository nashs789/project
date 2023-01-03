<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ200Css/PJ201C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ200Js/PJ203S.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	chkStat();
	setEvent();
});//document ready end

function chkStat(){
	$("#inp_n")
}

function setEvent(){
	sendServer("selectPJ203GetUserInfo", {"mem_no": '${sMemVo.mem_no}'}, function callback(result){
		console.log(result.birth);
		//setAllCompValue(result);
	});
}

/*
$(document).ready(function(){
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
		success:function(result) {
			if(result.msg == "success") {
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
			} else {
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
		//아이디가 비어있을경우
		if($.trim($("#inputID").val()) == "") {
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
			$("#inputID").focus();
			return false;
		}

		//아이디에 특수문자 금지
		if(pattern3.test($("#inputID").val())) {
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
			success:function(result) {
				if(result.msg == "success") {
					popupText = "사용 가능한 아이디입니다.";
					commonPopup(popupText);
					IDCheck = $("#inputID").val();
				} else {
					popupText = "사용 불가능한 아이디입니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //IdDbCkBtn click end
	
	$("#nextBtn").on("click", function(){      //다음 버튼을 눌렀을때 필수 입력필드가 전부 채워졌는지 확인
		if($.trim($("#inputID").val()) == "") {
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
			$("#inputID").focus();
		} else if($("#inputID").val() != IDCheck) {
			popupText = "아이디 중복확인을 해주세요.";
			commonPopup(popupText);
		} else if($.trim($("#inputPW").val()) == "") {
			popupText = "비밀번호를 입력하세요.";
			commonPopup(popupText);
			$("#inputPW").focus();
		} else if($.trim($("#inputRePW").val()) == "") {
			popupText = "비밀번호 재확인을 입력하세요.";
			commonPopup(popupText);
			$("#inputRePW").focus();
		} else if($("#inputPW").val() != $("#inputRePW").val()) {
			popupText = "비밀번호가 서로 일치하지 않습니다.";
			commonPopup(popupText);
			resetPW();
		} else if($("#inputPW").val().length < 8) { //minlength가 안먹을경우를 대비한 8글자 미만 비밀번호 거르기
			popupText = "비밀번호를 8~32자리로 해주세요.";
			commonPopup(popupText);
			resetPW();
		} else if(!pattern1.test($("#inputPW").val())||!pattern2.test($("#inputPW").val())||!pattern3.test($("#inputPW").val())) {
			popupText = "숫자/영문/특수문자를 조합하세요.";
			commonPopup(popupText);
			resetPW();
		} else if($("#selectTelcom").val() == 0) {
			popupText = "통신사를 선택하세요";
			commonPopup(popupText);
			$("#selectTelcom").focus();
		} else if($.trim($("#inputPhone").val()) == "") {
			popupText = "전화번호를 입력하세요.";
			commonPopup(popupText);
			$("#inputPhone").focus();
		} else if($.trim($("#inputPhone").val().length) != 8) {
			popupText = "8자리를 입력하세요";
			commonPopup(popupText);
			$("#inputPhone").focus();
		} else if($.trim($("#inputPhone").val().indexOf('-')) == 0) {
			popupText = "-를 제외하고 입력하세요.";
			commonPopup(popupText);
			$("#inputPhone").focus();
		} else if($("#selectKeyword").val() == 0) {
			console.log($("#selectKeyword").val());
			popupText = "키워드를 선택 하세요.";
			commonPopup(popupText);
			$("#selectKeyword").focus();
		} else if($.trim($("#inputKeyword").val()) == "") {
			popupText = "키워드를 입력하세요.";
			commonPopup(popupText);
			$("#inputKeyword").focus();
		} else {
			var params = $("#editInfoForm").serialize();
			
			$.ajax({
				url: "editInfos",
				data: params,
				dataType: "json",
				type: "post",
				success:function(result) {
					if(result.msg == "success") {
						location.href="main";
					} else if(result.msg == "failed") {
						popupText = "수정에 실패하였습니다.";
						commonPopup(popupText);
					} else {
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
  	
  	$("#delBtn").on("click", function(){
  		checkPopup();
  	});
  	
	$("#preBtn").on("click", function(){ //이전버튼 클릭
		location.href = "main";
	}); //preBtn click end
});//document ready end
*/
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

<form action="#" id="testForm">
	<input type="hidden" id="name" name="name"/>
	<input type="hidden" id="birth" name="birth"/>
	<input type="hidden" id="sex" name="sex"/>
	<input type="hidden" id="id" name="id"/>
	<input type="hidden" id="pw" name="pw"/>
	<input type="hidden" id="telcom" name="telcom"/>
	<input type="hidden" id="phone" name="phone"/>
	<input type="hidden" id="email" name="email"/>
	<input type="hidden" id="email_confirm" name="email_confirm"/>
	<input type="hidden" id="keyword" name="keyword"/>
	<input type="hidden" id="marketing" name="marketing" value=""/> <%-- ${memVo.marketing} --%>
	<input type="hidden" id="photo_path" name="photo_path" value=""/>
	<input type="hidden" id="nic" name="nic" value=""/>
	<input type="hidden" name="MEM_NO" value="${sMemVo.mem_no}"/>
</form>
<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<div class="join">[회원정보 수정]</div>
				<div id="infoWrap">
					<div class="title">이름</div>
					<input type="text" id="inp_name" placeholder="이름를 입력해 주세요." disabled="disabled"/>
					
					<div class="title">생일/성별</div>
					<select id="sel_year" disabled="disabled">
						<option>연도</option>
						<c:forEach var="i" begin="1900" end="2021" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<select id="sel_month" disabled="disabled">
						<option>월</option>
						<c:forEach var="i" begin="1" end="12" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<select id="sel_day" disabled="disabled">
						<option>일</option>
						<c:forEach var="i" begin="1" end="31" step="1" >
							<option value="${i}">${i}</option>
						</c:forEach>
					</select><br/>
					
					<div id="rad_sex">
						<label><input type="radio" value="0" checked disabled="disabled"/>선택없음</label>
						<label><input type="radio" value="1" disabled="disabled"/>남자</label>
						<label><input type="radio" value="2" disabled="disabled"/>여자</label>
					</div>
				
					<div class="title">아이디</div>
					<input type="text" id="inp_id" placeholder="아이디 입력를 입력해 주세요."/>
					<input type="button" id="btn_id_db_chk" value="중복확인"/>
					
					<div class="title">비밀번호</div>
					<input type="password" id="inp_pw" placeholder="8~32자리 특수문자포함 입력해주세요 " minlength="8" maxlength="32"/>
					
					<div class="title">비밀번호 재확인</div>
					<input type="password" id="inp_re_pw"  placeholder="비밀번호를 재입력 해주세요."  minlength="8" maxlength="32"/>
					
					<div class="title">전화번호</div>
					
					<div>
						<select id="sel_telcom">
							<option value="0">통신사</option>
							<option value="KT">KT</option>
							<option value="SKT">SKT</option>
							<option value="LG">LG</option>
						</select>
						<input type="text" maxlength="8" placeholder="전화번호 8자리(010 / '-'제외)" id="inp_phone"/>
					</div>
				
					<div class="title">이메일</div>
					<div>
						<input type="text" id="inp_email" disabled="disabled"/>
						<span id="txtAt">@</span>
						<input type="text" id="inp_domain" disabled="disabled"/>
						
						<select id="sel_domain" disabled="disabled">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<input type="button" value="코드발송" id="btn_code" disabled="disabled"/>
					</div>
					
					<div class="title">키워드</div>
					<select id="sel_keyword" name="selectKeyword">
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
					<input type="text" id="inp_keyword" placeholder="키워드를 입력하세요."/>
				</div>
			
			<div id="btnWrap">
				<input id="btn_pre" type="button" value="Prev"/>
				<input id="btn_next" type="button" value="Next"/>
			</div>
		</div>
		<div id="deleteMem"><input type="button" id="btn_del" value="회원탈퇴"/></div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
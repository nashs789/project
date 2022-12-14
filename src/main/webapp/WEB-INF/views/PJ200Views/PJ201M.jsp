<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관</title>
	<link href="static/css/PJ200Css/PJ201C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/js/PJ200Js/PJ201S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/*if("{sMemVo.mem_no}" != "" || "{sMemVo.marketing}" == "") {
		//location.href="PJ100M";
	}*/

	setEvent();
	chkStat();

	/*
	var popupText = ""; //팝업 문구변경
	var IDCheck = "";  //아이디 중복 확인용

	*/

/*	$("#btn_next").on("click", function(){
		let params = {
			           "name": $("#inp_name").val()
					 , "birth": $("#sel_year").val()
			         , "sex": $("#rad_sex").val()
					 , "id": $("#inp_id").val()
					 , "pw": $("#inp_pw").val()
			   	 	 , "telcom": $("#sel_telcom").val()
					 , "phone": $("#inp_phone").val()
					 , "email": $("#inp_email").val()
					 , "domain": $("#inp_domain").val()
					 , "email_confirm": $("#inp_code").val()
					 , "keyword_no": $("#sel_keyword").val()
					 , "keyword": $("#inp_keyword").val()
				     , "marketing": ${memVo.marketing}
		}

		$("#name").val(params.name);
		$("#birth").val(params.birth);
		$("#sex").val(params.sex);
		$("#id").val(params.id);
		$("#pw").val(params.pw);
		$("#telcom").val(params.telcom);
		$("#phone").val(params.phone);
		$("#email").val(params.email);
		$("#domain").val(params.domain);
		$("#email_confirm").val(params.email_confirm);
		$("#keyword_no").val(params.keyword_no);
		$("#keyword").val(params.keyword);
		$("#marketing").val(params.marketing);

		$("#form_test").submit();
	});*/
});//document ready end

function setEvent(){
	$("#btn_id_db_chk").on("click", function(){  //아이디 중복체크
		// $(".popup").remove();
		// $(".bg").remove();
		/*if($.trim($("#inputID").val()) == "") { //아이디가 비어있을경우
			popupText = "아이디를 입력하세요.";
			commonPopup(popupText);
			$("#inputID").focus();
			return false;
		}*/

		if(isEmpty($("#inp_id"), "아이디를 입력하세요.")){
			return;
		}

		if(pattern3.test($("#inputID").val())) { //아이디에 특수문자 금지
			popupText = "아이디에 특수문자는 불가능합니다.";
			commonPopup(popupText);
			$("#inputID").focus();
			$("#inputID").val("");
			return false;
		}

		$("#valueStorage").val($("#inputID").val());

		var params = $("#Form").serialize();

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

	$("#inputPhone").on("keypress", function(){  //핸드폰 번호 숫자만 받기
		$(".popup").remove();
		$(".bg").remove();

		if(event.keyCode < 48 || event.keyCode > 57) {
			popupText = "숫자만 입력하세요.";
			commonPopup(popupText);
			return false;
		}
	}); //inputPhone keypress end

	$("#ckCode").on("click", function(){ //이메일 인증 확인버튼 클릭

		var params = $("#infoForm").serialize();

		$.ajax({
			url: "checkCodes",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result) {
				if(result.msg == "success") {
					popupText = "인증 되었습니다.";
					commonPopup(popupText);
					$("#approvalCode").val(1);
				} else {
					popupText = "인증에 실패하였습니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end
	});

	$("#selectDomain").change(function(){  //도메인 셀렉터 선택시 텍스트창으로 값 이동
		$("#inputDomain").val("");
		$("#inputDomain").val($("#selectDomain").val());
	}); //selectDomain change end

	$("#btn_next").on("click", function(){      //다음 버튼을 눌렀을때 필수 입력필드가 전부 채워졌는지 확인
		if(!checkEmptyComponent()){
			$("#memForm").submit();
		}
	}); //nextBtn click end

	$("#sendCode").on("click", function(){
		if($.trim($("#inputEmail").val()) == "") {
			popupText = "이메일을 입력하세요.";
			commonPopup(popupText);
			$("#inputEmail").focus();
		} else if($.trim($("#inputDomain").val()) == "") {
			popupText = "이메일 주소를 입력하세요.";
			commonPopup(popupText);
			$("#inputDomain").focus();
		} else {
			$("#codeWrap").show();
			var params = $("#infoForm").serialize();

			$.ajax({
				url: "sendCodes",
				data: params,
				dataType: "json",
				type: "post",
				success:function(result) {
					if(result.msg == "success") {
						popupText = "메일이 전송되었습니다.";
						commonPopup(popupText);
					} else {
						popupText = "메일 전송에 실패 하였습니다.";
						commonPopup(popupText);
					}
				}, //success end
				error: function(request, status, error) {
					console.log(error);
				} // error end
			}); //ajax end
		}
	}); //sendCode click end

	$("#reSend").on("click", function(){
		var params = $("#infoForm").serialize();

		$.ajax({
			url: "sendCodes",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result) {
				if(result.msg == "success") {
					popupText = "메일이 전송되었습니다.";
					commonPopup(popupText);
				} else {
					popupText = "메일 전송에 실패 하였습니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end
	});//reSend click end

	$("#btn_pre").on("click", function(){ //이전버튼 클릭
		//location.href = "terms";
	}); //preBtn click end
}

function chkStat(){

}

</script>
</head>
<body>
<input type="hidden" id="approvalCode" value="0"/>
<form action="#" id="Form">
	<input type="hidden" id="valueStorage" name="storage"/>
</form>
<form action="PJ202M" id="memForm" method="post">
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
	<input type="hidden" id="marketing" name="marketing" value="${memVo.marketing}"/>
</form>
<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<div class="join">[회원가입]</div>
		
			<div class="milestone">
				<div class="milestone_title">
					약관 동의
				</div>
				<div class="arrow_img"><img src="static/images/milestone.png"></div>
				<div class="milestone_title" id="milestone_on">
					정보입력
				</div>	
				<div class="arrow_img"><img src="static/images/milestone.png"></div>
				<div class="milestone_title">
					프로필 설정
				</div>
				<div class="arrow_img"><img src="static/images/milestone.png"></div>
				<div class="milestone_title">
					가입 완료
				</div>				
			</div>

			<div id="infoWrap">
				<div class="title">이름</div>
				<input type="text" id="inp_name" placeholder="이름를 입력해 주세요."/>

				<div class="title">생일/성별</div>
				<select id="sel_year">
					<option>연도</option>
					<c:forEach var="i" begin="1900" end="2021" step="1" >
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<select id="sel_month">
					<option>월</option>
					<c:forEach var="i" begin="1" end="12" step="1" >
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<select id="sel_day">
					<option>일</option>
					<c:forEach var="i" begin="1" end="31" step="1" >
						<option value="${i}">${i}</option>
					</c:forEach>
				</select><br/>

				<div id="rad_sex">
					<label><input type="radio" value="0" checked/>선택없음</label>
					<label><input type="radio" value="1"/>남자</label>
					<label><input type="radio" value="2"/>여자</label>
				</div>

				<div class="title">아이디</div>
				<input type="text" id="inp_id" placeholder="아이디 입력를 입력해 주세요."/>
				<input type="button" id="btn_id_db_chk" value="중복확인"/>

				<div class="title">비밀번호</div>
				<input type="password" id="inp_pw" placeholder="8~32자리 특수문자포함 입력해주세요 " minlength="8" maxlength="32"/>

				<div class="title">비밀번호 재확인</div>
				<input type="password" id="inp_re_pw" placeholder="비밀번호를 재입력 해주세요."  minlength="8" maxlength="32"/>

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
					<input type="text" id="inp_email"/>
					<span id="txtAt">@</span>
					<input type="text" id="inp_domain"/>

					<select id="sel_domain">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
					<input type="button" value="코드발송" id="btn_code"/>
					<div id="codeWrap">
						<input type="text" id="inp_code" placeholder="인증번호를 입력하세요"/>
						<input type="button" id="btn_confirm" value="확 인"/>
						<input type="button" id="btn_re_send" value="재발송"/>
					</div>
				</div>

				<div class="title">키워드</div>
				<select id="sel_keyword">
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
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
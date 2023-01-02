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

	let paramObj = {
		"id": ""
	};

$(document).ready(function(){
	chkStat();
	setEvent();
});//document ready end

function setEvent(){
	// 아이디 중복화인 버튼 클릭 이벤트
	$("#btn_id_db_chk").on("click", function(){
		if(isEmpty("inp_id", "아이디를 입력하세요.") || isExitSpeChar("inp_id", "아이디에 특수문자는 불가능합니다.")){
			return;
		}

		paramObj.id = $("#inp_id").val();

		sendServer("selectPJ200DupInfoCheck", paramObj, function callback(result){
			// 서버 수정과 함께 변경된 가능성이 있음 2022.12.18 (추가처리)
			if(result.dup == "Y"){
				commonPopup("중복된 아이디 입니다.");
				$("#form_idDupChkYn").val("N");
				return;
			}
			$("#form_idDupChkYn").val("Y");
			$("#form_id").val($("#inp_id").val());
		});
	}); //IdDbCkBtn click end

	//핸드폰 번호 숫자만 받기
	$("#inp_phone").on("keyup", function(e){
		if(e.keyCode < 48 || e.keyCode > 57) {
			commonPopup("숫자만 입력하세요.");
			$("#inp_phone").val("");
			return;
		}
	}); //inputPhone keypress end

	//도메인 셀렉터 선택시 텍스트창으로 값 이동
	$("#sel_domain").change(function(){
		$("#inp_domain").val($("#sel_domain").val());
	}); //selectDomain change end

	//이메일 인증 확인버튼 클릭
	$("#btn_confirm").on("click", function(){
		// 미구현 2022.12.18 (추가처리)
		// 기존 url: checkCodes
		// 처리내용: 인증 성공 or 실패
	});

	$("#btn_code").on("click", function(){
		if(isEmpty("inp_email", "이메일을 입력하세요.") || isEmpty("inp_domain", "이메일 주소를 입력하세요.")){
			return;
		}

		$("#codeWrap").show();
		// 미구현 2022.12.18 (추가처리)
		// 기존 url: sendCodes
		// 처리내용: 메징전송 성공 or 실패
	}); //sendCode click end

	$("#btn_re_send").on("click", function(){
		// 미구현 2022.12.18 (추가처리)
		// 기존 url: sendCodes
		// 처리내용: 메징전송 성공 or 실패
	});//reSend click end

	$("#btn_pre").on("click", function(){ //이전버튼 클릭
		location.href = "PJ200M";
	}); //preBtn click end

	$("#btn_next").on("click", function(){
		if(!checkAllConditionForJoin()){
			return;
		}
		setValToForm();
		$("#memForm").submit();
	});
}

function chkStat(){
	if("${sMemVo.mem_no}" != "" || "${memVo.marketing}" == "") {
		//location.href="PJ100M";
	}
}

</script>
</head>

<form action="PJ202M" id="memForm" method="post">
	<input type="hidden" id="form_name" name="name"/>
	<input type="hidden" id="form_birth" name="birth"/>
	<input type="hidden" id="form_sex" name="sex"/>
	<input type="hidden" id="form_id" name="id"/>
	<input type="hidden" id="form_pw" name="pw"/>
	<input type="hidden" id="form_telcom" name="telcom"/>
	<input type="hidden" id="form_phone" name="phone"/>
	<input type="hidden" id="form_email" name="email"/>
	<input type="hidden" id="form_email_confirm" name="email_confirm"/>
	<input type="hidden" id="form_keyword" name="keyword"/>
	<input type="hidden" id="form_keyword_no" name="keyword_no"/>
	<input type="hidden" id="form_marketing" name="marketing" value="${memVo.marketing}"/>
	<input type="hidden" id="form_idDupChkYn" value="N"/>
</form>

<body>
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
					<option value="0">연도</option>
					<c:forEach var="i" begin="1900" end="2021" step="1" >
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<select id="sel_month">
					<option value="0">월</option>
					<c:forEach var="i" begin="1" end="12" step="1" >
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<select id="sel_day">
					<option value="0">일</option>
					<c:forEach var="i" begin="1" end="31" step="1" >
						<option value="${i}">${i}</option>
					</c:forEach>
				</select><br/>

				<div id="rad_sex">
					<label><input type="radio" name="rad_name_sex" value="0" checked/>선택없음</label>
					<label><input type="radio" name="rad_name_sex" value="1"/>남자</label>
					<label><input type="radio" name="rad_name_sex" value="2"/>여자</label>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ200Css/PJ205C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ200Js/PJ205S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${sMemVo.mem_no}" != "")
	{	
		location.href="main";
	}
	
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
		if($.trim($("#inputName").val()) == "")		{
			popupText = "이름을 입력하세요.";
			commonPopup(popupText);
			$("#inputName").focus();
		} else if(pattern3.test($("#inputName").val())) {
			popupText = "이름에 특수문자 사용 불가능합니다.";
			commonPopup(popupText);
			$("#inputName").val("");
			$("#inputName").focus();
		} else if(pattern1.test($("#inputName").val())) {
			popupText = "이름에 숫자는 사용 불가능합니다.";
			commonPopup(popupText);
			$("#inputName").val("");
			$("#inputName").focus();
		} else if($.trim($("#inputEmail").val()) == "") {
			popupText = "이메일을 입력하세요.";
			commonPopup(popupText);
			$("#inputEmail").focus();
		} else if($.trim($("#inputDomain").val()) == "") {
			popupText = "이메일 주소를 입력하세요.";
			commonPopup(popupText);
			$("#inputDomain").focus();
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
			var params = $("#infoForm").serialize();
			
			$.ajax({
				url: "findIDs",
				data: params,
				dataType:"json",
				type: "post",
				success:function(result)
				{
					if(result.msg == "success")
					{
						findIDPopup(result.ID, result.NAME);
					}
					else
					{
						popupText = "일치하는 아이디가 없습니다.";
						commonPopup(popupText);
					}
				}, //success end
				error: function(request, status, error) {
					console.log(error);
				} // error end
			}); //ajax end 
		} // if ~ else end
	}); //nextBtn click end
}); //document ready end
</script>                                                                                           
</head>

<form action="#" id="testForm">
    <input type="hidden" id="name" name="name"/>
    <input type="hidden" id="email" name="email"/>
	<input type="hidden" id="keyword" name="keyword"/>
	<input type="hidden" id="keyword_no" name="keyword_no"/>
</form>

<body>
<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<div class="findID">[아이디 찾기]</div>
			
			<div id="infoWrap">
				<div class="title">이름</div>
				<input type="text" id="inp_name" placeholder="이름를 입력해 주세요."/>

				<div class="title">이메일</div>
				<div>
					<input type="text" id="inp_email" name="inputEmail"/>
					<span id="txtAt">@</span>
					<input type="text" id="inp_domain" name="inputDomain"/>

					<select id="sel_domain">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
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
			
				<div id="btnWrap">
					<input id="btn_pre" type="button" value="Prev"/>
					<input id="btn_next" type="button" value="Next"/>
				</div>
			</div>
		</div>
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
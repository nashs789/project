<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정정보작성</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ200Css/PJ202C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/js/callServer.js"></script>
	<script type="text/javascript" src="static/js/callPopup.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ202Js/PJ202S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/*
	if("{sMEM_NO}" != "" || "{data.marketing}" == "") {
		location.href="main";
	}

	var popupText = ""; //팝업 문구변경
	var nicCheck = "";  //닉네임 중복 확인용
	
	$("#nicDbCkBtn").on("click", function(){  //닉네임 중복체크
		$(".popup").remove();
		$(".bg").remove();
		if($.trim($("#inputNic").val()) == "") {
			popupText = "닉네임을 입력하세요.";
			commonPopup(popupText);
			$("#inputNic").focus();
			return false;
		}
		
		$("#valueStorage").val($("#inputNic").val());
		
		var params = $("#Form").serialize();
		
		$.ajax({
			url: "nicDbCk",
			data: params,
			dataType:"json",
			type: "post",
			success:function(result) {
				if(result.msg == "success") {
					popupText = "사용 가능한 닉네임입니다.";
					commonPopup(popupText);
					nicCheck = $("#inputNic").val();
				} else {
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
					if(res.fileName.length > 0)  {
						$("#photoPath").val(res.fileName[0]);
						
						var path = "resources/upload/"+res.fileName[0];
						
						$("#photo").attr("src", path);
					}
				} else  {
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
				if($.trim($("#inputIntro").val()) == "") { //소개글 입력 없을 시
					$("#inputIntro").val("안녕하세요~ 잘 부탁드립니다.");
				}

				if($.trim($("#inputNic").val()) == "") {
					popupText = "닉네임을 입력하세요.";
					commonPopup(popupText);
					$("#inputNic").focus();
					return false;
				} else if($("#inputNic").val() != nicCheck) {
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
					var params = $("#infoForm").serialize();
					
					$.ajax({
						url: "joins",
						data: params,
						dataType:"json",
						type: "post",
						success:function(result) {
							if(result.msg = "success") {
								popupText = "회원가입 되셨습니다!!!";
								endPopup(popupText);
							} else if(result.msg = "failed") {
								popupText = "회원가입에 실패아였습니다.";
								commonPopup(popupText);
							} else {
								popupText = "가입중 문제가 발생하였습니다.";
								commonPopup(popupText);
							}
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
	
	$("#btn_pre").on("click", function(){ //이전버튼 클릭
		history.back();
	}); //preBtn click end
	 */
});//document ready end
</script>
</head>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" /> <!-- attach : 첨부 -->
</form>
<form action="#" id="Form">
	<input type="hidden" id="valueStorage" name="storage"/>
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
</form>
<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
			<div id="container">
				<div class="profile">[프로필 설정]</div>

				<div class="milestone">
					<div class="milestone_title">
						약관 동의
					</div>
					<div class="arrow_img"><img src="/static/images/milestone.png"></div>
					<div class="milestone_title">
						정보입력
					</div>
					<div class="arrow_img"><img src="/static/images/milestone.png"></div>
					<div class="milestone_title" id="milestone_on">
						프로필 설정
					</div>
					<div class="arrow_img"><img src="/static/images/milestone.png"></div>
					<div class="milestone_title">
						가입 완료
					</div>
				</div> <!-- milestone end -->

				<div id="infoWrap">
					<div id="photoArea">
						<img id="photo" src="/static/images/profile.png">
					</div>
					<input type="button" value="사진찾기" id="bnt_find_photo"/><span id="fileName"></span>

					<div class="title">닉네임</div>
					<input type="text" placeholder="닉네임을 입력하세요." id="inp_nic"/>
					<input type="button" value="중복확인" id="btn_nic_db_chk"/>

					<div class="title">소개글</div>
					<textarea type="text" placeholder="안녕하세요~ 잘 부탁드립니다." id="inp_intro"></textarea>
				</div> <!-- infoWrap end -->

				<div id="btnWrap">
					<input id="btn_pre" type="button" value="Prev"/>
					<input id="btn_next" type="button" value="Next"/>
				</div> <!-- btnWrap -->
			</div><!-- container end -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div> <!-- wrap end -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ200Css/PJ202C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ200Js/PJ204S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/*
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
	
	$("#preBtn").on("click", function(){ //이전버튼 클릭
		location.href="main";
	}); //preBtn click end
	 */
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
	<input type="hidden" id="keyword_no" name="keyword_no"/>
	<input type="hidden" id="marketing" name="marketing" value=""/> <%-- ${memVo.marketing} --%>
	<input type="hidden" id="photo_path" name="photo_path" value=""/>
	<input type="hidden" id="nic" name="nic" value=""/>
	<input type="hidden" id="MEM_NO" value="${sMemVo.mem_no}"/>
</form>
<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<div class="profile">[프로필 설정]</div>
			
			<div id="infoWrap">
					<div id="photoArea">
						<img id="photo" src="/static/images/profile.png">
					</div>
					<input type="button" value="사진찾기" id="bnt_find_photo"/><span id="fileName"></span>
					
					<div class="title">닉네임</div>
					<input type="text" placeholder="닉네임을 입력하세요." id="inp_nic"/>
					<input type="button" value="중복확인" id="btn_nic_db_chk"/>
					
					<div class="title">소개글</div>
					<input type="text" placeholder="안녕하세요~ 잘 부탁드립니다." id="inp_intro"/>
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
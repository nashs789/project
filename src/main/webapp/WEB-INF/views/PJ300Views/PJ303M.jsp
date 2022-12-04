<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ300Css/PJ303C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/script/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ300Js/PJ303S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수
	
	if("editPostNo" != null){
		//$("input[name=postTitle]").attr("value",${data.TITLE});	
		//$("#postCon").val(CKEDITOR.instances['postCon'].getData());
	}
	CKEDITOR.replace("postCon", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		width : "1280",
		height : "500"
		
	});
	
	$("#writeForm").on("keypress", "input", function (event) {
		if(event.keyCode ==13) {
			return false;
		}
	});
	
	if("${data.CATEGORY_NO}" == "1") { 
		$("#categorySelect").val("1").prop("selected", true); 		
	} else if ("${data.CATEGORY_NO}" == "2") { 
		$("#categorySelect").val("2").prop("selected", true); 		
	} else if ("${data.CATEGORY_NO}" == "3") { 
		$("#categorySelect").val("3").prop("selected", true); 		
	} else { 
		$("#categorySelect").val("4").prop("selected", true); 		
	} 
	
	$("#editBtn").on("click", function () {
		$("#postCon").val(CKEDITOR.instances['postCon'].getData());

		if($.trim($("#postTitle").val()) == "") {
			popupText = "제목을 입력해 주세요.";
			commonPopup(popupText);
			$("#postTitle").focus();
			return false; // ajaxForm 실행 불가
		} else if ($.trim($("#postCon").val()) == "") {
			popupText = "내용을 입력해 주세요.";
			commonPopup(popupText);
			$("#postCon").focus();
			return false;
		}
			var params = $("#writeForm").serialize();

			$.ajax({
				url:"postUpdates", 
				type: "post",
				dataType: "json",
				data : params,
				success: function(res){
					if(res.msg == "success"){
						$("#writeForm").attr("action", "post");
						$("#writeForm").submit();
					} else if (res.msg =="failed") {
						popupText = "작성에 실패 하였습니다.";
						commonPopup(popupText);
					} else {
						popupText = "작성에 실패 하였습니다.";
						commonPopup(popupText);
					}
				}, 
				error : function (request, status, error) {
					console.log(error);
				}
			});		 
}); //editBtn click end

	$("#delBtn").on("click", function () {
		$("#postCon").val('');
		CKEDITOR.instances['postCon'].setData('');
		popupText = "글을 지웠습니다.";
		commonPopup(popupText);
	});
});//document ready end
</script>
</head>
<body>	
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
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
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="path_info">
			<span>
				<img alt="메인페이지" src="static/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp;
			<span>
				자유게시판
			</span>
			&nbsp;>&nbsp;&nbsp;게시글 수정
		</div>

		<form action="#" id="writeForm" method="post">
			<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
			<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
			<input type="hidden" id="editPostNo" name="editPostNo" value="${param.postNo}"/>
			<input type="hidden" id="postNo" name="postNo" value="${param.postNo}"/>
			<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
			<div class="title_area">
				<input type="text" class="input_title" id="postTitle" name="postTitle" value="${data.TITLE}" placeholder="게시글 제목" size="50" maxlength="30" autofocus required/>
				<div class="category_area">
					<span class="asterisk">&#42;</span><span>카테고리</span> 
					<select class="category_select" id="categorySelect" name="categorySelect">
						<c:choose>
						<c:when test="${sGRADE_NO eq 0}">
						<option value="1">공지사항</option>
						</c:when>
						</c:choose>
						<option value="2">여행꿀팁</option>
						<option value="3">Q&A</option>
						<option value="4">잡담</option>
					</select>
				</div>
			</div>
			<div class="container_wrap">
				<div class="txt_area">
					<textarea rows="30" cols="150" placeholder="내용을 입력하시오" id="postCon" name="postCon">${data.CONTENTS}</textarea>
				</div>
				<div class="post_bottom">
					<div class="btn_list">
						<input type="button" id="editBtn" class="add_btn" value="수  정" /> 
						<input type="reset" id="delBtn" class="del_btn" value="글 지우기" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
</body>
</html>
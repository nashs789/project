<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ300Css/PJ302C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript"	rc="static/script/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ300Js/PJ302S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${sMemVo.mem_no}" != "") { // 로그인 상태
		// 알아보거나 기존 JSP파일 보고 수정할것
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
	
	$("#enrollBtn").on("click", function () {
		
				$("#postCon").val(CKEDITOR.instances['postCon'].getData());
				
				if($.trim($("#postTitle").val()) == "") {
					alert("제목을 입력해 주세요.");
					$("#postTitle").focus();
					return false; // ajaxForm 실행 불가
				} else if ($.trim($("#postCon").val()) == "") {
					alert("내용을 입력해 주세요.");
					$("#postCon").focus();
					return false;
				}
					var params = $("#writeForm").serialize();

					$.ajax({
						url:"postWrites", 
						type: "post",
						dataType: "json",
						data : params,
						success: function(res){
							if(res.msg == "success"){
								$("#newPostNo").val(res.postNo);
								location.href = "community";
							} else if (res.msg =="failed") {
								alert("작성에 실패하였습니다.")
							} else {
								alert("작성중 문제가 발생하였습니다.")
							}
						}, 
						error : function (request, status, error) {
							console.log(error);
						}
					});		 
	}); //enrollBtn click end

	$("#delBtn").on("click", function () {
		$("#postCon").val('');
		CKEDITOR.instances['postCon'].setData('');
		alert("글을 삭제합니다. // 팝업창 : 예, 아니오 로 만들기");
	});
});//document.ready end
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
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="path_info">
			<span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 자유게시판 </span>
			&nbsp;>&nbsp;&nbsp;게시글 작성
		</div>
		<form action="#" id="writeForm" method="post">
			<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
			<input type="hidden" id="postNo" name="postNo" value="${param.postNo}"/>
			<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
			<input type="hidden" id="newPostNo" name="newPostNo" value="${postNo}"/>
			<div class="title_area">
				<input type="text" class="input_title" id="postTitle" name="postTitle" placeholder="게시글 제목" size="50" maxlength="30" autofocus required/>
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
					<textarea rows="30" cols="150" placeholder="내용을 입력하시오" id="postCon" name="postCon"></textarea>
				</div>
				<div class="post_bottom">
					<div class="btn_list">
						<input type="button" id="enrollBtn" class="add_btn"  value="등  록" /> 
						<input type="reset" id="delBtn" class="del_btn" value="삭  제" />
					</div>
				</div>
			</div>
		</form>
	</div>
  <jsp:include page="../Frame/footer.jsp"></jsp:include>
	<div class="alert_popup">
		<div class="alert_popup_entity_txt">작성 중인 내용을 전부 삭제하시겠습니까?</div>
		<div class="alert_btn_list2">
			<span>확 인</span><span>취 소</span>
		</div>
	</div>
	<div class="bg"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터-자주 묻는 질문</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ900Css/PJ900C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ900Js/PJ900S.js"></script>
<script type="text/javascript">
	var popupText = "";
	$(document).ready(function() {
		
		if($("#sidebarGbn").val() == "") {
			reloadCnt();
		}
		
		$("#sidebarGbn1").on("click", function() {
			$("#sidebarGbn").val($("#sidebarGbn1").val());
			$(".qna_list").empty();
			$("#searchTxt").val("");
			reloadCnt();
		});
		$("#sidebarGbn2").on("click", function() {
			$("#sidebarGbn").val($("#sidebarGbn2").val());
			$(".qna_list").empty();
			$("#searchTxt").val("");
			reloadCnt();
		});
		 $("#sidebarGbn3").on("click", function() {
			$("#sidebarGbn").val($("#sidebarGbn3").val());
			$(".qna_list").empty();
			$("#searchTxt").val("");
			reloadCnt();
		});
		 
		$("#sidebarGbn4").on("click", function() {
			$("#sidebarGbn").val($("#sidebarGbn4").val());
			$(".qna_list").empty();
			$("#searchTxt").val("");
			reloadCnt();
		}); 
		
		$("#questionSearchIcon").on("click", function() {
			//$("#mainSearchOldTxt").val($("#mainSearchTxt").val());
			$("#sidebarGbn").val("");
			$(".qna_list").empty();
			reloadCnt();
		});
		
		$(".more").on("click", function() {
			reloadList();
		});
		
		$(".qna_list").on("click", ".question", function(){
			$(".answer").slideUp();
			
			if(!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			}
		});
	}); // document ready end..
</script>
</head>

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
<form action="post" id="postForm" method="post">
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
</form>

<body>
	<div id="wrap">
		<!-- header부분 고정 -->
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="journalNo" name="journalNo" value=""/>
				<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
				<input type="hidden" id="FAQCnt" name="FAQCnt" />
				<input type="hidden" id="firstCnt" name="firstCnt" />
				<input type="hidden" id="lastCnt" name="lastCnt" />
				<input type="hidden" id="addCnt" name="addCnt" />
				<input type="hidden" id="sidebarGbn" name="sidebarGbn" value="" />
			<div class="client_center_search">
				<div class="client_center_name">
					<div>고객센터</div>					
				</div>
				<div class="question_search">
					<input type="text" id="searchTxt" name="searchTxt" placeholder="자주 묻는 질문 검색" />
					<div><img alt="검색" src="static/images/search.png" id="questionSearchIcon"></div>
				</div>
			</div>
			</form>
			<div class="sidebar">
				<div class="sidebar1" id="question">자주 묻는 질문</div><div class="sidebar2" id="matter">문의사항</div>
				<div class="sidebar3">
					<p>
						고객센터 1577-8253<br/>
						365일, 24시간 운영
					</p>
				</div>
			</div>
			<div class="question_sidebar">
				<ul>
					<li id="sidebarGbn1" value="1">회원서비스</li>
					<li id="sidebarGbn2" value="2">여행/자유게시판</li>
					<li id="sidebarGbn3" value="3">등급/랭킹</li>
					<li id="sidebarGbn4" value="4">신고</li>
				</ul>
			</div>
			<div class="question_area">
				<ul class="qna_list"></ul>
				<div class="more">
					더보기 <img alt="더보기" src="static/images/under_y.png">
				</div>
			</div>
		</div> <!-- container end -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>	
	</div>
</body>
</html>
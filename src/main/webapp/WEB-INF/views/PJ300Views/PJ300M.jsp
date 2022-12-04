<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ300Css/PJ300C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ300Js/PJ300S.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/*
	var popupText = "";
	var path = "";
	var path2 = "";
	
	var params = $("#memForm").serialize();
	
	$.ajax({
		url: "checkPoints",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result)
		{
			if(result.msg == "success")
			{
				var html = "";
				
				html += "<span>총 게시글  " + result.data.JOURNAL_CNT + "</span> <span>팔로워 " + result.data.FOLLOWER_CNT + "</span>";
				
				$(".cnt").html(html);
			}
			else
			{
				popupText = "오류가 발생했습니다.";
				commonPopup(popupText);
			}
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end
	
	$("#categoryNo").val(0);
	$("#gradeNo").val(0);
	if("{param.boardSearchFilter}" != ""){
		$("#boardSearchFilter").val("{param.boardSearchFilter}");
	} 
	reloadList();
	makePathInfo();

	$("#newPost").on("click", function() {
		if("{sMEM_NO}" == "") { // 비로그인 상태
			popupText = "로그인이 필요한 서비스입니다.";
			commonPopup(popupText);
		} else {
			location.href = "postWrite";
		}
  		
  	});
	
	$("#btn_search").on("click", function () {
		$("#Pages").val(1);
		reloadList();
		makePathInfo();
	});
	
	$(".paging").on("click", "span", function () {
		$("#Pages").val($(this).attr("name"));
		reloadList();
		makePathInfo();
	});	
	
	$(".board_list").on("click", "td", function(){
		if($(this).attr("class") == "title")
		{
			$("#postNo").val($(this).attr($(this).attr("class")));
			$("#postForm").submit();
		}
	}); //board_list click td end
	
	$(".board_list").on("click", "td", function(){
		if($(this).attr("class") == "user")
		{
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		}
	}); //board_list click td end
	
	$(".order_list").on("click", "li", function () {
		$(".categoryNo").css("color","#2e3459");
		$(".gradeNo").children("img").css("background-color","#2e3459");
		$("#postAll").children("span").children("img").css("background-color","#f37321");

		$("#gradeNo").val(0);
		$("#categoryNo").val($(this).attr($(this).attr("class")));
		if($("#categoryNo").val() == 1){ //공지사항
			noticeList();
			$(this).css("color","#f37321");
			$(".gradeNo").children("img").css("cursor","auto");
		} else {
			$(this).css("color","#f37321");
			$(".gradeNo").children("img").css("cursor","pointer");
			$("#Pages").val(1);
			reloadList();
		}
	}); //order_list li  end

	$(".left_nav").on("click", "span", function(){ //작성자 여행등급 필터
		$(".gradeNo").children("img").css("background-color","#2e3459");
		console.log($(this).attr($(this).attr("class")));
		$("#gradeNo").val($(this).attr($(this).attr("class")));
		if($("#categoryNo").val() != 1){ //전체보기, 여행꿀팁, Q&A, 잡담
			console.log($(this).children());
			$(this).children("img").css("background-color","#f37321");
			$("#Pages").val(1);
			reloadList();
		} else {
			$("#postAll").children("span").children("img").css("background-color","#f37321");
		}
	}); //left_nav span click end
	 
	$(".right_nav").on("click", "span", function(){ //내가 쓴 글, 댓글쓴 글, 글쓰기
		console.log($(this).attr($(this).attr("class")));
		$(".gradeNo").children("img").css("background-color","#2e3459");
		$(this).children("img").css("background-color","#f37321");
		$("#gradeNo").val($(this).attr($(this).attr("class")));
		if("{sMEM_NO}" == "") { // 비로그인 상태
			popupText = "로그인이 필요한 서비스입니다.";
			commonPopup(popupText);
			$(".gradeNo").children("img").css("background-color","#2e3459");
		} else {
			reloadList();
		}	
	}); //right_nav span click end
  	*/
}); //document ready end

</script>
</head>

<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}"/>
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>

<form action="#" id="testForm">
	<input type="hidden" id="nfirstPage" name="nfirstPage" value="1"/> <!-- n이 붙은건 공지 페이지 -->
	<input type="hidden" id="nlastPage" name="nlastPage" value="5"/> <%-- n이 붙은게 무슨 뜻인지 몰라서 id는 그대로 나둠--%>

	<input type="hidden" id="Pages" name="Pages" value="${Pages}"/>
	<input type="hidden" id="categoryNo" name="categoryNo" value=""/>
	<input type="hidden" id="gradeNo" name="gradeNo" value=""/>
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="memGradeNo" name="memGradeNo" value="${sGRADE_NO}"/>

	<input type="hidden" id="categoryNo" name="boardSearchTxt" value=""/> <%-- <input type="text" class="search" name="boardSearchTxt" placeholder="검색" value="${param.searchTxt}"> --%>
	<input type="hidden" id="boardSearchFilter" name="boardSearchFilter" value=""/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>

		<div id="path_info">
			<span>
				<img alt="메인페이지" src="static/images/home.png" class="home_icon">
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 자유게시판 </span>
			<div class="make_path_info">
				 &nbsp;&nbsp;>&nbsp;&nbsp;
			</div>
		</div>
		<div class= "top_msg">
			<span>자유게시판</span>
			<span>다른 사용자들과 의견을 나누세요.</span>
		</div>
		<img id="comBg" src="static/images/board2.png">

		<div class="sub_area">

		</div>
		
		<div id="container">
			<div class="top_area">
				<div class="sub_profile">
					<div id="tempArea">
						<img alt="profile" src="static/images/profile3.png" class="profile_img">
					</div>
					<div class="info">
						<span>${sMemVo.nic}</span>
						<div class="grade">
							<img alt="icon" src="static/images/grade.png">
							<c:choose>
							<c:when test="${sMemVo.grade eq 0}">
							<span>관리자</span>
							</c:when>
							<c:when test="${sMemVo.grade eq 1}">
							<span>여행꾼</span>
							</c:when>
							<c:when test="${sMemVo.grade eq 2}">
							<span>여행작가</span>
							</c:when>
							</c:choose>
						</div>
						<div class="cnt">

						</div>
					</div>
				</div>
			</div>
			<div class="category_nav">
			<nav class="order_list">
				<ul>
					<li class="categoryNo" categoryNo="0">전체보기</li>
					<li class="categoryNo" categoryNo="1">공지사항</li>
					<li class="categoryNo" categoryNo="2">여행꿀팁</li>
					<li class="categoryNo" categoryNo="3">Q & A</li>
					<li class="categoryNo" categoryNo="4">잡&nbsp;&nbsp;&nbsp;담</li>
				</ul>
			</nav>
		</div>
			<div class="board_list_wrap">
				<div class="board_menu">
					<nav class="left_nav">
						<ul>
							<li id="postAll">
								<span class="gradeNo" gradeNo="0">
									<img alt="bookmark" src="static/images/all.png">
								</span>
								<br />전체보기
							</li>
							<li id="postGrade2">
								<span class="gradeNo" gradeNo="2">
									<img alt="bookmark" src="static/images/writer.png">
								</span>
								<br />여행작가
							</li>
							<li id="postGrade1">
								<span class="gradeNo" gradeNo="1">
									<img alt="작성자" src="static/images/user2.png">
								</span>
								<br />여행꾼
							</li>
						</ul>
					</nav>
					<nav class="right_nav">
						<ul>
							<li>
								<span class="gradeNo" gradeNo="3">
									<img alt="bookmark" src="static/images/doc.png">
								</span>
								<br />내가 쓴 글
							</li>
							<li id="newPost">
								<img alt="bookmark" src="static/images/pen.png">
								<br />글쓰기
							</li>
						</ul>
					</nav>
				</div>
	
				<table class="board_list">
					<colgroup>
						<col width="5%" /> <!-- 글번호 -->
						<col width="10%" /> <!-- 카테고리 -->
						<col width="30%" /> <!-- 제목 -->
						<col width="10%" /> <!-- 등급 -->
						<col width="10%" /> <!-- 닉네임 -->
						<col width="10%" /> <!-- 작성일 -->
						<col width="5%" /> <!-- 조회 -->
						<col width="5%" /> <!-- 좋아요 -->
					</colgroup>
					<caption>게시판 목록</caption>
					<thead>
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>등급</th>
							<th>닉네임</th>
							<th>작성일</th>
							<th>조회</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>

				<div class="paging_wrap">
					<div class="paging"></div>
						<div class="board_search">
							<img alt="search" src="static/images/search.png" class="search_icon" id="btn_search"/>
							<input type="text" class="search" placeholder="검색" value="{param.searchTxt}"> 
							<select class="filter" id="sel_board_search_filter">
								<option value="0">통합검색</option>
								<option value="1">제목</option>
								<option value="2">닉네임</option>
							</select>
					</div>
				</div> <!-- PAGING_WRAP END -->

			</div>
		</div>
	</div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
</body>
</html>
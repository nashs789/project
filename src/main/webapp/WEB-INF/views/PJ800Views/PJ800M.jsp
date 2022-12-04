<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행작가</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ800Css/PJ800C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ800Js/PJ800S.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수

		reloadList();

		// 페이징 처리
		$(".paging").on("click", "div", function() {
			$($("#Pages").val($(this).attr("Pages")));
			$("#searchTxt").val($("#searchTxt").val());
			reloadList();
		});

		// 회원프로필 이동
		$("#writerRank").on("click", "tr", function() {
			$("#userNo").val($(this).attr("mno"));

			$("#userForm").attr("action", "userPage");
			$("#userForm").submit();
		});

		// 검색처리
		$("#searchBtn").on("click", function() {
			$("#Pages").val(1);
			$("#sTxt").val($("#searchTxt").val());
			console.log($("#sTxt").val());
			reloadList();
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
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<!-- 여기서 부터 랭킹 -->
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="Pages" name="Pages" value="${Pages}" />
				<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
				<input type="hidden" id="searchOldTxt" value="${param.searchTxt}" />
				<input type="hidden" id="sTxt" name="sTxt" value="${param.sTxt}" />
			</form>
			<div class="rank_area">
				<div class="nic_search">
					검색 :
					<input class="nic_txt" type="text" id="searchTxt" placeholder="닉네임을 입력하세요."/>
					<input class="nic_btn" type="button" id="searchBtn" value="검색" />
				</div>
				<div class="travel_writer_rank">
					<table>
						<colgroup>
							<col width="80px" /> <!-- 랭킹 -->
							<col width="120px" /> <!-- 닉네임 -->
							<col width="100px" /> <!-- 여행게시판 -->
							<col width="100px" /> <!-- 좋아요 -->
							<col width="100px" /> <!-- 팔로워 -->
							<col width="150px" /> <!-- 여행작가 점수 -->
						</colgroup>
						<thead>
							<tr class="article">
								<th class="click_article">랭킹</th>
								<th>닉네임</th>
								<th class="click_article">여행게시판</th>
								<th class="click_article">좋아요</th>
								<th class="click_article">팔로워</th>
								<th class="click_article">여행작가 점수</th>
							</tr>
						</thead>
						<tbody id="writerRank"></tbody>
					</table>
				</div>
				<div class="travel_writer_score">
					<h4>※ 여행작가 점수 산정 방법</h4>
					<h6>·여행게시판 작성 : 20점  ·좋아요 : 5점  ·팔로워 : 5점</h6>
				</div>
				<div class="paging"></div>
			</div>
		</div>
		<!-- 여기까지 랭킹 갖고온거 -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
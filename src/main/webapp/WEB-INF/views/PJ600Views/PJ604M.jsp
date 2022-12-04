<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>통합검색-닉네임</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ600Css/PJ604C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ604Js/PJ600S.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수

		reloadList();

		// 셀렉터 옵션 유지
		if("${param.mainSearchFilter}" != "") {
			$("#mainSearchFilter").val("${param.mainSearchFilter}");
		}

		// 페이징 처리
		$(".paging").on("click", "div", function() {
			$($("#Pages").val($(this).attr("Pages")));
			$("#searchTxt").val($("#searchTxt").val());
			$("#allCkbox").prop("checked", false);
			reloadList();
		});

		// 회원프로필 이동
		$("#nicGallery").on("click", "tr", function() {
			$("#userNo").val($(this).attr("memNo"));

			$("#userForm").attr("action", "userPage");
			$("#userForm").submit();
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
	<input type="hidden" id="memNo" name="memNo" value="" />
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<form action="#" id="hidden" method="post">
				<input type="hidden" id="sTxt" value="${param.mainSearchTxt}" />
				<input type="hidden" id="sFilter" value="${param.mainSearchFilter}" />
			</form>
			<div class="search_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="Pages" name="Pages" value="${Pages}" />
					<input type="hidden" id="mainSearchOldTxt" value="${param.mainSearchTxt}" />
				<div class="sub_search">
					검색 :
					<select class="search_filter" id="mainSearchFilter" name="mainSearchFilter">
							<option value="0" selected="selected">통합검색</option>
							<option value="1">여행일지</option>
							<option value="2">해시태그</option>
							<option value="3">자유게시판</option>
							<option value="4">닉네임</option>
					</select>
					<input class="search_txt" type="text" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" />
					<input class="search_btn" type="button" value="검색" />
				</div>
				</form>
				<!-- 닉네임 검색결과 시작 -->
				<div class="line"></div>
				<div class="search_category">닉네임</div>
				<div class="search_category_cnt" id="nicCnt">${nicCnt}개의 닉네임이 검색되었습니다.</div>

				<div class="search_nic">
					<table>
						<colgroup>
							<col width="120px" /> <!-- 닉네임 -->
							<col width="100px" /> <!-- 등급 -->
							<col width="120px" /> <!-- 여행게시판 -->
							<col width="100px" /> <!-- 좋아요 -->
							<col width="100px" /> <!-- 팔로워 -->
						</colgroup>
						<thead>
							<tr class="article">
								<th>닉네임</th>
								<th>등급</th>
								<th>여행게시판</th>
								<th>좋아요</th>
								<th>팔로워</th>
							</tr>
						</thead>
						<tbody id="nicGallery"></tbody>
					</table>
				</div>
				<!-- 닉네임 검색결과 끝 -->
				<div class="paging"></div>
			</div> <!-- search area end -->
		</div>
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
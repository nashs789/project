<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터-문의사항</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ900Css/PJ901C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ900Js/PJ901S.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var popupText = "";

		reloadList();

		// 작성버튼 클릭 시
		$("#writeBtn").on("click", function() {
			if("${sMEM_NO}" != "") {
				$("#actionForm").attr("action", "clientCenterMatterWrite");
				$("#actionForm").submit();
			} else {
				makePopup("로그인이 필요합니다.", function() {
					console.log("작성 팝업");
				});
			}
		});

		// 검색 처리
		$("#questionSearchIcon").on("click", function() {
			$("#Pages").val(1);
			$("#searchOldTxt").val($("#searchTxt").val());
			reloadList();
		});

		// 페이징 처리
		$(".paging").on("click", "div", function() {
			$($("#Pages").val($(this).attr("Pages")));
			$("#searchTxt").val($("#searchTxt").val());
			reloadList();
		});

		$("#list_wrap tbody").on("click", "tr", function() {
			$("#qNo").val($(this).attr("qno"));

			$("#actionForm").attr("action", "clientCenterMatterDetail");
			$("#actionForm").submit();
			//console.log($("tr .writeMemNo").val());
		});
	}); // document ready end..
</script>
</head>
<body>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
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
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="journalNo" name="journalNo" value=""/>
				<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
				<input type="hidden" id="nic" name="nic" value="${sNIC}" />
				<input type="hidden" id="qNo" name="qNo" />
				<input type="hidden" id="Pages" name="Pages" value="${Pages}" />
				<input type="hidden" id="searchOldTxt" name="searchOldTxt" value="${param.searchTxt}" />
				<div class="client_center_search">
					<div class="client_center_name">
						<div>고객센터</div>
					</div>
					<div class="question_search">
						<input type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}" placeholder="문의사항 검색" />
						<div><img alt="검색" src="./resources/images/search.png" id="questionSearchIcon"></div>
					</div>
				</div>
				<div class="sidebar">
					<div class="sidebar1" id="question">자주 묻는 질문</div><div class="sidebar2" id="matter">문의사항</div>
					<div class="sidebar3">
						<p>
							고객센터 1577-8253<br/>
							365일, 24시간 운영
						</p>
					</div>
				</div>

				<div id="list_wrap">
					<table>
						<colgroup>
							<col width="100px" /> <!-- 문의번호 -->
							<col width="120px" /> <!-- 작성자(닉네임) -->
							<col width="500px" /> <!-- 제목 -->
							<col width="120px" /> <!-- 작성일 -->
							<col width="120px" /> <!-- 답변유무 -->
						</colgroup>
						<thead>
							<tr class="article">
								<th>문의번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일</th>
								<th>답변유무</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<div class="matter_write_btn">
					<input type="button" id="writeBtn" value="작성" />
				</div>
				<div class="paging"></div>
			</form>
		</div> <!-- container end -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
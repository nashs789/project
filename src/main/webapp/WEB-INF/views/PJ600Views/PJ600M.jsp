<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>통합검색</title>
		<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
		<link href="static/css/PJ600Css/PJ600C.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
		<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
		<script type="text/javascript" src="static/js/common.js"></script>
		<script type="text/javascript" src="static/js/PJ600Js/PJ600S.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수

		// 셀렉터 옵션 유지
		if("${param.mainSearchFilter}" != "") {
			$("#mainSearchFilter").val("${param.mainSearchFilter}");
		}
		$("#mainSearchTxt").val("${param.mainSearchTxt}");

		// 더보기 처리
		$("#journalMore").on("click", function() {
			$("#actionForm").attr("action", "searchTravelDiary");
			$("#actionForm").submit();
		});
		$("#hashMore").on("click", function() {
			$("#actionForm").attr("action", "searchHashtag");
			$("#actionForm").submit();
		});
		$("#boardMore").on("click", function() {
			$("#actionForm").attr("action", "searchCommunity");
			$("#actionForm").submit();
		});
		$("#nicMore").on("click", function() {
			$("#actionForm").attr("action", "searchNic");
			$("#actionForm").submit();
		});

		// 여행게시판 이동
		$("#journalGallery").on("click", ".search_post", function() {
			$("#journalNo").val($(this).attr("journalno"));

			$("#journalForm").attr("action", "journal");
			$("#journalForm").submit();
		});

		// 여행게시판(해시) 이동
		$("#HashGallery").on("click", ".search_post", function() {
			$("#journalNo").val($(this).attr("journalno"));

			$("#journalForm").attr("action", "journal");
			$("#journalForm").submit();
		});

		// 자유게시판 이동
		$(".board_list").on("click", "tr", function() {
			$("#postNo").val($(this).attr("postNo"));

			$("#postForm").attr("action", "post");
			$("#postForm").submit();
		});

		// 회원프로필 이동
		$(".search_nic").on("click", "tr", function() {
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
		<input type="hidden" id="memNo" name="memNo" />
	</form>
	<form action="post" id="postForm" method="post">
		<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
		<input type="hidden" id="postNo" name="postNo" value=""/>
		<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	</form>
	<form action="#" id="hidden" method="post">
		<input type="hidden" id="sTxt" value="${param.mainSearchTxt}" />
		<input type="hidden" id="sFilter" value="${param.mainSearchFilter}" />
	</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<div class="search_area">
				<form action="#" id="actionForm" method="post">
					<div class="sub_search">
						검색 :
						<select class="search_filter" id="mainSearchFilter" name="mainSearchFilter">
								<option value="0" selected="selected">통합검색</option>
								<option value="1">여행게시판</option>
								<option value="2">해시태그</option>
								<option value="3">자유게시판</option>
								<option value="4">닉네임</option>
						</select>
						<input class="search_txt" type="text" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" />
						<input class="search_btn" type="button" value="검색" />
					</div>
				</form>
				<div class="line"></div>
				<div class="search_category">여행게시판</div>
				<div class="search_category_cnt" id="journalCnt">${journalCnt}개의 여행게시판이 검색되었습니다.</div>
				<!-- 여행게시판 검색결과 시작 -->
				<div class="gallery" id="journalGallery">
					<c:choose>
						<c:when test="${journalCnt > 0}">
							<c:forEach var="data" items="${journalList}">
								<div class="search_post" journalNo="${data.JOURNAL_NO}">
									<span class="thumb"><img alt="썸네일"
											src="./resources/upload/${data.JOURNAL_PHOTO_PATH}"></span>
									<div class="post_info">
										<p>
											<span>${data.CATEGORY_NAME} > ${data.SUB_CATEGORY_NAME}(${data.REGION_NAME})</span>
										</p>
										<p>
											<strong>${data.TITLE}</strong>
										</p>
										<p>
											<em>${data.HASH}</em>
										</p>
									</div>
									<div class="post_profile">
										<c:choose>
											<c:when test="${!empty data.MEM_PHOTO_PATH}">
												<img alt="작성자" src="./resources/upload/${data.MEM_PHOTO_PATH}"> <span>${data.NIC}</span>
											</c:when>
											<c:otherwise>
												<img alt="작성자" src="./resources/images/profile3.png"> <span>${data.NIC}</span>
											</c:otherwise>
										</c:choose>
										<div>
											<div>
												<span>조회수</span> <span class="cnt">${data.HIT}</span> <span>좋아요</span>
												<span class="cnt">${data.JOURNAL_LIKE_CNT}</span>
											</div>
											<span>${data.JOURNAL_DATE}</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${journalCnt > 10}">
						<div class="more_entity" id="journalMore">여행게시판 더보기</div>
					</c:when>
				</c:choose>
				<!-- 여행게시판 검색결과 끝  -->
				<!-- 해시태그 검색결과 시작 -->
				<div class="line"></div>
				<div class="search_category" id="hashTxt">#${param.mainSearchTxt}</div>
				<div class="search_category_cnt" id="hashCnt">${hashCnt}개의 여행게시판이 검색되었습니다.</div>
				<div class="gallery" id="HashGallery">
					<c:choose>
						<c:when test="${hashCnt > 0}">
							<c:forEach var="data" items="${hashList}">
								<div class="search_post" journalno="${data.JOURNAL_NO}">
									<span class="thumb"><img alt="썸네일"
											src="./resources/upload/${data.JOURNAL_PHOTO_PATH}"></span>
									<div class="post_info">
										<p>
											<span>${data.CATEGORY_NAME} > ${data.SUB_CATEGORY_NAME}(${data.REGION_NAME})</span>
										</p>
										<p>
											<strong>${data.TITLE}</strong>
										</p>
										<p>
											<em>${data.HASH}</em>
										</p>
									</div>
									<div class="post_profile">
										<c:choose>
											<c:when test="${!empty data.MEM_PHOTO_PATH}">
												<img alt="작성자" src="./resources/upload/${data.MEM_PHOTO_PATH}"> <span>${data.NIC}</span>
											</c:when>
											<c:otherwise>
												<img alt="작성자" src="./resources/images/profile3.png"> <span>${data.NIC}</span>
											</c:otherwise>
										</c:choose>
										<div>
											<div>
												<span>조회수</span> <span class="cnt">${data.HIT}</span> <span>좋아요</span>
												<span class="cnt">${data.JOURNAL_LIKE_CNT}</span>
											</div>
											<span>${data.JOURNAL_DATE}</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${hashCnt > 10}">
						<div class="more_entity" id="hashMore">#${param.mainSearchTxt} 더보기</div>
					</c:when>
				</c:choose>
				<!-- 해시태그 검색결과 끝 -->

				<!-- 자유게시판 검색결과 시작 -->
				<div class="line"></div>
				<div class="search_category">자유게시판</div>
				<div class="search_category_cnt" id="boardCnt">${boardCnt}개의 자유게시글이 검색되었습니다.</div>
				<c:choose>
					<c:when test="${boardCnt > 0}">
						<table class="board_list">
							<caption>게시판 목록</caption>
							<colgroup>
									<col width="106px" /> <!-- 글번호 -->
									<col width="124px" /> <!-- 카테고리 -->
									<col width="430px" /> <!-- 제목 -->
									<col width="124px" /> <!-- 등급 -->
									<col width="101px" /> <!-- 닉네임 -->
									<col width="161px" /> <!-- 작성일 -->
									<col width="92px" /> <!-- 조회 -->
									<col width="102px" /> <!-- 좋아요 -->
							</colgroup>
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
							<tbody id="boardGallery">
								<c:forEach var="data" items="${boardList}">
									<tr class="board_data" postNo="${data.POST_NO}">
										<td>${data.POST_NO}</td>
										<td>${data.CATEGORY_NAME}</td>
										<td class="board_title">${data.TITLE}</td>
										<td>${data.GRADE_NAME}</td>
										<td>${data.NIC}</td>
										<td>${data.BOARD_DATE}</td>
										<td>${data.HIT}</td>
										<td>${data.POST_LIKE_CNT}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${boardCnt > 10}">
						<div class="more_entity" id="boardMore">자유게시판 더보기</div>
					</c:when>
				</c:choose>
				<!-- 자유게시판 검색결과 끝 -->

				<!-- 닉네임 검색결과 시작 -->
				<div class="line"></div>
				<div class="search_category">닉네임</div>
				<div class="search_category_cnt" id="nicCnt">${nicCnt}개의 닉네임이 검색되었습니다.</div>
				<c:choose>
					<c:when test="${nicCnt > 0}">
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
								<tbody id="nicGallery">
									<c:forEach var="data" items="${nicList}">
										<tr class="nic" memNo="${data.MEM_NO}">
											<td>${data.NIC}</td>
											<td>${data.GRADE_NAME}</td>
											<td>${data.JOURNAL_CNT}</td>
											<td>${data.LIKE_SUM}</td>
											<td>${data.FOLLOW_CNT}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${nicCnt > 10}">
						<div class="more_entity" id="nicMore">닉네임 더보기</div>
					</c:when>
				</c:choose>
				<!-- 닉네임 검색결과 끝 -->
			</div>
		</div>
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
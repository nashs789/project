<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>일지관리</title>
		<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
		<link href="static/css/PJ000Css/PJ002C.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
		<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
		<script type="text/javascript" src="static/js/callServer.js"></script>
		<script type="text/javascript" src="static/js/callPopup.js"></script>
		<script type="text/javascript" src="static/js/common.js"></script>
		<script type="text/javascript" src="static/js/PJ000Js/PJ002S.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				reloadList();
				
				$(".logo_photo").on("click", function() {
					location.href = "main";
				});
				
				// 페이지 상단 배너 메뉴
				$("#journalBoard").on("click", function() {
			  		location.href = "journalBoard";
			  	});
				$("#community").on("click", function() {
					location.href = "community";
				});
				$("#travelWriter").on("click", function() {
			  		location.href = "travelWriterRank";
			  	});
				$("#clientCenter").on("click", function() {
			  		location.href = "clientCenterQuestion";
			  	});
				$("#admin").on("click", function() {
			  		location.href = "memAdmin";
			  	});
				
				// 내부관리자 메뉴 이동
				$("#menu1").on("click", function() {
					location.href = "memAdmin";
				});
				$("#menu2").on("click", function() {
					location.href = "TravelDiaryAdmin";
				});
				$("#menu3").on("click", function() {
					location.href = "communityAdmin";
				});
				$("#menu4").on("click", function() {
					location.href = "noticeAdmin";
				});
				$("#menu5").on("click", function() {
					location.href = "reportAdmin";
				});
				
				// 셀렉터 옵션 유지
				if("${param.searchFilter}" != "") {
					$("#searchFilter").val("${param.searchFilter}");
				}
				
				// 검색 처리
				$(".search_btn").on("click", function() {
					$("#page").val(1);
					$("#searchOldTxt").val($("#searchTxt").val());
					reloadList();
				});
				
				// 페이징 처리
				$(".paging").on("click", "div", function() {
					$($("#page").val($(this).attr("page")));
					$("#searchTxt").val($("#searchTxt").val());
					$("#allCkbox").prop("checked", false);
					reloadList();
				});
				
				// 체크박스 처리
				$("#allCkbox").on("click", function() {
					if($(this).is(":checked")) {
						$(".ckbox").prop("checked", true);
					} else {
						$(".ckbox").prop("checked", false);
					}
				});
				$("tbody").on("click", ".ckbox", function() {
					if($("tbody .ckbox").length == $("tbody .ckbox:checked").length) {
						$("#allCkbox").prop("checked", true);
					} else {
						$("#allCkbox").prop("checked", false);
					}
				});
				
				// 일지삭제
				$("#diaryDeleteBtn").on("click", function() {
					if($("tbody .ckbox:checked").length >= 1) {
						$(".popupDel").css("display", "inline-block");
						$(".bg").css("display", "inline-block");
						
						$(".popupDel .btn_list #cancel").on("click", function() {
							$(".popupDel").css("display", "none");
							$(".bg").css("display", "none");
						});
						
						$(".popupDel .btn_list #ok").on("click", function() {
							
							var array = new Array();
							$(".ckbox:checked").each(function() {
								array.push($(this).val());
							});
							$("#journalNo").val(array);
							
							var params = $("#actionForm").serialize();
										
								$.ajax({
									url : "TravelDiaryAdminsDeletes",
									type : "post",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.msg == "success") {
											resetVal();
											reloadList();
											$(".popupDel").css("display", "none");
											$(".bg").css("display", "none");
										} else if(res.msg == "failed") {
											alert("삭제에 실패하였습니다.");
										} else {
											alert("삭제중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error) {
										console.log(error);
									}
								});
								
						});
					} else {
						$(".popupDel2").css("display", "inline-block");
						$(".bg2").css("display", "inline-block");
						
						$(".popupDel2 .btn_list #ok").on("click", function() {
							$(".popupDel2").css("display", "none");
							$(".bg2").css("display", "none");
						});
					}
					
					
				});
				
				// 메인검색창 넘어가는 부분(동기)
				$(".search_icon").on("click", function() {
					if($("#mainSearchFilter").val() == 0) {
						$("#goSearch").attr("action", "search");
						$("#goSearch").submit();
					} else if($("#mainSearchFilter").val() == 1) {
						$("#goSearch").attr("action", "searchTravelDiary");
						$("#goSearch").submit();
					} else if($("#mainSearchFilter").val() == 2) {
						$("#goSearch").attr("action", "searchHashtag");
						$("#goSearch").submit();
					} else if($("#mainSearchFilter").val() == 3) {
						$("#goSearch").attr("action", "searchCommunity");
						$("#goSearch").submit();
					} else {
						$("#goSearch").attr("action", "searchNic");
						$("#goSearch").submit();
					}
				});
				
				// 여행일지 세부페이지 이동
				$("#list_wrap tbody").on("click", "td:not(:first-child):not(:last-child)", function() {
					$("#journalNo").val($(this).parent().attr("jno"));
					
					$("#actionForm").attr("action", "journal");
					$("#actionForm").submit();
				});
				
			}); // document ready end..
		</script>
	</head>
	<body>
		<div class="popupDel">
	   		<div class="popup_entity_txt">삭제하시겠습니까?</div>
	        <div class="btn_list">
		    	<span id="ok">OK</span>
		        <span id="cancel">CANCEL</span>
		    </div>
		</div>
		<div class="popupDel2">
	   		<div class="popup_entity_txt">삭제할 일지가 없습니다.</div>
	        <div class="btn_list">
		    	<span id="ok">OK</span>
		    </div>
		</div>
 		<div class="bg"></div>
 		<div class="bg2"></div>
		<div id="wrap">
			<!-- header부분 고정 -->
			<div id="header">
				<div class="banner">
					<div class="top">
						<div class="logo_area">
							<a href="#"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
							<div class="site_name">우리들의 여행일지</div>
						</div>
						<div class="btns"> <!-- 밑에 logins와 연동 -->

						</div>
						<div class="logins">
							<div class="sub_login1">

							</div>
							<div class="sub_login2">

							</div>
						</div>
					</div>
					<!-- 호버시 메뉴 생성 -->
				</div>
				<nav class="menu">
					<ul>
						<li id="journalBoard">여행일지</li>
						<li id="community">자유게시판</li>
						<li id="travelWriter">여행작가</li>
						<li id="clientCenter">고객센터</li>
						<li id="admin">내부관리자</li>
					</ul>
				</nav>
				<form action="#" id="goSearch" method="post" >
					<img alt="search" src="./resources/images/search.png" class="search_icon"/>
					<input type="text" class="search" id="mainSearchTxt" name="mainSearchTxt" value="${param.mainSearchTxt}" placeholder="검색">
					<select class="filter" id="mainSearchFilter" name="mainSearchFilter" >
						<option value="0" selected="selected">통합검색</option>
						<option value="1">여행일지</option>
						<option value="2">해시태그</option>
						<option value="3">자유게시판</option>
						<option value="4">닉네임</option>
					</select>
				</form>
			</div>
			<div id="container">
				<div class="mem_admin_area">
				<form action="#" id="actionForm" method="post">
					<div class="admin_menu">
						<span class="menu1" id="menu1">· 회원관리 </span><span class="menu2" id="menu2"> · 일지관리 </span><span class="menu3" id="menu3"> · 게시판관리</span><span class="menu4" id="menu4"> · 공지관리</span><span class="menu5" id="menu5"> · 신고관리</span>
					</div>
					<div class="sub_search">
						검색 :
						<input type="hidden" id="page" name="page" value="${page}" />
						<input type="hidden" id="searchOldTxt" value="${param.searchTxt}" />
						<input type="hidden" id="journalNo" name="journalNo" value="" />
						<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}" />
						<select class="search_filter" id="searchFilter" name="searchFilter">
								<option value="0" selected="selected">통합검색</option>
								<option value="1">닉네임</option>
								<option value="2">선호도</option>
								<option value="3">카테고리</option>
								<option value="4">제목</option>
						</select>
						<input class="search_date" type="date" id="searchDate1" name="searchDate1" value="${param.searchDate1}" /><span>부터</span> 
						<input class="search_date" type="date" id="searchDate2" name="searchDate2" value="${param.searchDate2}" /><span>까지</span> 
						<input class="search_txt" type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
						<input class="search_btn" type="button" value="검색" />
						<input class="diary_delete_btn" id="diaryDeleteBtn" type="button" value="일지삭제" />
					</div>
					<div id="list_wrap">
						<table>
							<colgroup>
									<col width="32px" /> <!-- 체크박스 -->
									<col width="106px" /> <!-- 일지번호 -->
									<col width="140px" /> <!-- 닉네임 -->
									<col width="124px" /> <!-- 선호도 -->
									<col width="124px" /> <!-- 카테고리 -->
									<col width="430px" /> <!-- 제목 -->
									<col width="124px" /> <!-- 등급 -->
									<col width="161px" /> <!-- 작성일 -->
									<col width="92px" /> <!-- 조회 -->
									<col width="102px" /> <!-- 좋아요 -->
									<col width="110px" /> <!-- 비고 -->
							</colgroup>
							<thead>
								<tr class="article">
									<th><input type="checkbox" class="ckbox" id="allCkbox"/></th>
		            				<th>일지번호</th>
		            				<th>닉네임</th>
		            				<th>선호도</th>
		            				<th>카테고리</th>
		            				<th>제목</th>
		            				<th>등급</th>
		            				<th>작성일</th>
		            				<th>조회</th>
		            				<th>좋아요</th>
		            				<th>비고</th>
		            			</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</form>
				</div> <!-- mem_admin_area end -->
				<div class="paging"></div>
			</div> <!-- container end -->
			<div id="footer">
				<p>
					POPJOURNEY<br/>
					GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br/>
					Copyright© POPJOURNEY. All Rights Reserved.
				</p>
			</div>			
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>신고관리</title>
		<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
		<link href="static/css/PJ000Css/PJ004C.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
		<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
		<script type="text/javascript" src="static/js/callServer.js"></script>
		<script type="text/javascript" src="static/js/callPopup.js"></script>
		<script type="text/javascript" src="static/js/common.js"></script>
		<script type="text/javascript" src="static/js/PJ000Js/PJ004S.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				reloadList();
				
				$(".logo_photo").on("click", function() {
					location.href = "main";
				});
				
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
					reloadList();
				});
				
				//승인
				$("#list_wrap table").on("click", "#approvalBtn", function() {
					$(".popup_approval").css("display", "inline-block");
					$(".bg_approval").css("display", "inline-block");
					
					$("#reportNo").val($(this).parent().parent().attr("pno"));
				});
				$("#cancel").on("click", function() {
					$(".popup_approval").css("display", "none");
					$(".bg_approval").css("display", "none");
				});
				$("#ok").on("click", function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						url: "reportApprovals",
						type: "post",
						dataType: "json",
						data: params,
						success: function(res) {
							$(".popup_approval").css("display", "none");
							$(".bg_approval").css("display", "none");
							reloadList();
						},
						error: function(request, status, error) {
							console.log(error);
						}
					});
				});
				
				//미승인
				$("#list_wrap table").on("click", "#unApprovalBtn", function() {
					$(".popup_unapproval").css("display", "inline-block");
					$(".bg_unapproval").css("display", "inline-block");
					
					$("#reportNo").val($(this).parent().parent().attr("pno"));
				});
				$("#cancels").on("click", function() {
					$(".popup_unapproval").css("display", "none");
					$(".bg_unapproval").css("display", "none");
				});
				$("#oks").on("click", function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						url: "unReportApprovals",
						type: "post",
						dataType: "json",
						data: params,
						success: function(res) {
							$(".popup_unapproval").css("display", "none");
							$(".bg_unapproval").css("display", "none");
							reloadList();
						},
						error: function(request, status, error) {
							console.log(error);
						}
					});
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
				
				/* // 공지사항 세부페이지 이동
				$("#list_wrap tbody").on("click", "td::not(:last-child)", function() {
					$("#reportNo").val($(this).parent().attr("pno"));
					
					$("#actionForm").attr("action", "주소");
					$("#actionForm").submit();
				}); */
				
			}); // document ready end..
		</script>
	</head>
	<body>
		<div class="popup_approval">
	   		<div class="popup_entity_txt">승인하시겠습니까?</div>
	        <div class="btn_list">
	           <span id="ok">확인</span>>
	           <span id="cancel">취소</span>>
	        </div>
	    </div>
		<div class="bg_approval"></div>
		<div class="popup_unapproval">
	   		<div class="popup_entity_txt">미승인하시겠습니까?</div>
	        <div class="btn_list">
	           <span id="oks">확인</span>>
	           <span id="cancels">취소</span>>
	        </div>
	    </div>
 		<div class="bg_unapproval"></div>
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
					<div class="admin_menu">
						<span class="menu1" id="menu1">· 회원관리 </span><span class="menu2" id="menu2"> · 일지관리 </span><span class="menu3" id="menu3"> · 게시판관리</span><span class="menu4" id="menu4"> · 공지관리</span><span class="menu5" id="menu5"> · 신고관리</span>
					</div>
					<form action="#" id="actionForm" method="post">
						<div class="sub_search">
							검색 :
							<input type="hidden" id="reportNo" name="reportNo" />
							<input type="hidden" id="page" name="page" value="${page}" />
							<input type="hidden" id="searchOldTxt" value="${param.searchTxt}" />
							<select class="search_filter" id="searchFilter" name="searchFilter">
									<option value="0" selected="selected">통합검색</option>
									<option value="1">내용</option>
									<option value="2">신고회원</option>
									<option value="3">처리회원</option>
							</select>
							<input class="search_date" type="date" id="searchDate1" name="searchDate1" value="${param.searchDate1}" /><span>부터</span> 
							<input class="search_date" type="date" id="searchDate2" name="searchDate2" value="${param.searchDate2}" /><span>까지</span> 
							<input class="search_txt" type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
							<input class="search_btn" type="button" value="검색" />
						</div>
						<div id="list_wrap">
							<table>
								<colgroup>
										<col width="101px" /> <!-- 신고번호 -->
										<col width="124px" /> <!-- 신고사유 -->
										<col width="430px" /> <!-- 내용 -->
										<col width="124px" /> <!-- 신고회원 -->
										<col width="124px" /> <!-- 처리회원 -->
										<col width="124px" /> <!-- 등록일 -->
										<col width="124px" /> <!-- 처리일 -->
										<col width="124px" /> <!-- 처리상태 -->
										<col width="150px" /> <!-- 비고 -->
								</colgroup>
								<thead>
									<tr class="article">
			            				<th>신고번호</th>
			            				<th>신고사유</th>
			            				<th>내용</th>
			            				<th>신고회원</th>
			            				<th>처리회원</th>
			            				<th>등록일</th>
			            				<th>처리일</th>
			            				<th>처리상태</th>
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
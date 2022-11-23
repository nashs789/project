<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원관리</title>
		<%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
		<link href="static/css/PJ000Css/PJ000C.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
		<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
		<script type="text/javascript" src="static/js/callServer.js"></script>
		<script type="text/javascript" src="static/js/callPopup.js"></script>
		<script type="text/javascript" src="static/js/common.js"></script>
		<script type="text/javascript" src="static/js/PJ000Js/PJ000S.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				reloadList();
				
				$(".logo_photo").on("click", function() {
					location.href = "main";
				});
				
				// 상단배너 -> 여행일지 - 자유게시판 - 여행작가 - 고객센터 - 내부관리자 메뉴 이동
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
				
				// 내부관리자페이지 -> 회원관리 - 일지관리 - 게시판관리 - 공지관리 - 신고관리 메뉴 이동
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
				
				// 회원삭제
				$("#delBtn").on("click", function() {
					if($("tbody .ckbox:checked").length >= 1) {
						$(".popupDel").show();
						$(".bg").show();
						
						$(".popupDel .btn_list #cancel").on("click", function() {
							$(".popupDel").hide();
							$(".bg").hide();
						});
						
						$(".popupDel .btn_list #ok").on("click", function() {
							
							var array = new Array();
							$(".ckbox:checked").each(function() {
								array.push($(this).val());
							});
							$("#userNos").val(array);
							
							console.log(array);
							
							var params = $("#actionForm").serialize();
										
								$.ajax({
									url : "memAdminDeletes",
									type : "post",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.msg == "success") {
											resetVal();
											reloadList();
											$(".popupDel").hide();
											$(".bg").hide();
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
						$(".popupDel2").show();
						$(".bg2").show();
						
						$(".popupDel2 .btn_list #ok").on("click", function() {
							$(".popupDel2").hide();
							$(".bg2").hide();
						});
					}
					
				});
				
				// 등급설정 버튼
				$("#list_wrap tbody").on("click", "#gradeBtn", function() {
					$(".bg_grade").show();
					$(".popup_grade").show();
					$("#gradeMemNo").val($(this).parent().parent().attr("mno"));
				});
				$(".popup_grade #cancel").on("click", function() {
					$(".bg_grade").hide();
					$(".popup_grade").hide();
				});
				$(".popup_grade #ok").on("click", function() {
					if($("#gradeSearchFilter").val() == 2) {
						var params = $("#gradeActionForm").serialize();
						
						$.ajax({
							url: "memGrades",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res) {
								$(".bg_grade").hide();
								$(".popup_grade").hide();
								reloadList();
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
					} else if($("#gradeSearchFilter").val() == 1) {
						var params = $("#gradeActionForm").serialize();
						
						$.ajax({
							url: "memDownGrades",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res) {
								$(".bg_grade").hide();
								$(".popup_grade").hide();
								reloadList();
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
					} else {
						$(".bg_grade").hide();
						$(".popup_grade").hide();
					}
				});
				
				// 회원프로필 이동
				$("#list_wrap tbody").on("click", "td:not(:first-child):not(:last-child)", function() {
					$("#userNo").val($(this).parent().attr("mno"));
					
					$("#actionForm").attr("action", "userPage");
					$("#actionForm").submit();
				});
				
				// 메인검색창 넘어가는 부분
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
	   		<div class="popup_entity_txt">삭제할 회원이 없습니다.</div>
	        <div class="btn_list">
		    	<span id="ok">OK</span>
		    </div>
		</div>
		<form action="#" id="gradeActionForm" method="post">
			<input type="hidden" id="gradeMemNo" name="gradeMemNo" />
	 		<div class="popup_grade">
				<div class="popup_entity_grade">
					<select class="popup_opt_grade" id="gradeSearchFilter" name="gradeSearchFilter">
						<option value="0" selected="selected">등급설정</option>
						<option value="1">여행꾼</option>
						<option value="2">여행작가</option>
					</select>
					<div class="btn_list_grade">
			           <span id="ok">확인</span>>
			           <span id="cancel">취소</span>>
			        </div>
				</div>
			</div>
		</form>
 		<div class="bg"></div>
 		<div class="bg2"></div>
 		<div class="bg_grade"></div>
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
							<input type="hidden" id="page" name="page" value="${page}" />
							<input type="hidden" id="searchOldTxt" value="${param.searchTxt}" />
							<input type="hidden" id="userNos" name="userNos" value="" /> <!-- 체크박스용  -->
							<input type="hidden" id="userNo" name="userNo" /> <!-- 프로필페이지용 -->
							
							<select class="search_filter" id="searchFilter" name="searchFilter">
									<option value="0" selected="selected">통합검색</option>
									<option value="1">아이디</option>
									<option value="2">닉네임</option>
									<option value="3">이름</option>
							</select>
							<input class="search_date" type="date" id="searchDate1" name="searchDate1" value="${param.searchDate1}" /><span>부터</span> 
							<input class="search_date" type="date" id="searchDate2" name="searchDate2" value="${param.searchDate2}" /><span>까지</span> 
							<input class="search_txt" type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
							<input class="search_btn" type="button" value="검색" />
							<input class="mem_delete_btn" type="button" id="delBtn" value="회원삭제" />
					</div>
					<div id="list_wrap">
						<table>
							<colgroup>
								<col width="32px" /> <!-- 체크박스 -->
								<col width="95px" /> <!-- 회원번호 -->
								<col width="110px" /> <!-- 아이디 -->
								<col width="140px" /> <!-- 닉네임 -->
								<col width="111px" /> <!-- 이름 -->
								<col width="75px" /> <!-- 성별 -->
								<col width="75px" /> <!-- 나이 -->
								<col width="160px" /> <!-- 이메일 -->
								<col width="133px" /> <!-- 전화번호 -->
								<col width="100px" /> <!-- 등급 -->
								<col width="100px" /> <!-- 가입일 -->
								<col width="100px" /> <!-- 탈퇴일 -->
								<col width="100px" /> <!-- 게시글 -->
								<col width="100px" /> <!-- 좋아요 -->
								<col width="100px" /> <!-- 팔로워 -->
								<col width="120px" /> <!-- 누적신고 -->
								<col width="100px" /> <!-- 접속횟수 -->
								<col width="100px" /> <!-- 승인대기 -->
								<col width="90px" /> <!-- 등급설정 -->
							</colgroup>
							<thead>
								<tr class="article">
									<th><input type="checkbox" class="ckbox" id="allCkbox"/></th>
									<th>회원번호</th>
									<th>아이디</th>
									<th>닉네임</th>
									<th>이름</th>
									<th>성별</th>
									<th>나이</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>등급</th>
									<th>가입일</th>
									<th>탈퇴일</th>
									<th>게시글</th>
									<th>좋아요</th>
									<th>팔로워</th>
									<th>누적신고</th>
									<th>접속수</th>
									<th>등업신청</th>
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
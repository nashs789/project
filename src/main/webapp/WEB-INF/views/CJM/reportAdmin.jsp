<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>신고관리</title>
		<style type="text/css">
			/*  #fcba03 노랑
				#2e3459 남색
				#f37321 주황
				#294a37 초록
			*/
			body {
				margin: 0px;
				font-size: 0px;
				font-family: 'Black Han Sans', sans-serif;
				min-width: 1480px;
				background-color: #f9f9f9;
			}
			
			/* 여기서부터 헤더 레이아웃 */
			#wrap {
				width: 100%;
				height: 100%;
			}
			#header {
				width: 100%;
				height: 140px;
				background-color: #2e3459;
				position: relative;
			}
			.top {
				display: block;
				width: 100%;
				height: 70px;
				background-color: #FFFFFF;
			}
			.site_name {
				display: inline-block;
				vertical-align: top;
				position: absolute; /* 추가하기 */
				width: 200px;
				font-size: 16px;
				font-weight: bold;
				line-height: 70px;
				color: #2e3459;
			}
			.logo_area {
				display: inline-block;
			    width: calc(100% - 470px);
			    height: 70px;
			    background-color: #FFFFFF;
			    text-indent: 40px;
			}
			.logo_photo {
				height: 35px;
				margin-top: 18px;
			}
			.banner {
				width: 100%;
				height: 70px;
			}
			.menu {
				position: absolute;
				height: 70px;
			    left: 20px;
			}
			.menu ul li {
				list-style: none;
				float: left;
				color: white;
				font-size: 23px;
				font-weight: bold;	
				margin-right: 100px;
				line-height: 70px;
				text-decoration: none;
				cursor: pointer;
			}
			.menu ul li:hover {
				color: #fcba03;
			}
			.search {
				float: right;
				margin: 20px 20px 20px 0px; 
				width: 250px;
				height: 29px;
			}
			.filter {
				float: right;
				margin: 20px 20px 20px 0px; 
				width: 100px;
				height: 35px;
			}
			.search_icon {
				float: right;
				margin: 17px 20px 13px 0px;
				width: 40px;
				cursor: pointer;
			}
			input[type='text']:focus, input[type='password']:focus, input[type="date"], select:focus {
				outline-color: #fcba03;
			}
			/* 여기까지 헤더 레이아웃 !!! */
			
			.popup_approval, .popup_unapproval {
			   display: none;
			   width: 300px;
			   height: 150px;
			   background-color: #fcfcfc;
			   box-shadow: rgba(0, 0, 0, 0.09) 0 6px 9px 0;
			   position: fixed;
			   top: calc(50% - 75px); 
			   left: calc(50% - 150px); 
			   z-index: 500;
			   font-size: 16pt;
			   border-radius: 10px;
			   font-size: 0px;
			   border: 0px;
			}
			.popup_entity_txt {
			   font-size: 12pt;
			   font-weight: bold;
			   text-align: center;
			   line-height: 50px;
			   width: 265px;
			   height:40px;
			   margin: 30px auto 30px auto;
			}
			.btn_list span{
			   text-decoration: none;
			   display:inline-block;
			   text-align:center;
			   width: 120px;
			   height:30px;
			   padding: 10px 15px 10px 15px;
			   font-size: 12pt;
			   color: #f37321;
			   font-weight: bold;
			   line-height: 30px;
			}
			.btn_list span:first-child {
			   border-radius: 0 0 0 10px; 
			}
			.btn_list span:last-child {
			   border-radius: 0 0 10px 0; 
			}
			.btn_list span:hover {
			   background-color: #f37321;
			   color: white;
			   cursor: pointer;
			}
			.bg_approval, .bg_unapproval { /* 클릭 시 inline-block */
				display: none;
				width: 100%;
				height: 1388px;
				position: absolute;
				top: 0px;
				left: 0px;
				background-color: #000000;
				z-index: 400;
				opacity: 0.2;
				position: fixed;
			}
			
			#container {
				display: block;
				width: 1280px;
				margin: 0 auto;
				background-color: #f9f9f9;
			}
			
			
			.mem_admin_area {
				display: block;
				width: 1280px;
				margin: 0px auto;
				padding: 20px 0px 20px 0px;
			}
			.admin_menu {
				display: block;
				height: 50px;
			}
			.admin_menu span {
				cursor: pointer;
				font-size: 15pt;
				font-weight: bold;
			}
			.admin_menu span:hover {
				color: #f37321;
			}
			.menu5 {
				color: #f37321;
			}
			.sub_search {
				display: block;
				margin: 40px auto 20px auto;
				width: 940px;
				height: 40px;
				font-size: 15pt;
				font-weight: bold;
			}
			.search_filter {
				position: relative;
				top: -2px;
				left: 0px;
				width: 100px;
				height: 40px;
			}
			.search_date {
				position: relative;
				top: -2px;
				left: 0px;
				width: 130px;
				height: 37px;
				text-align: center;
			}
			.search_txt {
				position: relative;
				top: -2px;
				width: 200px;
				height: 28px;
				padding: 5px;
				font-size: 10pt;
				border: 1px solid black;
			}
			.search_btn {
				width: 90px;
				height: 40px;
				background-color: #FFFFFF;
				font-size: 11pt;
				font-weight: bold;
				color: #000000;
				cursor: pointer;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.search_btn:hover {
				background-color: #2e3459;
				color: #FFFFFF;
			}			
			
			
			table {
				border-collapse: collapse;
			}
			thead tr {
				background-color: #FFFFFF;
				color: #000000;
				height: 40px;
				border-top: 2px solid #2e3459;
				border-bottom: 1px solid #ccc;
				text-align: center;
			}
			thead tr th {
				padding: 0px 5px;
				font-size: 10pt;
				font-weight: bold;
				text-align: center;
			}
			tbody tr{
				border-bottom: 1px solid #ccc;
				height: 40px;
				text-align: center;
			}
			tbody tr td {
				font-size: 9pt;
				font-weight: 300;
				text-align: center;
			}
			.report_title {
				text-align: left;
			}
			.article th {
				font-size: 10pt;
			}
			.ckbox {
			 	height: 15px;
			 	width: 15px;
			}
			.approval_btn {
				width: 60px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.un_approval_btn{
				width: 60px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.approval_btn:hover {
				background-color: #2e3459;
				color: #FFFFFF;
			}			
			.un_approval_btn:hover {
				background-color: #F1404B;
				color: #FFFFFF;
				border: 2px solid #F1404B;
			}
			.profile_move {
				cursor: pointer;
			}
			.profile_move:hover {
				color: #f37321;
			}
			
			.paging { 
	            font-size: 0;
	            text-align: center;
	            margin: 40px 0px 60px 0px;
	        }  
	        .paging div {
	            display: inline-block;
	            margin-left: 10px;
	            padding: 5px 10px;
	            border-radius: 20px;
	            font-size: 12pt; 
	            font-weight: bold;
	            text-decoration: none;
	        }   
	        .paging_btn {
	            background-color: none;
	            color: #2e3459;
	            letter-spacing:-5px;
	            font-size: 12pt;
	        }
	        .paging div.num {           
	            color: #2e3459;
	        }
	        .paging div:first-child {
	            margin-left: 0;
	        } 
	        .paging div.num:hover,
	        .paging div.num.on,
	        .paging div.paging_btn:hover  {
	            color: #F1404B;
	            text-decoration: underline;
	            cursor: pointer;
	        }
	        
	        .edit_btn {
				width: 45px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.edit_btn:hover {
				background-color: #2E3459;
				color: #FFFFFF;
				border: 2px solid #2E3459;
			}
			.reports_ok {
				background-color: #ffb3b3;
				pointer-events: none;
				color: white;
			}
			.reports_cancel {
				background-color: #b3d1ff;
				pointer-events: none;
				color: white;
			}
			.reports_ok #approvalBtn {
				background-color: #ffb3b3;
				border: 2px solid #ffe6e6;
			}
			.reports_cancel #approvalBtn {
				background-color: #b3d1ff;
				border: 2px solid #e6f0ff;
			}
			.reports_ok #unApprovalBtn {
				background-color: #ffb3b3;
				border: 2px solid #ffe6e6;
			}
			.reports_cancel #unApprovalBtn {
				background-color: #b3d1ff;
				border: 2px solid #e6f0ff;
			}
			
			
			#footer {
				display: block;
				width: 100%;
				height: 100px;
				background-color: #2e3459;
				color: #FFFFFF;
				font-size: 15px;
			}
			#footer p {
				margin: 0px auto;
				padding-top: 20px;
				padding-left: 250px;
				width: 600px;
				height: 80px;
			}
		</style>
		<script type="text/javascript"
				src="resources/script/jquery/jquery-1.12.4.min.js"></script>
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
			
			function reloadList() {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "reportAdmins",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						//날짜 가져오기
						$("#searchDate1").val(res.startDay);
						$("#searchDate2").val(res.today);
						
						//내부관리자-게시판관리
						drawList(res.list);
						drawPaging(res.pb);
					},
					error: function(request, status, error) {
						console.log(error);
					}
				});
				
			}
			
			function drawList(list) {
				var html = "";
				
				for(d of list) {
					if(d.STATUS_NO == "신고대기") {
						html += "<tr pno=\"" + d.REPORT_NO + "\" tno=\"" + d.TARGET_MEM_NO + "\" class=\"reports\">";
					} else if(d.STATUS_NO == "승인") {
						html += "<tr pno=\"" + d.REPORT_NO + "\" tno=\"" + d.TARGET_MEM_NO + "\" class=\"reports_ok\">";
					} else {
						html += "<tr pno=\"" + d.REPORT_NO + "\" tno=\"" + d.TARGET_MEM_NO + "\" class=\"reports_cancel\">";
					}
					html += "<td id=\"mNo\">" + d.REPORT_NO + "</td>";
					html += "<td>" + d.REASON_NAME + "</td>";
					html += "<td>" + d.CONTENTS + "</td>";
					html += "<td>" + d.REQUEST_NIC + "</td>";
					html += "<td>" + d.TARGET_NIC + "</td>";
					html += "<td>" + d.REPORT_DATE + "</td>";
					html += "<td>" + d.HANDLE_DATE + "</td>";
					html += "<td>" + d.STATUS_NO + "</td>";
					html += "<td><input type=\"button\" class=\"approval_btn\" id=\"approvalBtn\" value=\"승인\" readonly=\"readonly\"/><input type=\"button\" class=\"un_approval_btn\" id=\"unApprovalBtn\" value=\"미승인\" readonly=\"readonly\"/></td>";
					html += "</tr>";
				}
				
				$("#list_wrap tbody").html(html);
			}
			
			function drawPaging(pb) {
				var html = "";
				
				html += "<div class=\"paging_btn\" page=\"1\"><<</div>";
				
				if($("#page").val() == "1") {
					html += "<div class=\"paging_btn\" page=\"1\"><</div>";
				} else {
					html += "<div class=\"paging_btn\" page=\"" + ($("#page").val() - 1) + "\"><</div>";
				}
				
				for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
					if($("#page").val() == i) {
						html += "<div class=\"num on\" page=\"" + i + "\">" + i + "</div>";
					} else {
						html += "<div class=\"num\" page=\"" + i + "\">" + i + "</div>";
					}
				}
				
				if($("#page").val() == pb.maxPcount) {
					html += "<div class=\"paging_btn\" page=\"" + pb.maxPcount + "\">></div>";
				} else {
					html += "<div class=\"paging_btn\" page=\"" + ($("#page").val() * 1 + 1) + "\">></div>";
				}
				
				html += "<div class=\"paging_btn\" page=\"" + pb.maxPcount + "\">>></div>";
				
				$(".paging").html(html);
			}
			
			function resetVal() {
				$("#page").val(1);
				$("#searchFilter").val("0");
				$("#searchTxt").val("");
			}
			
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
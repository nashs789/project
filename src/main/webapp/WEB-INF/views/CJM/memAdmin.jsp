<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원관리</title>
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
			
			.popupDel {
			   display: none; /* 클릭 시 inline-block */
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
			.bg { /* 클릭 시 inline-block */
				display: none;
				width: 100%;
				height: 100%;
				position: absolute;
				top: 0px;
				left: 0px;
				background-color: #000000;
				z-index: 400;
				opacity: 0.2;
				position: fixed;
			}
			.popupDel2 {
			   display: none; /* 클릭 시 inline-block */
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
			.popupDel2 .popup_entity_txt {
			   font-size: 12pt;
			   font-weight: bold;
			   text-align: center;
			   line-height: 50px;
			   width: 265px;
			   height:40px;
			   margin: 30px auto 30px auto;
			}
			.popupDel2 .btn_list span{
			   text-decoration: none;
			   display:inline-block;
			   text-align:center;
			   width: 270px;
			   height:30px;
			   padding: 10px 15px 10px 15px;
			   font-size: 12pt;
			   color: #f37321;
			   font-weight: bold;
			   line-height: 30px;
			   border-radius: 0 0 10px 10px;
			}
			.popupDel2 .btn_list span:hover {
			   background-color: #f37321;
			   color: white;
			   cursor: pointer;
			}
			.bg2 { /* 클릭 시 inline-block */
				display: none;
				width: 100%;
				height: 100%;
				position: absolute;
				top: 0px;
				left: 0px;
				background-color: #000000;
				z-index: 400;
				opacity: 0.2;
				position: fixed;
			}
			.bg_grade {
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
			.popup_grade {
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
			.popup_entity_grade {
				display: block;
				width: 100%;
				height: 110px;
				margin: 20px auto;	
			}
			.popup_opt_grade {
				display: block;
				width: 268px;
				height: 40px;	
				margin: 30px auto 30px auto;
				font-weight: bold;
			}
			.btn_list_grade span{
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
			.btn_list_grade span:first-child {
			   border-radius: 0 0 0 10px; 
			}
			.btn_list_grade span:last-child {
			   border-radius: 0 0 10px 0; 
			}
			.btn_list_grade span:hover {
			   background-color: #f37321;
			   color: white;
			   cursor: pointer;
			}
			
			#container {
				display: block;
				width: 1480px;
				margin: 0 auto;
				background-color: #f9f9f9;
			}
			
			
			.mem_admin_area {
				display: block;
				width: 1480px;
				margin: 0px auto;
				padding: 20px 0px 20px 0px;
			}
			.admin_menu {
				display: block;
				height: 50px;
				margin-left: 100px;
			}
			.admin_menu span {
				cursor: pointer;
				font-size: 15pt;
				font-weight: bold;
			}
			.admin_menu span:hover {
				color: #F37321;
			}
			.menu1 {
				color: #F37321;
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
			.mem_delete_btn {
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
			.mem_delete_btn:hover {
				background-color: #F1404B;
				color: #FFFFFF;
				border: 2px solid #F1404B;
			}
			
			
			table {
				border-collapse: collapse;
			}
			thead tr {
				color: #000000;
				height: 40px;
				border-top: 2px solid #2e3459;
				border-bottom: 1px solid #ccc;
				text-align: center;
				background-color: #FFFFFF;
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
				cursor: pointer;
			}
			tbody tr:hover {
				background-color: #FFFFFF;
			}
			tbody tr td {
				font-size: 9pt;
				font-weight: 300;
				text-align: center;
			}
			.article {
				font-size: 13pt;
			}
			.ckbox {
			 	height: 15px;
			 	width: 15px;
			}
			.grade_btn {
				width: 70px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				font-size: 10pt;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.grade_btn1 {
				width: 70px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				font-size: 10pt;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
				
			}
			.grade_btn2 {
				width: 70px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				font-size: 10pt;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.grade_btn3 {
				width: 70px;
				height: 24px;
				background-color: #FFFFFF;
				color: #000000;
				font-weight: bold;
				font-size: 10pt;
				cursor: pointer;
				text-align: center;
				border-radius: 20px;
				border: 2px solid #2E3459;
			}
			.grade_btn:hover {
				background-color: #2E3459;
				color: #FFFFFF;
				border: 2px solid #2E3459;
			}
			.leave {
				background-color: #d9d9d9;
				pointer-events: none;
			}
			.not_leave {
				background-color: #f9f9f9;
			}
			.leave .grade_btn {
				background-color: #d9d9d9;
				border: 2px solid #2E3459;
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
	        
	        .apply0 {
	        	font-weight: bold;
	        }
	        .apply2 {
	        	font-weight: bold;
	        	color: blue;
	        }
	        .apply3 {
	        	font-weight: bold;
	        	color: red;
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
		
			function reloadList() {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url: "memAdmins",
					type: "post",
					dataType: "json",
					data: params,
					success: function(res) {
						//날자 가져오기
						$("#searchDate1").val(res.startDay);
						$("#searchDate2").val(res.today);
						
						//내부관리자-회원관리
						drawList(res.list);
						drawPaging(res.pb);
					},
					error: function(request, status, error) {
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});
			}
			
			function drawList(list) {
				var html = "";
				
				for(d of list) {
					if(d.LEAVE_DATE == "-") {
						html += "<tr mno=\"" + d.MEM_NO + "\" class=\"not_leave\">";
					} else {
						html += "<tr mno=\"" + d.MEM_NO + "\" class=\"leave\">";
					}				
					html += "<td><input type=\"checkbox\" class=\"ckbox\" name=\"ckJournalNo\" value=\"" + d.MEM_NO + "\"/></td>";
					html += "<td id=\"mNo\">" + d.MEM_NO + "</td>";
					html += "<td>" + d.ID + "</td>";
					html += "<td>" + d.NIC + "</td>";
					html += "<td>" + d.NAME + "</td>";
					html += "<td>" + d.SEX + "</td>";
					html += "<td>" + d.AGE + "</td>";
					html += "<td>" + d.EMAIL + "</td>";
					html += "<td>" + d.PHONE + "</td>";
					html += "<td>" + d.GRADE_NAME + "</td>";
					html += "<td>" + d.JOIN_DATE + "</td>";
					html += "<td>" + d.LEAVE_DATE + "</td>";
					html += "<td>" + d.POST_SUM + "</td>"; // 게시글수
					html += "<td>" + d.LIKE_SUM + "</td>"; // 좋아요수
					html += "<td>" + d.FOLLOW_SUM + "</td>"; // 팔로워수
					html += "<td>" + d.REPORT_CNT +"</td>"; // 누적신고수
					html += "<td>" + d.ACC_CNT + "</td>";
					if(d.APPLY == "등급하락") {
						html += "<td class=\"apply3\">" + d.APPLY + "</td>"; // 등업신청유무
					} else if(d.APPLY == "등업완료") {
						html += "<td class=\"apply2\">" + d.APPLY + "</td>"; // 등업신청유무
					} else if(d.APPLY == "등업대기") {
						html += "<td class=\"apply0\">" + d.APPLY + "</td>"; // 등업신청유무
					} else {
						html += "<td>" + d.APPLY + "</td>"; // 등업신청유무
					}
					html += "<td><input type=\"button\" id=\"gradeBtn\" class=\"grade_btn\" value=\"등급설정\" readonly=\"readonly\"/></td>";
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
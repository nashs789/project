<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판</title>
    <%--<link href="static/css/common.css" rel="stylesheet" type="text/css">--%>
    <link href="static/css/PJ400Css/PJ400C.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
    <script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
    <script type="text/javascript" src="static/js/callServer.js"></script>
    <script type="text/javascript" src="static/js/callPopup.js"></script>
    <script type="text/javascript" src="static/js/common.js"></script>
    <script type="text/javascript" src="static/js/PJ400Js/PJ400S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   loadPage2();

   var popupText ="";
   
   //로그인 상태 확인
   if("${sMEM_NO}" != "")
   {
      $(".logins").css("display", "none");
      $(".btns").css("display", "inline-block");
      //로그인 상태에 따라서 우측 상단 제어
      
      var path = ""; //사진경로 담아줄 변수
      
      if("${sPHOTO_PATH}" != "")
      {
         path = "resources/upload/" + "${sPHOTO_PATH}";
         
         $("#profilePhoto").attr("src", path);
      }
      else
      {
         path = "./resources/images/profile.png";

         $("#profilePhoto").attr("src", path);
      }//if ~ else end
      //프로필 사진이 DB에 있는경우 저장된 사진으로, 없는 경우 기본 사진으로
      
      if("${sGRADE_NO}" == "0")
      {
         $("#admin").show();
      }//등급에 따라서 내부 관리자 보이기
      
      var params = $("#memForm").serialize();
      var html = "";
                                                                                                      
      html +="   <div class=\"sub_profile\">";
      html +="      <div>";
      html +="         <img alt=\"profile\" src=\""+path+"\" class=\"profile_img\">";
      html +="      </div>";
      html +="      <div class=\"info\">";
      html +="         <span>${sNIC}</span>";
      html +="         <div class=\"grade\">";
      if("${sGRADE_NO}" == 0)
      {
         html +="            <img alt=\"icon\" src=\"./resources/images/grade.png\"> <span>관리자</span>";
      }
      else if("${sGRADE_NO}" == 1)
      {
         html +="            <img alt=\"icon\" src=\"./resources/images/grade.png\"> <span>여행꾼</span>";
      }
      else
      {
         html +="            <img alt=\"icon\" src=\"./resources/images/grade.png\"> <span>여행작가</span>";
      }
      html +="         </div>";
      html +="         <div class=\"cnt\">";
      $.ajax({
  		url: "checkPoints",
  		data: params,
  		dataType: "json",
  		type: "post",
  		success:function(result)
  		{
  			console.log(result);
  			if(result.msg == "success")
  			{
    		 	 html +="            <span>총 게시글 " + result.data.JOURNAL_CNT + "</span> <span>팔로워  " + result.data.FOLLOWER_CNT + "</span>";
    		 	 html +="         </div>";
    		     html +="      </div>";
    		     html +="   </div>";
    		     
    		      $(".top_area").prepend(html);
    		      $(".sub_profile").css("display", "block");
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
                                                                                              
      
		$.ajax({
			url: "notifications",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result)
			{
				if(result.msg == "success")
				{
					makeNotification(result.notification);
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
   }//if end -> 로그인 상태여부에 따른 처리
   
   $("#notification tbody").on("click", "span, tr, img", function(){
		if($(this).attr("class") == "notRead")
		{
			$("#NOTF_NO").val($(this).attr($(this).attr("class")));
	
		    var params = $("#notificationForm").serialize();
			
			$.ajax({
				url: "reads",
				data: params,
				dataType: "json",
				type: "post",
				success:function(result)
				{
				}, //success end
				error: function(request, status, error) {
					console.log(error);
				} // error end
			}); //ajax end  
		} //if end 알람 팝업에서 아이디, 글 제목, 프로필 사진 눌렸을 경우에 읽음표시
		
		if($(this).attr("class") == "user")
		{
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		}
		else if($(this).attr("class") == "journal")
		{
			$("#journalNo").val($(this).attr($(this).attr("class")));
			$("#goJournalForm").submit();
		}
		else if($(this).attr("class") == "post")
		{
			$("#postNo").val($(this).attr($(this).attr("class")));
			$("#postForm").submit();
		}//if ~ else end 클릭된 것에 따라서 해당 프로필 or 글로 이동
	}); //notification tbody span tr click end
   
   $("#loginBtn").on("click", function(){  //로그인 버튼 클릭
      if($.trim($("#inputID").val()) == "")
      {
         popupText = "아이디를 입력하세요.";
         commonPopup(popupText);
      }
      else if($.trim($("#inputPW").val()) == "")
      {
         popupText = "비밀번호를 입력하세요.";
         commonPopup(popupText);
      }
      else
      {
         var params = $("#loginForm").serialize();
         
         $.ajax({
            url: "logins",
            data: params,
            dataType: "json",
            type: "post",
            success:function(result)
            {
               if(result.msg == "failed")
               {
                  popupText = "ID와 PW가 일치하지 않습니다.";
                  commonPopup(popupText);
                  $("#inputID").val("");
                  $("#inputPW").val("");
               }
               else
               {
                  location.reload();
               }
            }, //success end
            error: function(request, status, error) {
               console.log(error);
            } // error end
         }); //ajax end 
      }// if ~ else end
   }); //loginBtn click end

   $("#inputPW, #inputID").on("keypress", function(){
      $(".popup").remove();
      $(".bg").remove();
      if(event.keyCode == 13)
         $("#loginBtn").click();
   });//inputPW, inputID 
   //keypress end 엔터시 로그인 버튼 클릭
   
   $("#write").on("click", function(){
	   if("${sMEM_NO}" == "")
	   {
		   popupText = "로그인이 필요한 서비스 입니다.";
			commonPopup(popupText);
		   return false;
	   }
      makePopup();
   });//write click end
   
   $("#profilePhoto").on("click", function(){
      $("#notification").css("display", "none");
      if($("#profileSlidedown").css("display") == "block")
      {
         $("#profileSlidedown").css("display", "none");
      }
      else
      {
         $("#profileSlidedown").css("display", "block");
      }
   }); //profilePhoto click end
   //프로필 사진 클릭 시 하위메뉴 나왔다 사라졌다 & 알람 팝업은 안보이도록
   
   	$("#notificationPhoto").on("click", function(){
		$("#profileSlidedown").css("display", "none");
		if($("#notification").css("display") == "block")
		{
			$("#notification").css("display", "none");
		}
		else
		{
			$("#notification").css("display", "inline-block");
		}
	}); //notificationPhoto click end
	//알람 아이콘 클릭 시 알람 팝업 나왔다 사라졌다 & 프로필 하위메뉴는 안보이도록
   
   $(".paging").on("click", "span", function() {
	   $("#page2").val($(this).attr("name"));
	   $("#startCnt").val(1 + (($("#page2").val()-1)) * 15);
	   $("#endCnt").val($("#page2").val()*15);
	   
	   if($(this).attr("id") == "goFirstPage")
		{
		   loadPage2();
		}
	   
      loadPage();
   }); //paging_wrap click end
   
   $(".search_icon").on("click", function(){   
      loadPage2();
      $("#page2").val(1);
   }); //search_icon click end
   
   $(".gallery").on("click", ".post2 span, strong, img", function(){
      if($(this).attr("class") == "journal" || $(this).attr("class") == "thumb")
      {
         $("#journalNo").val($(this).attr($(this).attr("class")));
         $("#goJournalForm").submit();
      }
      else if($(this).attr("class") == "user")
      {
         $("#userNo").val($(this).attr($(this).attr("class")));
         $("#userForm").submit();
      }
   });// gellery click end
   
   $(".left_nav ul li").on("click", "span", function(){

      if($(this).attr("class") == "all")
      {
         $("#gradeNo").val(0);
         $(".all img").css("background-color", "#f37321");
         $(".writer img").css("background-color", "#2e3459");
         $(".traveler img").css("background-color", "#2e3459");
      }
      else if($(this).attr("class") == "writer")
      {
         $("#gradeNo").val(2);
         $(".all img").css("background-color", "#2e3459");
         $(".writer img").css("background-color", "#f37321");
         $(".traveler img").css("background-color", "#2e3459");
      }
      else if($(this).attr("class") == "traveler")
      {
         $("#gradeNo").val(1);
         $(".all img").css("background-color", "#2e3459");
         $(".writer img").css("background-color", "#2e3459");
         $(".traveler img").css("background-color", "#f37321");
      }
      
      $("#page2").val(1);
      loadPage2();
   }); //left_nav click end
   
   $(".c_top").on("click", "li" ,function(){
      if($(this).attr("id") == "category_all")
      {
         $("#categoryNo").val(0);
         $("#category_all").css("background-color", "#2e3459");
         $("#category_all").css("color", "white");
         $(".c_top #regionSelect, #transportation, #attraction, #activity").css("background-color", "white");
         $(".c_top #regionSelect, #transportation, #attraction, #activity").css("color", "#2e3459");
         $("#activity ul, #attraction ul, #transportation ul, #regionSelect ul").css("display", "none");
         loadPage2();
      }
      else if($(this).attr("id") == "regionSelect")
      {
         $("#categoryNo").val(1);
         $("#regionSelect").css("background-color", "#2e3459");
         $("#regionSelect").css("color", "white");
         $(".c_top #category_all, #transportation, #attraction, #activity").css("background-color", "white");
         $(".c_top #category_all, #transportation, #attraction, #activity").css("color", "#2e3459");
         $("#regionSelect ul").css("display", "block");
         $("#activity ul, #attraction ul, #transportation ul").css("display", "none");
      }
      else if($(this).attr("id") == "transportation")
      {
         $("#categoryNo").val(2);
         $("#transportation").css("background-color", "#2e3459");
         $("#transportation").css("color", "white");
         $(".c_top #category_all, #regionSelect, #attraction, #activity").css("background-color", "white");
         $(".c_top #category_all, #regionSelect, #attraction, #activity").css("color", "#2e3459");
         $("#transportation ul").css("display", "block");
         $("#activity ul, #attraction ul, #regionSelect ul").css("display", "none");
      }
      else if($(this).attr("id") == "attraction")
      {
         $("#categoryNo").val(3);
         $("#attraction").css("background-color", "#2e3459");
         $("#attraction").css("color", "white");
         $(".c_top #category_all, #transportation, #regionSelect, #activity").css("background-color", "white");
         $(".c_top #category_all, #transportation, #regionSelect, #activity").css("color", "#2e3459");
         $("#attraction ul").css("display", "block");
         $("#activity ul, #transportation ul, #regionSelect ul").css("display", "none");
      }
      else if($(this).attr("id") == "activity")
      {
         $("#categoryNo").val(4);
         $("#activity").css("background-color", "#2e3459");
         $("#activity").css("color", "white");
         $(".c_top #category_all, #transportation, #attraction, #regionSelect").css("background-color", "white");
         $(".c_top #category_all, #transportation, #attraction, #regionSelect").css("color", "#2e3459");
         $("#activity ul").css("display", "block");
         $("#attraction ul, #transportation ul, #regionSelect ul").css("display", "none");
      }
   });//regionSelect
   
   $(".right_nav ul").on("click", ".img_none", function(){
      if($(this).attr("id") == "date0")
      {
         $("#date0").css("color", "#f37321");
         $("#hitt1, #like2").css("color", "#2e3459");
      }
      else if($(this).attr("id") == "hitt1")
      {
         $("#hitt1").css("color", "#f37321");
         $("#date0, #like2").css("color", "#2e3459");
      }
      else if($(this).attr("id") == "like2")
      {
         $("#like2").css("color", "#f37321");
         $("#date0, #hitt1").css("color", "#2e3459");
      }
      
      $("#SEQ").val($(this).attr("id").substring(4));
      $("#page2").val(1);
      loadPage2();
   });//right_nav click li end
   
   var preID = "#";
   
   $(".c_top li ul").on("click", "li", function(){
      $("#subCategoryNo").val($(this).attr("id").substring(1));
      $(preID).css("color", "black");
      preID = "#";
      $(this).css("color", "red");
      preID += $(this).attr("id");
      $("#page2").val(1);
      loadPage2();
   }); //c_top li ul click li end
   
   $("#community").on("click", function(){
   	location.href = "community";
   });//community click end
 
  	$("#travelWriter").on("click", function() {
 		location.href = "travelWriterRank";
 	}); //travelWriter click end
  	
	$("#clientCenter").on("click", function() {
 		location.href = "clientCenterQuestion";
 	}); //clientCenter click end
	
 	$("#admin").on("click", function() {
 		location.href = "memAdmin";
 	}); //admin click end
 	
 	$("#myPage").on("click", function(){
 		location.href = "myPage";
	}); //find click endmyPage
 	
 	$("#timeline").on("click", function(){
 		location.href = "timeline";
 	}); //timeline click end
 	
 	$("#editProfile").on("click", function(){
 		location.href = "editProfile";
 	}); //editProfile click end
 	
	$("#editInfo").on("click", function(){
		location.href = "editInfo";
 	}); //editInfo click end
 	
	$("#join").on("click", function(){  //회원가입 버튼 클릭
		location.href="terms";
	}); // join click end
	
	$("#find").on("click", function(){
		findBtnPopup();
	}); //find click end
	
	$("#notificationMore").on("click", function(){
		location.href="notification";
	}); //notificationMore click end
	
	$("#bookmarkPhoto").on("click", function(){
		location.href = "myPageBMK";
	}); //bookmarkPhoto click end
   
   $("#logoutBtn").on("click", function(){
      $.ajax({
         url: "logouts",
         type: "post",
         dataType: "json",
         success: function(result) {
            location.reload();
         }, //success end
         error: function(request, status, error) {
            console.log(error);
         } //error end
      }); //ajax end
     }); //logoutBtn click end
     
	// 메인검색창 넘어가는 부분
	$("#searchIcon").on("click", function() {
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
}); //document ready end
</script>
</head>
<form action="journalWrite" id="writeForm" method="post">
	<input type="hidden" id="inputJournalNo" name="inputJournalNo"/>
   <input type="hidden" id="startDate" name="startDate"/>
   <input type="hidden" id="endDate" name="endDate"/>
   <input type="hidden" id="regionNo" name="regionNo" value=17/>
</form>
<form action="journal" id="goJournalForm" method="post">
   <input type="hidden" id="journalNo" name="journalNo"/>
   <input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}"/>
</form>
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
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>
<body>
   <div id="wrap">
      <!-- header부분 고정 -->
      <div id="header">
         <div class="banner">
            <div class="top">
               <div class="logo_area">
                  <a href="main"><img alt="로고" src="./resources/images/logo.png" class="logo_photo"></a>
                  <div class="site_name">우리들의 여행일지</div>
               </div>
               <div class="btns">
                  <ul>
						<li><img alt="bell" src="./resources/images/bell.png" id="notificationPhoto">
							<div id="cnt"></div>
							<div id="notification">
								<table border="1">
									<colgroup>
										<col width="100px">
										<col width="350px">
										<col width="150px">
									</colgroup>
									<tbody>	

									</tbody>

									<tfoot>
										<tr>
											<th colspan="3" id="notificationMore">...더보기</th>
										</tr>
									</tfoot>
								</table>
							</div></li>
							<li><img alt="bookmark" src="./resources/images/bmk.png" id="bookmarkPhoto"></li>
							<li><img alt="프로필" src="" id="profilePhoto">
								<ul id="profileSlidedown">
									<li id="myPage">마이 페이지</li>
									<li id="timeline">타임라인</li>
									<li id="editProfile">프로필 수정</li>
									<li id="editInfo">회원정보 수정</li>
									<li id="logoutBtn">로그아웃</li>
								</ul>
							</li>
						</ul>
               </div>
               <div class="logins">
                     <div class="sub_login1">
                        <form action="#" id="loginForm">
                           <input type="button" id="loginBtn" value="로그인" />
                           <input type="password" id="inputPW" name="inputPW" placeholder="PW" />
                           <input type="text" id="inputID" name="inputID" placeholder="ID" />
                        </form>
                     </div>
                     <div class="sub_login2">
                        <span id="join">회원가입</span>
                        <span id="find">ID/PW 찾기</span>
                     </div>
                  </div>
            </div>
            <!-- 호버시 메뉴 생성 -->
         </div>
         <nav class="menu">
            <ul>
               <li id="journalBoard">여행게시판</li>
               <li id="community">자유게시판</li>
               <li id="travelWriter">여행작가</li>
               <li id="clientCenter">고객센터</li>
               <li id="admin">내부관리자</li>
            </ul>
         </nav>
         <form action="#" id="goSearch" method="post" >
			<img alt="search" src="./resources/images/search.png" class="search_icon" id="searchIcon"/>
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
      <div id="path_info">
         <span> <img alt="메인페이지" src="./resources/images/home.png" class="home_icon">
         </span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 여행게시판 </span>
      </div>
      <div class="sub_area">
         <span>여행게시판</span>
         <span>' POPJOURNEY ' 에서 함께 여행하세요.</span>
               <img src="./resources/images/board1.png">
            </div>
      <div id="container">
         <div class="top_area">
            <div class="category_nav">
               <ul class="c_top">
                  <li id="category_all">&nbsp;전체보기&nbsp;</li>
                  <li id="regionSelect">&nbsp;&nbsp;지역별&nbsp;&nbsp;
                     <ul id="c_bottom">
                        <li id="r0">서울</li>
                        <li id="r1">부산</li>
                        <li id="r2">대구</li>
                        <li id="r3">인천</li>
                        <li id="r4">광주</li>
                        <li id="r5">대전</li>
                        <li id="r6">울산</li>
                        <li id="r7">세종</li>
                        <li id="r8">경기도</li>
                        <li id="r9">강원도</li>
                        <li id="r10">충청북도</li>
                        <li id="r11">충청남도</li>
                        <li id="r12">전라북도</li>
                        <li id="r13">전라남도</li>
                        <li id="r14">경상북도</li>
                        <li id="r15">경상남도</li>
                        <li id="r16">제주도</li>
                     </ul></li>
                  <li id="transportation">&nbsp;&nbsp;교통편&nbsp;&nbsp;
                     <ul id="c_bottom">
                        <li id="t0">도보</li>
                        <li id="t1">자가용</li>
                        <li id="t2">버스</li>
                        <li id="t3">기차</li>
                        <li id="t4">배</li>
                        <li id="t5">자전거</li>
                     </ul></li>
                  <li id="attraction">&nbsp;&nbsp;관광지&nbsp;&nbsp;
                     <ul id="c_bottom">
                        <li id="a0">바다</li>
                        <li id="a1">계곡</li>
                        <li id="a2">산</li>
                        <li id="a3">유적지</li>
                        <li id="a4">박물관</li>
                        <li id="a5">테마파크</li>
                        <li id="a6">전망대</li>
                        <li id="a7">건축물</li>
                        <li id="a8">거리 광장</li>
                        <li id="a9">시장</li>

                     </ul></li>
                  <li id="activity">&nbsp;&nbsp;활&nbsp;동&nbsp;&nbsp;
                     <ul id="c_bottom">
                        <li id="b0">농장</li>
                        <li id="b1">공연</li>
                        <li id="b2">축제</li>
                        <li id="b3">마사지</li>
                        <li id="b4">온천</li>
                        <li id="b5">투어</li>
                        <li id="b6">야외활동</li>
                        <li id="b7">식도락</li>
                     </ul></li>
               </ul>
            </div>
         </div>
         <div class="board_list_wrap">
            <div class="board_menu">
               <nav class="left_nav">
                  <ul>
                     <li><span class="all"><img alt="작성자" src="./resources/images/all.png"></span><br />전체보기</li>
                     <li><span class="writer"><img alt="작성자" src="./resources/images/writer.png"></span><br />여행작가</li>
                     <li><span class="traveler"><img alt="작성자" src="./resources/images/user2.png"></span><br />여행꾼</li>
                  </ul>
               </nav>
               <nav class="right_nav">
                  <ul>
                     <li class="img_none" id="date0">최신순</li>
                     <li class="img_none" id="hitt1">조회순</li>
                     <li class="img_none" id="like2">좋아요순</li>
                     <li><img id="write" src="./resources/images/pen.png"><br />글쓰기</li>
                  </ul>
               </nav>
            </div>
            <div class="gallery">

            </div> <!-- gallery end -->
            <div class="paging_wrap">
               <div class="paging"></div>
               <div class="board_search">
                  <img alt="search" src="./resources/images/search.png" class="search_icon" /> 
                  <form action="#" id="journalForm">
                     <input type="hidden" id="cnt" name="cnt"/>
                     <input type="hidden" id="page2" name="page2" value="1"/>
                     <input type="hidden" id="startCnt" name="startCnt"/>
                     <input type="hidden" id="endCnt" name="endCnt"/>
                     <input type="hidden" id="maxCnt" name="maxCnt"/>
                     <input type="hidden" id="startPCnt" name="startPCnt"/>
                     <input type="hidden" id="endPCnt" name="endPCnt"/>
                     <input type="hidden" id="gradeNo" name="gradeNo" value="0"/>
                     <input type="hidden" id="categoryNo" name="categoryNo" value="0"/>
                     <input type="hidden" id="subCategoryNo" name="subCategoryNo" value="1"/>
                     <input type="hidden" id="SEQ" name="SEQ" value="0"/>
                     
                     <input type="text" class="search" id="searchTxt" name="searchTxt"  placeholder="검색" > 
                     <select   class="filter" id="searchGbn" name="searchGbn">
                        <option value="0">전체보기</option>
                        <option value="1">제목</option>
                        <option value="2">닉네임</option>
                     </select>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <div id="footer">
         <p>
            POPJOURNEY<br /> GDJ-35기 LEE Eun-Soo, LEE In-Bok, CHOI Jeong-Min<br />
            Copyright© POPJOURNEY. All Rights Reserved.
         </p>
      </div>
   </div>
</body>
</html>
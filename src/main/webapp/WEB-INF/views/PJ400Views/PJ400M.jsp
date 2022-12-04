<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판</title>
    <link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
    <link href="static/css/PJ400Css/PJ400C.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
    <script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
    <script type="text/javascript" src="static/js/common.js"></script>
    <script type="text/javascript" src="static/js/PJ400Js/PJ400S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   loadPage2();

   var popupText ="";
   
   //로그인 상태 확인
   if("{sMEM_NO}" != "")
   {
      var path = ""; //사진경로 담아줄 변수
      
      var params = $("#memForm").serialize();
      var html = "";
                                                                                                      
      html +="   <div class=\"sub_profile\">";
      html +="      <div>";
      html +="         <img alt=\"profile\" src=\""+path+"\" class=\"profile_img\">";
      html +="      </div>";
      html +="      <div class=\"info\">";
      html +="         <span>{sNIC}</span>";
      html +="         <div class=\"grade\">";

      if("{sGRADE_NO}" == 0) {
         html +="            <img alt=\"icon\" src=\"static/images/grade.png\"> <span>관리자</span>";
      } else if("{sGRADE_NO}" == 1) {
         html +="            <img alt=\"icon\" src=\"static/images/grade.png\"> <span>여행꾼</span>";
      } else {
         html +="            <img alt=\"icon\" src=\"static/images/grade.png\"> <span>여행작가</span>";
      }

      html +="         </div>";
      html +="         <div class=\"cnt\">";

      $.ajax({
  		url: "checkPoints",
  		data: params,
  		dataType: "json",
  		type: "post",
  		success:function(result) {
  			if(result.msg == "success") {
    		 	 html +="            <span>총 게시글 " + result.data.JOURNAL_CNT + "</span> <span>팔로워  " + result.data.FOLLOWER_CNT + "</span>";
    		 	 html +="         </div>";
    		     html +="      </div>";
    		     html +="   </div>";
    		     
    		      $(".top_area").prepend(html);
    		      $(".sub_profile").css("display", "block");
  			} else {
  				popupText = "오류가 발생했습니다.";
  				commonPopup(popupText);
  			}
  		}, //success end
  		error: function(request, status, error) {
  			console.log(error);
  		} // error end
  	}); //ajax end
   }//if end -> 로그인 상태여부에 따른 처리
   
   $("#write").on("click", function(){
	   if("{sMEM_NO}" == "") {
		   popupText = "로그인이 필요한 서비스 입니다.";
		   commonPopup(popupText);
		   return false;
	   }
      makePopup();
   });//write click end
   
   $(".paging").on("click", "span", function() {
	   $("#page2").val($(this).attr("name"));
	   $("#startCnt").val(1 + (($("#page2").val()-1)) * 15);
	   $("#endCnt").val($("#page2").val()*15);
	   
	   if($(this).attr("id") == "goFirstPage") {
		   loadPage2();
		}
	   
      loadPage();
   }); //paging_wrap click end
   
   $(".search_icon").on("click", function(){   
      loadPage2();
      $("#page2").val(1);
   }); //search_icon click end
   
   $(".gallery").on("click", ".post2 span, strong, img", function(){
      if($(this).attr("class") == "journal" || $(this).attr("class") == "thumb") {
         $("#journalNo").val($(this).attr($(this).attr("class")));
         $("#goJournalForm").submit();
      } else if($(this).attr("class") == "user") {
         $("#userNo").val($(this).attr($(this).attr("class")));
         $("#userForm").submit();
      }
   });// gellery click end
   
   $(".left_nav ul li").on("click", "span", function(){

      if($(this).attr("class") == "all") {
         $("#gradeNo").val(0);
         $(".all img").css("background-color", "#f37321");
         $(".writer img").css("background-color", "#2e3459");
         $(".traveler img").css("background-color", "#2e3459");
      } else if($(this).attr("class") == "writer") {
         $("#gradeNo").val(2);
         $(".all img").css("background-color", "#2e3459");
         $(".writer img").css("background-color", "#f37321");
         $(".traveler img").css("background-color", "#2e3459");
      } else if($(this).attr("class") == "traveler") {
         $("#gradeNo").val(1);
         $(".all img").css("background-color", "#2e3459");
         $(".writer img").css("background-color", "#2e3459");
         $(".traveler img").css("background-color", "#f37321");
      }
      
      $("#page2").val(1);
      loadPage2();
   }); //left_nav click end
   
   $(".c_top").on("click", "li" ,function(){
      if($(this).attr("id") == "category_all") {
         $("#categoryNo").val(0);
         $("#category_all").css("background-color", "#2e3459");
         $("#category_all").css("color", "white");
         $(".c_top #regionSelect, #transportation, #attraction, #activity").css("background-color", "white");
         $(".c_top #regionSelect, #transportation, #attraction, #activity").css("color", "#2e3459");
         $("#activity ul, #attraction ul, #transportation ul, #regionSelect ul").css("display", "none");
         loadPage2();
      } else if($(this).attr("id") == "regionSelect") {
         $("#categoryNo").val(1);
         $("#regionSelect").css("background-color", "#2e3459");
         $("#regionSelect").css("color", "white");
         $(".c_top #category_all, #transportation, #attraction, #activity").css("background-color", "white");
         $(".c_top #category_all, #transportation, #attraction, #activity").css("color", "#2e3459");
         $("#regionSelect ul").css("display", "block");
         $("#activity ul, #attraction ul, #transportation ul").css("display", "none");
      } else if($(this).attr("id") == "transportation") {
         $("#categoryNo").val(2);
         $("#transportation").css("background-color", "#2e3459");
         $("#transportation").css("color", "white");
         $(".c_top #category_all, #regionSelect, #attraction, #activity").css("background-color", "white");
         $(".c_top #category_all, #regionSelect, #attraction, #activity").css("color", "#2e3459");
         $("#transportation ul").css("display", "block");
         $("#activity ul, #attraction ul, #regionSelect ul").css("display", "none");
      } else if($(this).attr("id") == "attraction") {
         $("#categoryNo").val(3);
         $("#attraction").css("background-color", "#2e3459");
         $("#attraction").css("color", "white");
         $(".c_top #category_all, #transportation, #regionSelect, #activity").css("background-color", "white");
         $(".c_top #category_all, #transportation, #regionSelect, #activity").css("color", "#2e3459");
         $("#attraction ul").css("display", "block");
         $("#activity ul, #transportation ul, #regionSelect ul").css("display", "none");
      } else if($(this).attr("id") == "activity") {
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
      if($(this).attr("id") == "date0") {
         $("#date0").css("color", "#f37321");
         $("#hitt1, #like2").css("color", "#2e3459");
      } else if($(this).attr("id") == "hitt1") {
         $("#hitt1").css("color", "#f37321");
         $("#date0, #like2").css("color", "#2e3459");
      } else if($(this).attr("id") == "like2") {
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
   <input type="hidden" id="memNo" name="memNo" value="{sMEM_NO}"/>
</form>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="{sMEM_NO }"/>
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
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="{sMEM_NO}" />
</form>

<body>
   <div id="wrap">
      <jsp:include page="../Frame/header.jsp"></jsp:include>
      <div id="path_info">
         <span> <img alt="메인페이지" src="static/images/home.png" class="home_icon">
         </span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 여행게시판 </span>
      </div>
      <div class="sub_area">
         <span>여행게시판</span>
         <span>' POPJOURNEY ' 에서 함께 여행하세요.</span>
               <img src="static/images/board1.png">
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
                     <li><span class="all"><img alt="작성자" src="static/images/all.png"></span><br />전체보기</li>
                     <li><span class="writer"><img alt="작성자" src="static/images/writer.png"></span><br />여행작가</li>
                     <li><span class="traveler"><img alt="작성자" src="static/images/user2.png"></span><br />여행꾼</li>
                  </ul>
               </nav>
               <nav class="right_nav">
                  <ul>
                     <li class="img_none" id="date0">최신순</li>
                     <li class="img_none" id="hitt1">조회순</li>
                     <li class="img_none" id="like2">좋아요순</li>
                     <li><img id="write" src="static/images/pen.png"><br />글쓰기</li>
                  </ul>
               </nav>
            </div>
            <div class="gallery">

            </div> <!-- gallery end -->
            <div class="paging_wrap">
               <div class="paging"></div>
               <div class="board_search">
                  <img alt="search" src="static/images/search.png" class="search_icon" /> 
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
      <jsp:include page="../Frame/footer.jsp"></jsp:include>
   </div>
</body>
</html>
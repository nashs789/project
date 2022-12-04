<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ500Css/PJ505C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ500Js/PJ505S.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var path = "";
	var html = "";
	
	$.ajax({
		url: "checkPoints",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result) {
			if(result.msg == "success") {
				$("#point").val(result.data.TOTAL_POINT);
				
				var html = "";
				
				html += "<div>${sNIC}";
				if("${sGRADE_NO}" == "0") {
					html += "[관리자]";
				} else if("${sGRADE_NO}" == "1") {
					html += "[여행꾼]";
				} else {
					html += "[여행작가]";
				}
				
				html +="</div>";
				html += "<div id=\"intro\">${sINTRO}</div>";
				html += "<sapn id=\"point\">여행점수: " + result.data.TOTAL_POINT + "  <input type=\"button\" id=\"upgradeBtn\" value=\"작가 신청\"/></span>";
				
				$(".info").html(html);
				
				html = "";
				
				html += "<li><img alt=\"thumbnail\" id=\"myPageImg\" src=\"static/images/flag.png\"><br />여행일지</li>";
				html += "<li><img alt=\"map\" id=\"map\" src=\"static/images/map.png\"><br />&nbsp;&nbsp;" + result.data.JOURNAL_CNT + "</li>";
				
				$("#left_group").html(html);
				
				
				html = "";
				
				html += "<li><img alt=\"bookmark\" id=\"bookmark\" src=\"static/images/bmrk.png\"><br />북마크" + result.data.BMK_JOURNAL_CNT + "</li>";
				html += "<li><img alt=\"follower\" id=\"follower\" src=\"static/images/follower.png\"><br />팔로워" + result.data.FOLLOWER_CNT + "</li>";
				html += "<li><img alt=\"following\" id=\"following\" src=\"static/images/following.png\"><br />팔로잉" + result.data.FOLLOWING_CNT + "</li>";
						
				$(".right_group").html(html);
			}
			else {
				popupText = "오류가 발생했습니다.";
				commonPopup(popupText);
			}
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end 
	
	$(".info").on("click", "#upgradeBtn", function(){
		if("${sGRADE_NO}" == 2) {
			popupText = "이미 여행작가 입니다.";
			commonPopup(popupText);
			return false;
		}

		var params = $("#memForm").serialize();

		$.ajax({
			url: "upgrades",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result) {
				if(result.msg == "success") {
					popupText = "신청 완료.";
					commonPopup(popupText);
				} else if(result.msg == "notEnough") {
					popupText = "100점 이상되어야 합니다.";
					commonPopup(popupText);
				} else {
					popupText = "오류가 발생 했습니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //info upgradeBtn click end
	
	$("article").on("click",function(){
		$("#regionNo").val($(this).attr("id").substring(1));
		$("#detailForm").submit();
	}); //article click end
	
	$("#left_group").on("click", "#myPageImg", function(){
		location.href = "myPage";
	}); //myPageImg click end
	
	$(".right_group").on("click", "#bookmark", function(){
		location.href = "myPageBMK";
	});//bookmark click end
	
	$(".right_group").on("click", "#follower", function(){
		location.href = "myPageFollower";
	}); //follower click end
	
	$(".right_group").on("click", "#following", function(){
		location.href = "myPageFollowing";
	}); //following click end
});//document ready end
</script>
</head>

<form action="myPageMapDetail" id="detailForm" method="post">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value=${sMEM_NO }>
	<input type="hidden" id="regionNo" name="regionNo">
</form>
<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO}"/>
	<input type="hidden" id="page" name="page" value="1"/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	<input type="hidden" id="point" name="point"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO}"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>		
		<div class="sub_profile">
			<div class="info">
			</div>
		</div>
		<div id="container">
			<div class="board_list_wrap">
				<div class="board_menu">
					<nav class="menu_nav">
						<ul id="left_group">

						</ul>
						<ul class="right_group">

						</ul>
					</nav>
				</div>
				<div id="path_info">
					<span> <img alt="메인페이지" src="static/images/home.png" class="home_icon">
					</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> 마이페이지 </span>
					&nbsp;&nbsp;>&nbsp;&nbsp; <span> 여행일지 </span> &nbsp;>&nbsp;&nbsp;지도
				</div>
			</div>
			<div class="child-page-listing">
			  <h2>지역별 사진첩</h2>
			  <div class="grid-container">
			    <article id="r0" class="location-listing">
			      <a class="location-title">SEOUL(서울)</a>
			      <div class="location-image">
			        <a ><img src="static/images/seoul.jpg"></a>
			      </div>
			    </article>
			
			    <article id="r1" class="location-listing">
			      <a class="location-title" >BUSAN(부산)</a>
			      <div class="location-image">
			        <a ><img src="static/images/busan.jpg">  </a>
			      </div>
			    </article>
			
			    <article id="r2" class="location-listing">
			      <a class="location-title" >DAEGU(대구)</a>
			      <div class="location-image"> 
			             <a ><img  src="static/images/daegu.jpg">  </a>
			      </div>
			    </article>
			
			    <article id="r3" class="location-listing">
			      <a class="location-title" >INCHEON(인천)</a>
			      <div class="location-image">
			        <a ><img  src="static/images/incheon.jpg">  </a>
			      </div>
			    </article>
			
			    <article id="r4" class="location-listing">
			    	<a class="location-title" >GWANGJU(광주)</a>
			      <div class="location-image">
			        <a ><img src="static/images/gwangju.jpg"></a>
			      </div>
			    </article>
			
			    <article id="r5" class="location-listing">
			      <a class="location-title" >DAEJEON(대전)</a>
			      <div class="location-image">
			        <a ><img src="static/images/daejeon.jpg">          
			          </a>
			      </div>
			    </article>
			    <article id="r6" class="location-listing">
			
			      <a class="location-title" >ULSAN(울산)</a>
			      <div class="location-image">
			        <a ><img src="static/images/ulsan.jpg">    </a>
			      </div>
			    </article>
			
			    <article id="r7" class="location-listing">
			      <a class="location-title" >SEJONG(세종)</a>
			      <div class="location-image">
			        <a ><img src="static/images/sejong.jpg">  </a>
			      </div>
			    </article>
			
			    <article id="r8" class="location-listing">
			      <a class="location-title" >GYEONGGI-DO(경기도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/gyeonggi.jpg">  </a>
			      </div>
			    </article>
			    <article id="r9" class="location-listing">
			
			      <a class="location-title" >GANGWON-DO(강원도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/gangwon.jpg"> </a>
			      </div>
			    </article>
			
			    <article id="r10" class="location-listing">
			      <a class="location-title" >CHUNGBUK-DO(충청북도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/chungbuk.jpg"></a>
			      </div>
			    </article>
			
			    <article id="r11" class="location-listing">
			      <a class="location-title" >CHUNGNAM-DO(충청남도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/chungnam.jpg"></a>
			      </div>
			    </article>
			    
			    <article id="r12" class="location-listing">
			      <a class="location-title" >JEONBUK-DO(전라북도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/jeonbuk.jpg"></a>
			      </div>
			    </article>
			
			    <article id="r13" class="location-listing">
			      <a class="location-title" >JEONNAM-DO(전라남도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/jeonnam.jpg">  </a>
			      </div>
			    </article>
			
			    <article id="r14" class="location-listing">
			      <a class="location-title" >GYEONGSANGBUK-DO(경상북도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/gyeongsangbuk.jpg"></a>
			      </div>
			    </article>
			
			    <article id="r15" class="location-listing">
			      <a class="location-title" >GYEONGSANGNAM-DO(경상남도)</a>
			      <div class="location-image">
			        <a><img src="static/images/gyeongsangnam.jpg"></a>
			      </div>
			    </article>
			
			    <article id="r16" class="location-listing">
			      <a class="location-title" >JEJU-DO(제주도)</a>
			      <div class="location-image">
			        <a ><img src="static/images/jeju.jpg"></a>
			      </div>
			    </article>
			  </div>
			  <!-- end grid container -->
			</div>
		</div>
	</div>
	<jsp:include page="../Frame/footer.jsp"></jsp:include>
</body>
</html>
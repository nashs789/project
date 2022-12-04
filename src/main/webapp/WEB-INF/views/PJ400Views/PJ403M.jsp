<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일지작성</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ400Css/PJ403C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ400Js/PJ403S.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var index = 0;
	var photo = ["", "", "", "", ""];
	var memo = ["", "", "", "", ""];
	var contents = ["", "", "", "", ""];
	
	var popupText = ""; //공통 팝업에 들어가는 문구 담아줄 변수
	
	$(".date_nav ul li:first-child").attr("class");

	var params = $("#journalForm").serialize();
	
	$.ajax({
		url: "journalUpdateDetails",
		data: params,
		dataType: "json",
		type: "post",
		success:function(result) {
			$(".input_title").val(result.data.TITLE);
			
			var i = 0;
			
			for(plz of result.data2) {
				contents[i] = plz.CONTENTS;
				memo[i] = plz.MEMO;
				photo[i] = plz.PHOTO_PATH;
				i++;
			}
			
			$("#inputContents").val(contents[0]);
			var path = "resources/upload/"+photo[0];
			html = "<img src=\""+path+"\" id=\"photo\"/>";
			$("#photoArea").html(html);
			$(".input_memo").val(memo[0]);
			
			var hash = result.data.PATH.split(",");
			var hashtag ="";
			for(var i = 0; i < hash.length; i++) {
				hashtag += "#" + hash[i];
			}
			$(".hash_input").val(hashtag);
		}, //success end
		error: function(request, status, error) {
			console.log(error);
		} // error end
	}); //ajax end 
	
	$(".pref_filter").on("change", function(){
		var html = "";
		
		if($(".pref_filter").val() == 2) {
			html +=" 	<option value=\"0\">도보</option>";
			html +=" 	<option value=\"1\">자가용</option>";
			html +=" 	<option value=\"2\">버스</option>";
			html +=" 	<option value=\"3\">기차</option>"; 
			html +=" 	<option value=\"4\">배 </option>";
			html +=" 	<option value=\"5\">자전거</option>";
		}

		if($(".pref_filter").val() == 3) {
			html +=" 	<option value=\"0\">바다</option>";
			html +=" 	<option value=\"1\">계곡</option>";
			html +=" 	<option value=\"2\">산</option>";
			html +=" 	<option value=\"3\">유적지</option>"; 
			html +=" 	<option value=\"4\">박물관 </option>";
			html +=" 	<option value=\"5\">테마파크</option>";
			html +=" 	<option value=\"6\">전망대</option>";
			html +=" 	<option value=\"7\">건축물</option>";
			html +="	<option value=\"8\">거리광장</option>";
			html +=" 	<option value=\"9\">시장</option>"; 
		}

		if($(".pref_filter").val() == 4) {
			html +=" 	<option value=\"0\">농장</option>";
			html +=" 	<option value=\"1\">공연</option>";
			html +=" 	<option value=\"2\">축제</option>";
			html +=" 	<option value=\"3\">마사지</option>"; 
			html +=" 	<option value=\"4\">온천 </option>";
			html +=" 	<option value=\"5\">투어</option>";
			html +=" 	<option value=\"6\">야외활동</option>";
			html +=" 	<option value=\"7\">식도락</option>";
		} else {
			html +=" 	<option value=\"0\">카테고리</option>";
		}
		
		$(".category_filter").html(html);
	});//pref_filter change end
	
	var save = 0;
	
	$(".date_nav ul").on("click", "li", function(){
		
		save = 1;
		
		$(".date_nav ul li").css("background-color", "white");
		$(".date_nav ul li").css("color", "black");
		
		contents[index] = $("#inputContents").val();
		memo[index] = $(".input_memo").val();
		
		index = $(this).attr($(this).attr("class"));
		$("#inputContents").val(contents[index]);
		$(".input_memo").val(memo[index]);
		$("#fileName").html(photo[index].substring(20));
		
		if(photo[index] != "") {
			var html = "";
			var path = "resources/upload/"+ photo[index];
			html = "<img src=\""+path+"\" id=\"photo\"/>";
			$("#photoArea").html(html);
		} else {
			$("#photoArea").html("");
		}
		
		if($(this).attr($(this).attr("class")) == 0) {
			$(".date_nav ul li:first-child").css("background-color", "#2e3459");
			$(".date_nav ul li:first-child").css("color", "white");
		} else if($(this).attr($(this).attr("class")) == 1) {
			$(".date_nav ul li:nth-child(2)").css("background-color", "#2e3459");
			$(".date_nav ul li:nth-child(2)").css("color", "white");
		} else if($(this).attr($(this).attr("class")) == 2) {
			$(".date_nav ul li:nth-child(3)").css("background-color", "#2e3459");
			$(".date_nav ul li:nth-child(3)").css("color", "white");
		} else if($(this).attr($(this).attr("class")) == 3) {
			$(".date_nav ul li:nth-child(4)").css("background-color", "#2e3459");
			$(".date_nav ul li:nth-child(4)").css("color", "white");
		} else {
			$(".date_nav ul li:last-child").css("background-color", "#2e3459");
			$(".date_nav ul li:last-child").css("color", "white");
		}
	}); //date_nav ul click end
	
	$("#photoBtn").on("click", function(){
		$("#att").click();
	}); //photoBtn
	
	$("#att").on("change", function() {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
		
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
				success : function(res) {
				if(res.result == "SUCCESS") {
					// 올라간 파일명 저장
					if(res.fileName.length > 0)  {
						photo[index] = res.fileName[0];
						
						var path = "resources/upload/"+res.fileName[0];
						html = "<img src=\""+path+"\" id=\"photo\"/>";
						$("#photoArea").html(html);
					}
				} else {
					alert("파일 업로드중 문제 발생");
				}
			},
			error : function() {
				alert("파일 업로드중 문제 발생");
			}
		}); // ajaxForm end
		fileForm.submit();
	}); //att change end

	$(".enroll_btn").on("click", function(){
		$("#dateNav ul li:first-child").click();

		if($.trim($(".input_title").val()) == "") {
			alert("제목 비어있음");
			return false;
		} else if($(".pref_filter option:selected").val() == 0) {
			alert("선호도를 선택하세요.");
			return false;
		}
		
		if(save == 0) {
			contents[0] = $("#inputContents").val();
			memo[0] = $(".input_memo").val();
		}
		
		var c = "#contents";
		var m = "#memo";
		var p = "#photo";
		
		for(var i = 0; i < 5; i++) {
			c += i;
			m += i;
			p += i;
			
			$(c).val(contents[i]);
			$(m).val(memo[i]);
			$(p).val(photo[i]);
						
			c = "#contents";
			m = "#memo";
			p = "#photo";
		}
		
		if(contents[0] == "" || memo[0] == "" || photo[0] == "") {
			alert("Diary1을 채워주세요.");
			return false;
		}
		
		var params = $("#addJournalForm").serialize();
		
		$.ajax({
			url: "updateJournals",
			data: params,
			dataType:"json",
			type: "post",
			success:function(result)
			{
				location.href ="journalBoard";
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //enroll_btn click end
}); //document ready end

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
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
	<input type="hidden" id="journalNo" name="journalNo" value="${journalNo}"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" /> <!-- attach : 첨부 -->
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="path_info">
			<span> <a href="#"><img alt="메인페이지" src="./resources/images/home.png"
					class="home_icon"></a>
			</span> &nbsp;&nbsp;>&nbsp;&nbsp; <span> <a href="#">여행일지</a>
			</span> &nbsp;>&nbsp;&nbsp;일지 작성
		</div>
		<div id="container">
		<form action="journalBoard" id="addJournalForm" method="post">
			<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
			<input type="hidden" id="JOURNAL_NO" name="JOURNAL_NO" value="${journalNo}"/>
			
			<input type="hidden" id="contents0" name="contents"/>
			<input type="hidden" id="memo0" name="memo"/>
			<input type="hidden" id="photo0" name="photo"/>
			
			<input type="hidden" id="contents1" name="contents"/>
			<input type="hidden" id="memo1" name="memo"/>
			<input type="hidden" id="photo1" name="photo"/>
			
			<input type="hidden" id="contents2" name="contents"/>
			<input type="hidden" id="memo2" name="memo"/>
			<input type="hidden" id="photo2" name="photo"/>
			
			<input type="hidden" id="contents3" name="contents"/>
			<input type="hidden" id="memo3" name="memo"/>
			<input type="hidden" id="photo3" name="photo"/>
			
			<input type="hidden" id="contents4" name="contents"/>
			<input type="hidden" id="memo4" name="memo"/>
			<input type="hidden" id="photo4" name="photo"/>
			<div class="title_area">
				<div class="title_top">
					<strong class="title_font">1. 제목 입력</strong> <span>필수 입력 사항</span>
				</div>
				<div class="title_bottom">
					<input type="text" class="input_title" name="inputTitle" placeholder="여행일지 제목"
						size="50" maxlength="30" autofocus required />
				</div>
			</div>
			<div class="date_area">
				<div class="title_top">
					<strong class="title_font">2. 일정 추가</strong> <span>필수 입력 사항</span>
				</div>
				<div class="schedule">
					<nav class="date_nav">
							<ul>
								<li class="diary" diary="0">DIARY 1</li>
								<li class="diary" diary="1">DIARY 2</li>
								<li class="diary" diary="2">DIARY 3</li>
								<li class="diary" diary="3">DIARY 4</li>
								<li class="diary" diary="4">DIARY 5</li>
							</ul>
					</nav>
				</div>
				<div class="write_area">
					<span class="text_area"><textarea rows="50" cols="15" id="inputContents" class="text_area_style"></textarea></span>
				</div>
			</div>
			<div class="spot_area">
				<div class="title_top">
					<strong class="title_font">3. 메모 & 사진 추가</strong> <span>필수 입력 사항</span>
				</div>
				<div class="help">
					<span>일정 선택 후 수정, 삭제가 가능합니다.&#9;일정은 하나씩 선택하십시오</span>
				</div>
				<div class="schedule">
					<nav class="date_nav">
							<ul>
								<li class="diary" diary="0">DIARY 1</li>
								<li class="diary" diary="1">DIARY 2</li>
								<li class="diary" diary="2">DIARY 3</li>
								<li class="diary" diary="3">DIARY 4</li>
								<li class="diary" diary="4">DIARY 5</li>
							</ul>
					</nav>
				</div>
				<input type="text" class="input_memo" placeholder="메모"
						size="50" maxlength="10" autofocus required />
				<input type="button" value="사진 추가" id="photoBtn"/><span id="fileName"></span>
				<div id="photoArea">
				</div>
			</div>
			<div class="hash_area">
				<div class="title_top">
					<strong class="title_font">4. 등록</strong> <span>필수 입력 사항 </span><span
						class="asterisk">&#42;</span>
				</div>
				<div class="help">
					<span>선호도 선택 후 카테고리를 지정하십시오.&#9;해시태그는 선택 사항이며 '#키워드' 형태로
						입력하십시오.</span>
				</div>
				<div class="hash_box">
					<div class="category_area">
						<span class="asterisk">&#42;</span><span>카테고리</span> <select
							class="pref_filter" name="inputCategory">
							<option value="0">선호도</option>
							<option value="2">교통</option>
							<option value="3">관광</option>
							<option value="4">활동</option>
						</select> <select class="category_filter" name="inputSubCategory">
							<option value="0">카테고리</option>
						</select>
					</div>
					<div class="hash">
						<label>해시태그<input type="text" disabled="disabled" class="hash_input" name="inputHashtag" size="70" maxlength="70" placeholder="#해시태그1#해시태그2"></label>
					</div>
				</div>
				<div class="enroll_area">
					<input type="button" class="enroll_btn" value="등 록" /> <input type="button" class="cancel_btn" value="취 소" />
				</div>
			</div>
		   <input type="hidden" id="startDate" name="startDate" value="${startDate }"/>
		   <input type="hidden" id="endDate" name="endDate" value="${endDate }"/>
		   <input type="hidden" id="regionNo" name="regionNo" value="${regionNo }"/>
		</form>
		</div>
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div>
</body>
</html>
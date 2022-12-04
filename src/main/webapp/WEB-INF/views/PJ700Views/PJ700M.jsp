<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ700Css/PJ700C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ700Js/PJ700S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var path = ""; //사진경로 담아줄 변수
	var flag = 1;
	var params = $("#memForm").serialize();

	params = $("#memForm").serialize();
	
	$.ajax({
		url: "timelinePageCnts",
		data: params,
		dataType: "json",
		type: "post",
		success: function(result){
			if(result.msg == "success"){
				$("#pageCnt").val(result.pageCnt);

				var params = $("#memForm").serialize();
				
				$.ajax({
					url: "timelines",
					data: params,
					dataType: "json",
					type: "post",
					success: function(result){
						if(result.msg == "success"){
							$("#firstPage").val(result.firstPage);
							$("#lastPage").val(result.lastPage);
							makeTimeline(result.timeline);
						}
						//result.msg에 실패시 failed 에러시 error들어가 있음
					}, //success end
					error: function(error){
						console.log(error);
					} //error end
				}); // ajax end
			} // if end
			//result.msg에 실패시 failed 에러시 error들어가 있음
		}, //success end
		error: function(error){
			console.log(error);
		} //error end
	}); // ajax end
	
	$("#upIcon").on("click", function(){
		$("html").scrollTop(0);
	}); //upIcon click end
	
	$("#downIcon").on("click", function(){
		$("html").scrollTop($(document).height());
	}); //upIcon click end
	
	$(".timeline").on("click", "span, img", function(){
		if($(this).attr("class") == "journal") {
			$("#journalNo").val($(this).attr($(this).attr("class")));
			$("#journalForm").submit();
		} else if($(this).attr("class") == "nic") {
			$("#userNo").val($(this).attr($(this).attr("class")));
			$("#userForm").submit();
		} else if($(this).attr("class") == "post") {
			$("#postNo").val($(this).attr($(this).attr("class")));
			$("#postForm").submit();
		}
	}); //timeline span click end 
	
	$(".timeline").on("mouseover", ".nic", function(){
		var x = event.clientX;
	    var y = event.clientY; 
	    
		$("#memNo").val($(this).attr($(this).attr("class")));
		var params = $("#memNoForm").serialize();
		
		$.ajax({
			url:"miniProfiles",
			data: params,
			dataType: "json",
			type: "post",
			success: function(result){
				if(result.msg == "success") {
					makeProfilePopup(result.mini, x, y);
				} else {
					alert("정보가 없습니다");
				}
			}, //success end
			error: function(error){
				console.log(error);
			} //error end
		}); //ajax end
	}); //timeline nic mouseover end
	
	$(".timeline").on("mouseout", ".nic", function(){
		$(".popup").remove();
	}); //timeline nic mouseout end

	$(window).on("scroll", function(){
	    var $window = $(this);
	    var scroll = $window.scrollTop();
	    var wheigth = $window.height();
	    var dheight = $(document).height();
	   
        if(scroll + wheigth + 200 > dheight && flag == 1)  {
        	flag--;
        	var params = $("#memForm").serialize();
        	
        	$.ajax({
        		url: "timelines",
        		data: params,
        		dataType: "json",
        		type: "post",
        		success: function(result){
        			if(result.msg == "success") {
        				$("#firstPage").val(result.firstPage);
        				$("#lastPage").val(result.lastPage);
        				makeTimeline(result.timeline);
        				flag ++;
        			} else if(result.msg == "full") {
        				alert("마지막 입니다");
        			}
        			//result.msg에 실패시 failed 에러시 error들어가 있음
        		}, //success end
        		error: function(error){
        			console.log(error);
        		} //error end
        	}); // ajax end
        } //if end
	}); // window scroll end
});//document ready end
</script>
</head>

<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="firstPage" name="firstPage" value="1"/>
	<input type="hidden" id="lastPage" name="lastPage" value="10"/>
	<input type="hidden" id="pageCnt" name="pageCnt" value=""/>
	<input type="hidden" id="GBN" name="GBN" value="1"/>
	<input type="hidden" id="page" name="page" value="${page}"/>
</form>
<form action="#" id="memNoForm">
	<input type="hidden" id="memNo" name="memNo"/>
</form>
<form action="userPage" id="userForm" method="post">
	<input type="hidden" id="userNo" name="userNo" value=""/>
</form>
<form action="journal" id="journalForm" method="post">
	<input type="hidden" id="journalNo" name="journalNo" value=""/>
	<input type="hidden" id="memNo" name="memNo" value="${sMEM_NO }"/>
</form>
<form action="post" id="postForm" method="post">
	<input type="hidden" id="postNo" name="postNo" value=""/>
	<input type="hidden" id="newPostNo" name="newPostNo" value="1"/>
	<input type="hidden" id="loginUserNo" name="loginUserNo" value="${sMEM_NO}" />
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			<div class="space">[ T I M E L I N E ]</div>
			<div class="timeline">

			</div> <!-- timeline end -->
			<div class="space">[ E N D ]</div>
		</div> <!-- container end -->
		<img src="static/images/up.png" id="upIcon">
		<img src="static/images/down.png" id="downIcon">
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div> <!-- wrap end -->
</body>
</html>
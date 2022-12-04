<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="static/css/Common/common.css" rel="stylesheet" type="text/css">
	<link href="static/css/PJ700Css/PJ701C.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="static/script/jquery/jquery-1.12.4.min.js"/></script>
	<script type="text/javascript" src="static/script/jquery/jquery.form.js"/></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/PJ700Js/PJ701S.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var popupText = "";

	//로그인 상태 확인
	if("${sMEM_NO}" != "")
	{
		var params = $("#memForm").serialize();
		
		$.ajax({
			url: "pageCnts",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result)
			{
				if(result.msg == "success")
				{
					$("#pageCnt").val(result.pageCnt);
					$("#notificationMore").click();
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
	} //if end
	
  	$("#notificationMore").on("click", function(){
		
  		var params = $("#memForm").serialize();
		
		$.ajax({
			url: "notifications",
			data: params,
			dataType: "json",
			type: "post",
			success:function(result) {
				if(result.msg == "success") {
					$("#page").val(result.page);
					$("#firstPage").val(result.firstPage);
					makeNotificationTable(result.notification, result.page);
				} else if(result.msg == "failed") {
					popupText = "오류가 발생했습니다.";
					commonPopup(popupText);
				} else {
					popupText = "마지막 입니다.";
					commonPopup(popupText);
				}
			}, //success end
			error: function(request, status, error) {
				console.log(error);
			} // error end
		}); //ajax end 
	}); //notificationMore click end
}); // document ready end
</script>
</head>

<form action="#" id="memForm">
	<input type="hidden" id="MEM_NO" name="MEM_NO" value="${sMEM_NO }"/>
	<input type="hidden" id="page" name="page" value="${page}"/>
	<input type="hidden" id="firstPage" name="firstPage" value="${firstPage}"/>
	<input type="hidden" id="GBN" name="GBN" value="2"/>
	<input type="hidden" id="pageCnt" name="pageCnt"/>
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
<form action="#" id="notificationForm">
	<input type="hidden" id="NOTF_NO" name="NOTF_NO" value=""/>
</form>

<body>
	<div id="wrap">
		<jsp:include page="../Frame/header.jsp"></jsp:include>
		<div id="container">
			 	<div id="notificationWrap">
					<table>
						<colgroup>
							<col width="100px">
							<col width="350px">
							<col width="200px">
						</colgroup>
						<thead>
							<tr>
								<th>사진</th>
								<th>내용</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
						<tfoot>
							<tr>
								<th colspan="3" id="notificationMore">...더보기</th>
							</tr>
						</tfoot>
					</table>
			</div>	 
		</div> <!-- container end -->
		<jsp:include page="../Frame/footer.jsp"></jsp:include>
	</div> <!-- wrap end -->
</body>
</html>
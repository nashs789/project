function commonLogin(){
    $.ajax({
        url: "login",
        data: {
                "id": $("#inp_header_id").val()
              , "pw": $("#inp_header_pw").val()
              },
        dataType: "json",
        type: "post",
        success:function(result) {
            if(result.msg == "failed") {
                commonPopup("ID와 PW가 일치하지 않습니다.");
            } else {
                location.reload();
            }
        }, //success end
        error: function(request, status, error) {
            console.log(error);
        } // error end
    }); //ajax end
} // function commonLogin end

function commonLogout(){
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
}

function makeNotification(notification)
{
    var html = ""; //알림 표현용
    var readCnt = 0;
    var html1 = "";  //알림 개수 표현용

    for(noti of notification)
    {
        if(noti.READ == 1)
        {
            html += "<tr class=\"notRead\" notRead=\"" + noti.NOTF_NO + "\">";
            readCnt++;
        }
        else
        {
            html += "<tr class=\"read\" read=\"" + noti.NOTF_NO + "\">";
        }

        var path ="";

        if(noti.PHOTO_PATH != null)
        {
            path = "resources/upload/"+noti.PHOTO_PATH;
        }
        else
        {
            path = "./resources/images/profile.png";
        }

        switch(noti.EVENT_NO)
        {
            case 0:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th><span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST +"</span>님이 당신을 팔로우 하셨습니다.</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 1:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>[여행일지]<span class=\"journal\" journal=\"" + noti.JOURNAL_NO + "\">" + noti.JTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.JOURNAL_NO + "\">" + noti.JCONTENTS + "...</span> 댓글을 다셨습니다</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 2:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>[게시글]<span class=\"post\" post=\"" + noti.POST_NO + "\">" + noti.BTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.POST_NO + "\">" + noti.BCONTENTS + "...</span> 댓글을 다셨습니다</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 3:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>[여행일지]<span class=\"journal\" journal=\"" + noti.JCJOURNAL_NO + "\">" + noti.JCTITLE + "</span>에  <span class=\"user\" user=" + noti.NOTF_MEM_NO + ">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.JCJOURNAL_NO + "\">" + noti.JUP_CONTENTS + "...</span> 댓글을 다셨습니다</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 4:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>[게시글]<span class=\"post\" post=\"" + noti.BCPOST_NO + "\">" + noti.BCTITLE + "</span>에  <span class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.BCPOST_NO + "\">" + noti.BUP_CONTENTS + "...</span> 댓글을 다셨습니다</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 5:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.JCCMEM_NO + "\"></th>";
                html +=" 	<th>내 댓글<span class=\"journal\" journal=\"" + noti.CCJOURNAL_NO + "\">" + noti.UPJCONTENTS + "</span>에  <span class=\"user\" user=\"" + noti.JCCMEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"journal\" journal=\"" + noti.CCJOURNAL_NO + "\">" + noti.DOWNJCONTENTS + "...</span> 답글을 다셨습니다</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 6:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.BCCMEM_NO + "\"></th>";
                html +=" 	<th>내 댓글<span class=\"post\" post=\"" + noti.CCPOST_NO + "\">" + noti.UPBCONTENTS + "</span>에  <span class=\"user\" user=\"" + noti.BCCMEM_NO + "\">" + noti.REQUEST + "</span>님이 <span class=\"post\" post=\"" + noti.CCPOST_NO + "\">" + noti.DOWNBCONTENTS + "...</span> 댓글을 다셨습니다</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 7:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>관리자가 내가 올린 [문의사항]<span class=\"qna\" qna=\"" + noti.GBN_NO + "\">" + noti.QTITLE + "</span>에 답글을 남기셨습니다.</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 8:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>관리자가 내가 올린 [문의사항]<span class=\"qna\" qna=\"" + noti.GBN_NO + "\">" + noti.QTITLE + "</span>에 답글을 수정 하셨습니다.</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 9:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>내가 작성한 [여행일지]<span class=\"journal\" journal=\"" + noti.GBN_NO + "\">" + noti.LIKE_TITLE + "</span> 를 좋아요 누르셨습니다.</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            case 10:
                html +=" 	<th ><img alt=\"프로필\" src=\"" + path + "\" class=\"user\" user=\"" + noti.NOTF_MEM_NO + "\"></th>";
                html +=" 	<th>내가 작성한 [게시글]<span class=\"post\" post=\"" + noti.GBN_NO + "\">" + noti.LIKE_TITLE2 + "</span> 를 좋아요 누르셨습니다.</th>";
                html +=" 	<th>" + noti.NOTF_DATE +"[" + noti.msg + "]</th>";
                html +=" </tr>";
                break;
            default:
                console.log("여긴 뭐넣을까?");
        }
    }

    html1 = "<div id=\"notificationTxt\">" + readCnt + "<div>";

    $("#cnt").prepend(html1);
    $("#notification tbody").html(html);
} //makeNotification end

function makeNoticeBoard(noticeData)
{
    var html = "";

    html +=" <div id=\"noticeBoard\">";
    html +=" <div class=\"title\">[공지 사항]</div>";
    html +=" <table>";
    html +=" 	<colgroup>";
    html +=" 		<col width=\"50px\">";
    html +=" 		<col width=\"300px\">";
    html +=" 		<col width=\"80px\">";
    html +=" 		<col width=\"70px\">";
    html +=" 		<col width=\"130px\">";
    html +=" 	</colgroup>";
    html +=" 	<thead>";
    html +=" 		<tr>";
    html +=" 			<th>번호</th>";
    html +=" 			<th>제목</th>";
    html +=" 			<th>작가</th>";
    html +=" 			<th>조회수</th>";
    html +=" 			<th>날짜</th>";
    html +=" 		</tr>";
    html +=" 	</thead>";

    for(var data of noticeData)
    {
        html +=" 	<tbody>";
        html +=" 		<tr>";
        html +=" 			<td>" + data.POST_NO + "</td>";
        html +=" 			<td class=\"post\" post=\"" + data.POST_NO + "\">" + data.TITLE + "</td>";
        html +=" 			<td>운영자</td>";
        html +=" 			<td>" + data.HIT + "</td>";
        html +=" 			<td>" + data.BOARD_DATE + "</td>";
        html +=" 		</tr>";
        html +=" 	</tbody>";
    }
    html +="	</table>";
    html +="</div><!-- noticeBoard end  -->";

    $("#noticeWrap").html(html);
}//makeNoticeBoard end
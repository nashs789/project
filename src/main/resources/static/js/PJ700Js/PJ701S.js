function makeNotificationTable(notification, page)
{
    var html = "";

    for(noti of notification)
    {
        if(noti.READ == 1)
        {
            html += "<tr class=\"notRead\" notRead=\"" + noti.NOTF_NO + "\">";
        }
        else
        {
            html += "<tr class=\"read\">";
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

    $("#notificationWrap tbody").append(html);
}
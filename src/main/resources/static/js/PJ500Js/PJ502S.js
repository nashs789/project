function makeFollower(myFollower)
{
    var html = "";

    for(data of myFollower)
    {
        html += "   	<div class=\"user_area\">";
        if(data.PHOTO_PATH != null)
        {
            html += "   		<span><img alt=\"profile\" src=\"resources/upload/" + data.PHOTO_PATH + "\"></span>";
        }
        else
        {
            html += "   		<span><img alt=\"profile\" src=\"./resources/images/profile.png\"></span>";
        }
        html += "   		<div class=\"user_info\">";
        html += "   			<span class=\"nic\">" + data.NIC + "</span> <span class=\"memo\">" + data.REQUEST_DATE+ "";
        if(data.CHA == 0)
        {
            html += "(오늘)</span><hr>";
        }
        else
        {
            html += "(" + data.CHA + "일)</span><hr>";
        }
        html += "   			<p>" + data.INTRO + "</p>";
        html += "   		</div>";
        html += "   		<div class=\"follow_btn_area\">";
        html += "   			<input type=\"button\" class=\"user\" user=\"" + data.REQUEST_MEM_NO + "\" value=\"여 행 일 지&nbsp;&nbsp;&nbsp;모 아 보 기 &nbsp;&nbsp;&nbsp;\"/>";
        html += "   		</div>";
        html += "   	</div>";
    }

    $(".follow_list").append(html);
}
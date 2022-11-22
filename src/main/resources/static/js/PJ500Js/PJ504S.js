function makeJournalList(detail)
{
    var html = "";

    for(data of detail)
    {
        html += "   <div class=\"post2\">";
        html += "		<input type = \"checkbox\" class=\"ck\" ck=\"" + data.JOURNAL_NO + "\"/>";
        html += "   <span class=\"thumb\" thumb=\"" + data.JOURNAL_NO + "\"><img alt=\"썸네일\" src=\"resources/upload/" + data.PHOTO_PATH + "\"></span>";
        html += "   	<div class=\"post_info\">";
        html += "   		<p>";
        html += "   			<span>" + data.CATEGORY + " > " + data.SUB_CATEGORY + "(" + data.REGION + ") </span>";
        html += "   		</p>";
        html += "   		<p>";
        html += "   			<strong class=\"journal\" journal=\"" + data.JOURNAL_NO + "\">" + data.TITLE + "</strong>";
        html += "   		</p>";
        html += "   		<p>";
        html += "   			<em>";
        if(data.PATH != null)
        {
            var hashTag = data.PATH;
            var arr =[];
            arr = hashTag.split(",");

            if(arr.length != 0)
            {
                for(var i = 0; i < arr.length; i++)
                {
                    html += "#" + arr[i]+ " ";
                }
            }
        }
        html += "</em>";
        html += "   		</p>";
        html += "   	</div>";
        html += "   	<div class=\"post_profile\">";
        html += "			<img alt=\"작성자\"";
        if(data.PROFILE == null)
        {
            html += " 			src=\"./resources/images/profile3.png\">";
        }
        else
        {
            html += " 			src=\"resources/upload/" + data.PROFILE + "\">";
        }
        html += " 			<span>" + data.NIC + "</span>";
        html += "   		<div>";
        html += "   			<div>";
        html += "   				<span>조회수</span> <span class=\"cnt\">" + data.HIT + "</span> <span>좋아요</sp";
        html += "   				<span class=\"cnt\">" + data.LIKE_CNT + "</span>";
        html += "   			</div>";
        html += "   			<span>" + data.JOURNAL_DATE + "</span>";
        html += "   		</div>";
        html += "   	</div>";
        html += "   </div>";
    }
    $(".gallery").html(html);
}
function makePage(pb)
{
    var html = "<span name=\"1\"><<</span>";

    if($("#page").val() == "1") {
        html += "<span name=\"1\"><</span>";
    } else {
        html += "<span name=\"" + ($("#page").val() - 1) + "\">&lt;</span>";
    }

    for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
        if($("#page").val() == i) {
            html += "<span class=\"on\" name=\"" + i + "\">" + i + "</span>";
        } else {
            html += "<span name=\"" + i + "\">" + i + "</span>";
        }
    }

    if($("#page").val() == pb.maxPcount) {
        html += "<span name=\"" + pb.maxPcount + "\">></span>";
    } else {
        html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">></span>";
    }

    html += "<span name=\"" + pb.maxPcount + "\">>></span>";

    $(".paging_wrap").html(html);
}
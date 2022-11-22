function loadPage()
{
    var params = $("#detailForm").serialize();

    $.ajax({
        url: "regionDetails",
        data: params,
        dataType: "json",
        type: "post",
        success: function(result){
            if(result.msg == "success")
            {
                makeGallery(result.regionList);
                makePage(result.pb);
            }
            else
            {
                popupText = "해당 지역 일지가 없습니다.";
                commonPopup(popupText);
            }
        },//success end
        error: function(error){
            console.log(error);
        }//error end
    }); //ajax end

    $("article").on("click",function(){
        $("#regionNo").val($(this).attr("id").substring(1));
    }); //article click end
}
function makeGallery(regionList)
{
    var html = "";

    for(data of regionList)
    {
        html += "   <div class=\"post2\">";
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
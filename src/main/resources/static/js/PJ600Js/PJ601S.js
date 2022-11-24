function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "searchTravelDiarys",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            journalCnt(res.journalCnt);
            drawList(res.list);
            drawPaging(res.pb);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    }); // ajax end..
} // reloadList() end..

function journalCnt(journalCnt) {
    console.log(journalCnt);
    if(journalCnt > 0) {
        $(".paging").show();
    } else if(journalCnt == 0) {
        $(".paging").hide();
    }
    $("#journalCnt").html("");
    var html = "";
    html = journalCnt + "개의 여행게시판이 검색되었습니다.";
    $("#journalCnt").html(html);
}

function drawList(list) {
    $("#journalGallery").html("");
    var html = "";

    for(d of list) {
        html += "<div class=\"search_post\" journalNo=\"" + d.JOURNAL_NO + "\">";
        html += "	<span class=\"thumb\"><img alt=\"썸네일\"";
        html += "			src=\"./resources/upload/" + d.JOURNAL_PHOTO_PATH + "\"></span>";
        html += "	<div class=\"post_info\">";
        html += "		<p>";
        html += "			<span>" + d.CATEGORY_NAME + " > " + d.SUB_CATEGORY_NAME + "(" + d.REGION_NAME + ")</span>";
        html += "		</p>";
        html += "		<p>";
        html += "			<strong>" + d.TITLE + "</strong>";
        html += "		</p>";
        html += "		<p>";
        html += "			<em>" + d.HASH + "</em>";
        html += "		</p>";
        html += "	</div>";
        html += "	<div class=\"post_profile\">";
        if(d.MEM_PHOTO_PATH != null) {
            html += "		<img alt=\"작성자\" src=\"./resources/upload/" + d.MEM_PHOTO_PATH + "\"> <span>" + d.NIC + "</span>";
        } else {
            html += "		<img alt=\"작성자\" src=\"./resources/images/profile3.png\"> <span>" + d.NIC + "</span>";
        }
        html += "		<div>";
        html += "			<div>";
        html += "				<span>조회수</span> <span class=\"cnt\">" + d.HIT + "</span> <span>좋아요</span>";
        html += "				<span class=\"cnt\">" + d.JOURNAL_LIKE_CNT + "</span>";
        html += "			</div>";
        html += "			<span>" + d.JOURNAL_DATE + "</span>";
        html += "		</div>";
        html += "	</div>";
        html += "</div>";
    }

    $("#journalGallery").html(html);
}

function drawPaging(pb) {
    var html = "";

    html += "<div class=\"paging_btn\" Pages=\"1\"><<</div>";

    if($("#Pages").val() == "1") {
        html += "<div class=\"paging_btn\" Pages=\"1\"><</div>";
    } else {
        html += "<div class=\"paging_btn\" Pages=\"" + ($("#Pages").val() - 1) + "\"><</div>";
    }

    for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
        if($("#Pages").val() == i) {
            html += "<div class=\"num on\" Pages=\"" + i + "\">" + i + "</div>";
        } else {
            html += "<div class=\"num\" Pages=\"" + i + "\">" + i + "</div>";
        }
    }

    if($("#Pages").val() == pb.maxPcount) {
        html += "<div class=\"paging_btn\" Pages=\"" + pb.maxPcount + "\">></div>";
    } else {
        html += "<div class=\"paging_btn\" Pages=\"" + ($("#Pages").val() * 1 + 1) + "\">></div>";
    }

    html += "<div class=\"paging_btn\" Pages=\"" + pb.maxPcount + "\">>></div>";

    $(".paging").html(html);
}
function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "searchCommunitys",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            boardCnt(res.boardCnt);
            drawList(res.list);
            drawPaging(res.pb);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    }); // ajax end..
} // reloadList() end..

function boardCnt(boardCnt) {
    console.log(boardCnt);
    if(boardCnt > 0) {
        $(".paging").show();
    } else if(boardCnt == 0) {
        $(".paging").hide();
    }
    $("#boardCnt").html("");
    var html = "";
    html = boardCnt + "개의 자유게시판이 검색되었습니다.";
    $("#boardCnt").html(html);
}

function drawList(list) {
    $("#boardGallery").html("");
    var html = "";

    for(d of list) {
        html += "<tr class=\"board_data\" postNo=\"" + d.POST_NO + "\">";
        html += "<td>" + d.POST_NO + "</td>";
        if(d.CATEGORY_NO == 2) {
            html += "<td class=\"td_t\">" + d.CATEGORY_NAME + "</td>";
        } else if(d.CATEGORY_NO == 3) {
            html += "<td class=\"td_q\">" + d.CATEGORY_NAME + "</td>";
        } else if(d.CATEGORY_NO == 4){
            html += "<td class=\"td_c\">" + d.CATEGORY_NAME + "</td>";
        }
        html += "<td class=\"board_title\">" + d.TITLE + "</td>";
        html += "<td>" + d.GRADE_NAME + "</td>";
        html += "<td>" + d.NIC + "</td>";
        html += "<td>" + d.BOARD_DATE + "</td>";
        html += "<td>" + d.HIT + "</td>";
        html += "<td>" + d.POST_LIKE_CNT + "</td>";
        html += "</tr>";
    }

    $("#boardGallery").html(html);
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
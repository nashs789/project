function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "searchNics",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            nicCnt(res.nicCnt);
            drawList(res.list);
            drawPaging(res.pb);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    }); // ajax end..
} // reloadList() end..

function nicCnt(nicCnt) {
    console.log(nicCnt);
    if(nicCnt > 0) {
        $(".paging").show();
    } else if(nicCnt == 0) {
        $(".paging").hide();
    }
    $("#nicCnt").html("");
    var html = "";
    html = nicCnt + "개의 닉네임이 검색되었습니다.";
    $("#nicCnt").html(html);
}

function drawList(list) {
    $("#nicGallery").html("");
    var html = "";

    for(d of list) {
        html += "<tr memNo=\"" + d.MEM_NO + "\">";
        html += "	<td>" + d.NIC + "</td>";
        html += "	<td>" + d.GRADE_NAME + "</td>";
        html += "	<td>" + d.JOURNAL_CNT + "</td>";
        html += "	<td>" + d.LIKE_SUM + "</td>";
        html += "	<td>" + d.FOLLOW_CNT + "</td>";
        html += "</tr>";
    }

    $("#nicGallery").html(html);
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
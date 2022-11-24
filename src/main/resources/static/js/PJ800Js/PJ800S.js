function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "travelWriterRanks",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            drawList(res.list);
            drawPaging(res.pb);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
}

function drawList(list) {
    var html = "";

    for(d of list) {
        html += "<tr mno=\"" + d.MEM_NO + "\">";
        if(d.RNK == 1) {
            html += "<td><img alt=\"crown\" src=\"./resources/images/Crown.png\" class=\"rank_photo\"></td>";
        } else if(d.RNK == 2) {
            html += "<td><img alt=\"medalsilver\" src=\"./resources/images/medalsilver.png\" class=\"rank_photo\"></td>";
        } else if(d.RNK == 3) {
            html += "<td><img alt=\"medalbronze\" src=\"./resources/images/medalbronze.png\" class=\"rank_photo\"></td>";
        } else {
            html += "<td>" + d.RNK + "</td>";
        }
        html += "<td>" + d.NIC + "</td>";
        html += "<td>" + d.JOURNAL_CNT + "</td>";
        html += "<td>" + d.JOURNAL_LIKE_CNT +"</td>";
        html += "<td>" + d.FOLLOW_CNT +"</td>";
        html += "<td>" + d.SUM + "</td>";
        html += "</tr>";
    }

    $("#writerRank").html(html);
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
function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "noticeAdmins",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            //날자 가져오기
            $("#searchDate1").val(res.startDay);
            $("#searchDate2").val(res.today);

            //내부관리자-회원관리
            drawList(res.list);
            drawPaging(res.pb);
        },
        error: function(request, status, error) {
            console.log(request);
            console.log(status);
            console.log(error);
        }
    });
}

function drawList(list) {
    var html = "";

    for(d of list) {
        if(d.DEL == 1) {
            html += "<tr pno=\"" + d.POST_NO + "\" class=\"not_del\">";
        } else {
            html += "<tr pno=\"" + d.POST_NO + "\" class=\"del\">";
        }
        html += "<td><input type=\"checkbox\" class=\"ckbox\" name=\"ckPostNo\" value=\"" + d.POST_NO + "\"/></td>";
        html += "<td id=\"pNo\">" + d.POST_NO + "</td>";
        html += "<td>" + d.CATEGORY_NAME + "</td>";
        html += "<td class=\"notice_title\">" + d.TITLE + "</td>";
        html += "<td>" + d.GRADE_NAME + "</td>";
        html += "<td>" + d.NIC + "</td>";
        html += "<td>" + d.BOARD_DATE + "</td>";
        html += "<td>" + d.HIT + "</td>";
        html += "<td>" + d.LIKE_CNT + "</td>";
        html += "<td><input type=\"button\" class=\"edit_btn\" value=\"수정\" readonly=\"readonly\"/></td>";
        html += "</tr>";
    }

    $("#list_wrap tbody").html(html);
}

function drawPaging(pb) {
    var html = "";

    html += "<div class=\"paging_btn\" page=\"1\"><<</div>";

    if($("#page").val() == "1") {
        html += "<div class=\"paging_btn\" page=\"1\"><</div>";
    } else {
        html += "<div class=\"paging_btn\" page=\"" + ($("#page").val() - 1) + "\"><</div>";
    }

    for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
        if($("#page").val() == i) {
            html += "<div class=\"num on\" page=\"" + i + "\">" + i + "</div>";
        } else {
            html += "<div class=\"num\" page=\"" + i + "\">" + i + "</div>";
        }
    }

    if($("#page").val() == pb.maxPcount) {
        html += "<div class=\"paging_btn\" page=\"" + pb.maxPcount + "\">></div>";
    } else {
        html += "<div class=\"paging_btn\" page=\"" + ($("#page").val() * 1 + 1) + "\">></div>";
    }

    html += "<div class=\"paging_btn\" page=\"" + pb.maxPcount + "\">>></div>";

    $(".paging").html(html);

}

function resetVal() {
    $("#page").val(1);
    $("#searchFilter").val("0");
    $("#searchTxt").val("");
}
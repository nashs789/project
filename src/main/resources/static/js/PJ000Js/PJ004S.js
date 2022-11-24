function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "reportAdmins",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            //날짜 가져오기
            $("#searchDate1").val(res.startDay);
            $("#searchDate2").val(res.today);

            //내부관리자-게시판관리
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
        if(d.STATUS_NO == "신고대기") {
            html += "<tr pno=\"" + d.REPORT_NO + "\" tno=\"" + d.TARGET_MEM_NO + "\" class=\"reports\">";
        } else if(d.STATUS_NO == "승인") {
            html += "<tr pno=\"" + d.REPORT_NO + "\" tno=\"" + d.TARGET_MEM_NO + "\" class=\"reports_ok\">";
        } else {
            html += "<tr pno=\"" + d.REPORT_NO + "\" tno=\"" + d.TARGET_MEM_NO + "\" class=\"reports_cancel\">";
        }
        html += "<td id=\"mNo\">" + d.REPORT_NO + "</td>";
        html += "<td>" + d.REASON_NAME + "</td>";
        html += "<td>" + d.CONTENTS + "</td>";
        html += "<td>" + d.REQUEST_NIC + "</td>";
        html += "<td>" + d.TARGET_NIC + "</td>";
        html += "<td>" + d.REPORT_DATE + "</td>";
        html += "<td>" + d.HANDLE_DATE + "</td>";
        html += "<td>" + d.STATUS_NO + "</td>";
        html += "<td><input type=\"button\" class=\"approval_btn\" id=\"approvalBtn\" value=\"승인\" readonly=\"readonly\"/><input type=\"button\" class=\"un_approval_btn\" id=\"unApprovalBtn\" value=\"미승인\" readonly=\"readonly\"/></td>";
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
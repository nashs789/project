function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "memAdmins",
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
        if(d.LEAVE_DATE == "-") {
            html += "<tr mno=\"" + d.MEM_NO + "\" class=\"not_leave\">";
        } else {
            html += "<tr mno=\"" + d.MEM_NO + "\" class=\"leave\">";
        }
        html += "<td><input type=\"checkbox\" class=\"ckbox\" name=\"ckJournalNo\" value=\"" + d.MEM_NO + "\"/></td>";
        html += "<td id=\"mNo\">" + d.MEM_NO + "</td>";
        html += "<td>" + d.ID + "</td>";
        html += "<td>" + d.NIC + "</td>";
        html += "<td>" + d.NAME + "</td>";
        html += "<td>" + d.SEX + "</td>";
        html += "<td>" + d.AGE + "</td>";
        html += "<td>" + d.EMAIL + "</td>";
        html += "<td>" + d.PHONE + "</td>";
        html += "<td>" + d.GRADE_NAME + "</td>";
        html += "<td>" + d.JOIN_DATE + "</td>";
        html += "<td>" + d.LEAVE_DATE + "</td>";
        html += "<td>" + d.POST_SUM + "</td>"; // 게시글수
        html += "<td>" + d.LIKE_SUM + "</td>"; // 좋아요수
        html += "<td>" + d.FOLLOW_SUM + "</td>"; // 팔로워수
        html += "<td>" + d.REPORT_CNT +"</td>"; // 누적신고수
        html += "<td>" + d.ACC_CNT + "</td>";
        if(d.APPLY == "등급하락") {
            html += "<td class=\"apply3\">" + d.APPLY + "</td>"; // 등업신청유무
        } else if(d.APPLY == "등업완료") {
            html += "<td class=\"apply2\">" + d.APPLY + "</td>"; // 등업신청유무
        } else if(d.APPLY == "등업대기") {
            html += "<td class=\"apply0\">" + d.APPLY + "</td>"; // 등업신청유무
        } else {
            html += "<td>" + d.APPLY + "</td>"; // 등업신청유무
        }
        html += "<td><input type=\"button\" id=\"gradeBtn\" class=\"grade_btn\" value=\"등급설정\" readonly=\"readonly\"/></td>";
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
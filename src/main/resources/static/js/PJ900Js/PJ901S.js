function makePopup(title, func) {

    var html = "";

    html += "<div class=\"popup_write\">"
    html += "	<div class=\"popup_entity_txt\">" + title + "</div>"
    html += "    <div class=\"btn_list\">"
    html += "    	<span id=\"ok\">OK</span>"
    html += "    </div>"
    html += "</div>"
    html += "<div class=\"bg_write\"></div>"

    $("body").prepend(html);

    $(".bg_write").hide();
    $(".popup_write").hide();
    $(".bg_write").fadeIn();
    $(".popup_write").fadeIn();

    $(".popup_write #ok").off("click");
    $(".popup_write #ok").on("click", function() {
        if(func != null) {
            func.call();
        }
        closePopup();
    });
}

function closePopup() {
    $(".bg_write").fadeOut(function() {
        $(".bg_write").remove();
    });
    $(".popup_write").fadeOut(function() {
        $(".popup_write").remove();
    });
}

function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "clientCenterMatters",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
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
        html += "<tr qno=\"" + d.QNA_NO + "\">";
        html += "<td id=\"qNo\">" + d.QNA_NO + "</td>";
        html += "<td>" + d.NIC + "</td>";
        html += "<td class=\"matter_title\">" + d.TITLE + "</td>";
        html += "<td>" + d.QNA_DATE + "</td>";
        if(d.CMT_OK == '답변대기') {
            html += "<td>" + d.CMT_OK + "</td>";
        } else {
            html += "<td class=\"cmt_ok\">" + d.CMT_OK + "</td>";
        }
        html += "<input type=\"hidden\" class=\"writeMemNo\" name=\"writeMemNo\" value=" + d.MEM_NO + " />"
        html += "</tr>";
    }

    $("#list_wrap tbody").html(html);
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

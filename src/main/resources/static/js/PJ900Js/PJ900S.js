function reloadCnt() {
    var params = $("#actionForm").serialize();
    console.log(params);
    console.log("reloadCnt");
    $.ajax({

        url: "clientCenterFAQCnt",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            if(res.msg == "success") {
                $("#FAQCnt").val(res.FAQCnt);
                $("#firstCnt").val(res.firstCnt);
                $("#lastCnt").val(res.lastCnt);
                $("#addCnt").val(res.addCnt);
                reloadList();
            } else {
                txt = "오류가 발생했습니다.";
                commonPopup(txt);
            }
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
}

function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "clientCenterFAQList",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            $("#firstCnt").val(res.firstCnt);
            $("#lastCnt").val(res.lastCnt);
            drawFAQList(res.list);
            if($("#FAQCnt").val() < 11 || $("#FAQCnt").val() < $("#firstCnt").val()) {
                $(".more").hide();
                $(".qna_list").css("margin-bottom", "50px");
            }
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
}

function drawFAQList(list) {
    var html = "";
    console.log(list);
    for(d of list) {
        html += "<li class=\"qna_data\">"
        html += "<div class=\"question\">"
        html += "<span class=\"qna\">Q</span>"
        html += "<span class=\"entity\">[" + d.FAQ_EVENT_NAME + "] " + d.QUESTION + "</span>"
        html += "<img alt=\"답변\" src=\"./resources/images/under.png\">"
        html += "</div>"
        html += "<div class=\"answer\">"
        html += "<span class=\"qna\">A</span>"
        html += "<span class=\"entity\">" + d.ANSWER + "</span>"
        html += "</div>"
        html += "</li>"
    }

    $(".qna_list").append(html);
}
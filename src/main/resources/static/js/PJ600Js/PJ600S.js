function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "searchs",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            if(res.msg = "Filter0") {
                drawList1(res.journalList);
                drawList2(res.hashList);
                drawList3(res.boardList);
                drawList4(res.nicList);

                journalCnt(res.journalCnt);
                hashCnt(res.hashCnt);
                boardCnt(res.boardCnt);
                nicCnt(res.nicCnt);

                $("#hashTxt").html("");
                $("#hashMore").html("");
                $("#hashTxt").html("#" + res.txt);
                $("#hashMore").html("#" + res.txt + " 더보기");
            } else if(res.msg == "Filter1") {

            } else if(res.msg == "Filter2") {

            } else if(res.msg == "Filter3") {

            } else if(res.msg == "Filter4") {

            } else if(res.msg == "failed") {
                alert("검색에 실패했습니다.");
            } else {
                alert("검색중 문제가 발생하였습니다.");
            }
        },
        error: function(request, status, error) {
            console.log(error);
        }
    }); // ajax end..
} // reloadList() end..

function journalCnt(journalCnt) {
    $("#journalCnt").html("");
    var html = "";
    html = journalCnt + "개의 여행게시판이 검색되었습니다.";
    $("#journalCnt").html(html);

    $("#journalMore").html("");
    var htmlM = "";
    if(journalCnt > 10) {
        $("#journalMore").show();
        htmlM = "<div class=\"more_entity\" id=\"journalMore\">여행게시판 더보기</div>";
    } else {
        $("#journalMore").hide();
    }
    $("#journalMore").html(htmlM);
}

function drawList1(journalList) {

    $("#journalGallery").html("");
    var html = "";

    for(d of journalList) {
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
        html += "		<img alt=\"작성자\" src=\"./resources/upload/" + d.MEM_PHOTO_PATH + "\"> <span>" + d.NIC + "</span>";
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

} //  function drawList(journalList) end..

function hashCnt(hashCnt) {
    $("#hashCnt").html("");
    var html = "";
    html = hashCnt + "개의 여행게시판이 검색되었습니다.";
    $("#hashCnt").html(html);

    $("#hashMore").html("");
    var htmlM = "";
    if(hashCnt > 10) {
        $("#hashMore").show();
        htmlM = "<div class=\"more_entity\" id=\"hashMore\">#" + ${mainSearchTxt} + "더보기</div>";
    } else {
        $("#hashMore").hide();
    }
    $("#hashMore").html(htmlM);
}

function drawList2(hashList) {

    $("#HashGallery").html("");
    var html = "";

    for(d of hashList) {
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
        html += "		<img alt=\"작성자\" src=\"./resources/upload/" + d.MEM_PHOTO_PATH + "\"> <span>" + d.NIC + "</span>";
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

    $("#HashGallery").html(html);

} // function drawList(hashList) end..

function boardCnt(boardCnt) {
    $("#boardCnt").html("");
    var html = "";
    html = boardCnt + "개의 자유게시글이 검색되었습니다.";
    $("#boardCnt").html(html);

    $("#boardMore").html("");
    if(boardCnt > 10) {
        var htmlM = "";
        $(".board_list_off").attr("class", "board_list");
        $("#boardMore").show();
        htmlM = "<div class=\"more_entity\" id=\"boardMore\">자유게시판 더보기</div>";
        $("#boardMore").html(htmlM);
    } else if(0 < boardCnt <= 10) {
        $(".board_list_off").attr("class", "board_list");
        $("#boardMore").hide();
    } else if(boardCnt == 0) {
        $(".board_list").attr("class", "board_list_off");
        $("#boardMore").hide();
    }

}

function drawList3(boardList) {
    $("#boardGallery").html("");
    var html = "";

    for(d of boardList) {
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

} // function drawList(boardList) end..

function nicCnt(nicCnt) {
    $("#nicCnt").html("");
    var html = "";
    html = nicCnt + "개의 닉네임이 검색되었습니다.";
    $("#nicCnt").html(html);

    $("#nicMore").html("");
    if(nicCnt > 10) {
        var htmlM = "";
        $(".search_nic_off").attr("class", "search_nic");
        $(".search_nic").show();
        $("#nicMore").show();
        htmlM = "<div class=\"more_entity\" id=\"nicMore\">닉네임 더보기</div>";
        $("#nicMore").html(htmlM);
    } else if(0 < nicCnt <= 10) {
        $(".search_nic_off").attr("class", "search_nic");
        $(".search_nic").show();
        $("#nicMore").hide();
    } else if(nicCnt == 0) {
        $(".search_nic").attr("class", "search_nic_off");
        $("#nicMore").hide();
    }

}

function drawList4(nicList) {
    $("#nicGallery").html("");
    var html = "";

    for(d of nicList) {
        html += "<tr class=\"nic\" memNo=\"" + d.MEM_NO + "\">";
        html += "	<td>" + d.MEM_NO + "</td>";
        html += "	<td>" + d.GRADE_NAME + "</td>";
        html += "	<td>" + d.JOURNAL_CNT + "</td>";
        html += "	<td>" + d.LIKE_SUM + "</td>";
        html += "	<td>" + d.FOLLOW_CNT + "</td>";
        html += "</tr>";
    }

    $("#nicGallery").html(html);

} // function drawList(nicList) end..
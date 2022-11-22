function reloadList() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "journalCmts",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            drawCmt(res.cmt);
            drawPaging(res.pb);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    }); // ajax end..
} // reloadList() end..

function drawCmt(cmt) {

    var html = "";

    for(i = 0 ; i < cmt.length ; i++) {

        if(cmt[i].PARENTS_CMT_NO == null) {

            html += "<div class=\"cmt_content_list\" cmtno=\"" + cmt[i].JOURNAL_CMT_NO + "\">";
            html += "<div class=\"cmt_contents\" cmtmemno=\"" + cmt[i].MEM_NO + "\" >";
            html += "	<div class=\"cmt_contents_left\">";
            if(cmt[i].MEM_PHOTO_PATH != null) {
                html += "		<img alt=\"프로필\" src=\"./resources/upload/" + cmt[i].MEM_PHOTO_PATH + "\">";
            } else {
                html += "<img alt=\"프로필\" src=\"./resources/images/profile3.png\">";
            }
            html += "	</div>";
            html += "	<div class=\"cmt_contents_right\">";
            html += "		<strong>" + cmt[i].NIC + "</strong><span class=\"cmt_date\">" + cmt[i].CMT_DATE + "</span><br />";
            if(cmt[i].GRADE_NO == 2) {
                html += "	<span><img alt=\"등급\" src=\"./resources/images/grade.png\"> </span><span>" + cmt[i].GRADE_NAME + "</span>";
            } else {
                html += "	<span>" + cmt[i].GRADE_NAME + "</span>";
            }
            html += "		<div class=\"cmt_txt\">";
            html += "			<p>" + cmt[i].CMT_CONTENTS + "</p>";
            html += "		</div>";
            html += "		<div class=\"cmt_box\">";
            html += "			<span class=\"add_cmt_cmt\">답글</span>";
            if($("#memNo").val() == cmt[i].MEM_NO) {
                html += "			<span class=\"cmt_delete_btn\">삭제</span>";
            } else {
                html += "<span></span>";
            }
            html += "			<span class=\"report_btn\">신고</span>";
            if($("#memNo").val() == cmt[i].MEM_NO) {
                html += "			<span class=\"cmt_edit_btn\">수정</span>";
            } else {
                html += "<span></span>";
            }
            html += "		</div>";
            html += "	</div>";
            html += "</div>";
            html += "</div>";
            for(j = 0 ; j < cmt.length ; j++) {
                if(cmt[i].JOURNAL_CMT_NO == cmt[j].PARENTS_CMT_NO) {
                    html += "<div class=\"cmt_cmt_contents_list\" cmtcmtnos=\"" + cmt[j].JOURNAL_CMT_NO + "\">";
                    html += "<div class=\"cmt_cmt_contents\" cmtcmtno=\"" + cmt[j].JOURNAL_CMT_NO + "\" cmtcmtmemno=\"" + cmt[j].MEM_NO + "\">";
                    html += "	<div class=\"cmt_contents_left\">";
                    if(cmt[j].MEM_PHOTO_PATH != null) {
                        html += "		<img alt=\"프로필\" src=\"./resources/upload/" + cmt[j].MEM_PHOTO_PATH + "\">";
                    } else {
                        html += "<img alt=\"프로필\" src=\"./resources/images/profile3.png\">";
                    }
                    html += "	</div>";
                    html += "	<div class=\"cmt_contents_right\">";
                    html += "		<strong>" + cmt[j].NIC + "</strong><span class=\"cmt_cmt_date\">" + cmt[j].CMT_DATE + "</span><br />";
                    if(cmt[j].GRADE_NO == 2) {
                        html += "			<span><img alt=\"등급\" src=\"./resources/images/grade.png\"></span><span>" + cmt[j].GRADE_NAME + "</span>";
                    } else {
                        html += "			<span>" + cmt[j].GRADE_NAME + "</span>";
                    }
                    html += "		<div class=\"cmt_txt\">";
                    html += "			<p>" + cmt[j].CMT_CONTENTS + "</p>";
                    html += "		</div>";
                    html += "		<div class=\"cmt_box\">";
                    html += "           <span></span>";
                    if($("#memNo").val() == cmt[j].MEM_NO) {
                        html += "			<span class=\"cmt_cmt_delete_btn\">삭제</span>";
                    } else {
                        html += "<span></span>";
                    }
                    html += "			<span class=\"report_btn\">신고</span>";
                    if($("#memNo").val() == cmt[j].MEM_NO) {
                        html += "			<span class=\"cmt_cmt_edit_btn\">수정</span>";
                    }
                    else {
                        html += "<span></span>";
                    }
                    html += "		</div>";
                    html += "	</div>";
                    html += "</div>";
                    html += "</div>";
                }
            }
        }
    }

    $("#cmtList").html(html);

} // drawCmt(cmt) end..

function drawPaging(pb) {
    var html = "";

    html += "<div class=\"paging_btn\" pages=\"1\"><<</div>";

    if($("#pages").val() == "1") {
        html += "<div class=\"paging_btn\" pages=\"1\"><</div>";
    } else {
        html += "<div class=\"paging_btn\" pages=\"" + ($("#pages").val() - 1) + "\"><</div>";
    }

    for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
        if($("#pages").val() == i) {
            html += "<div class=\"num on\" pages=\"" + i + "\">" + i + "</div>";
        } else {
            html += "<div class=\"num\" pages=\"" + i + "\">" + i + "</div>";
        }
    }

    if($("#pages").val() == pb.maxPcount) {
        html += "<div class=\"paging_btn\" pages=\"" + pb.maxPcount + "\">></div>";
    } else {
        html += "<div class=\"paging_btn\" pages=\"" + ($("#pages").val() * 1 + 1) + "\">></div>";
    }

    html += "<div class=\"paging_btn\" pages=\"" + pb.maxPcount + "\">>></div>";

    $(".paging").html(html);

}

function reloadSequence() {

    var params = $("#actionForm").serialize();

    $.ajax({
        url: "journalgetSequences",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            drawSequence(res.sequence);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
}


function drawSequence(sequence) {
    $("#nextImg").html("");
    var html = "";
    html = "<img alt=\"사진\" src=\"./resources/upload/" + sequence[seq].JOURNAL_PHOTO_PATH + "\" class=\"img_on\">";
    $("#nextImg").html(html);

    $(".txt_area").html("");
    var html2 = "";
    html2 = "<p>" + sequence[seq].CONTENTS + "</p>";
    $(".txt_area").html(html2);

    $(".photo_cnt").html("");
    var html3 = "";
    html3 = photoCnt;
    $(".photo_cnt").html(html3);
}

//좋아요 첫화면 구성
function likeLoad() {
    if("${likeCheck.JOURNAL_NO}" !="") {//좋아요 o
        $("#likeImg").attr("like","1");
        $("#likeImg").css("background-color","#f37321");
        $(".likeText").css("color","#f37321");
        console.log("좋아요! 클릭");
    } else { //좋아요 x
        $("#likeImg").attr("like","0");
        $("#likeImg").css("background-color","#2e3459");
        $(".likeText").css("color","#2e3459");
        console.log("좋아요 xx");
    }
}
//좋아요 화면 재구성
function likeReload() {
    var img = document.getElementById("likeImg");
    var color = window.getComputedStyle(img).backgroundColor;

    if(color=="rgb(46, 52, 89)") {//남색 클릭: 좋아요 추가
        $("#likeImg").attr("like","1");
        $("#likeImg").css("background-color","#f37321");
        $(".likeText").css("color","#f37321");
        console.log("좋아요! 클릭");
    } else { //주황 클릭: 좋아요 취소
        $("#likeImg").attr("like","0");
        $("#likeImg").css("background-color","#2e3459");
        $(".likeText").css("color","#2e3459");
        console.log("좋아요 xx");
    }
}

function roadBmkFolder() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "journalBmkLists",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            drawBmkFolder(res.bmkList);
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
}

function drawBmkFolder(bmkList) {
    var html = "";

    html += "<div class=\"bmk_popup\">";
    html += "<div>";
    html += "<div class=\"popup_contents_txt\">";
    html += "<div>";
    html += "북마크 저장<span>필수 입력 사항 </span><span class=\"asterisk\">&#42;</span>";
    html += "</div>";
    html += "<div class=\"radio_title\">";
    html += "<span>폴더 선택</span> <span class=\"asterisk\">&#42;</span>";
    html += "</div>";
    html += "<div class=\"folder_radio\">";
    for(d of bmkList) {
        html += "<div class=\"folder_radio_box\" bmkno=\"" + d.BMK_NO + "\">";
        html += "<input type=\"radio\" id=\"folder_radio" + d.RNUM + "\" value=\"" + d.RNUM + "\" name=\"folder_img\"><br/>";
        html += "<label for=\"folder_radio" + d.RNUM + "\"><img src=\"./resources/images/backpack" + d.FOLDER_IMG + ".png\"></label>";
        html += "<div>" + d.FOLDER_NAME + "</div>";
        html += "</div>";
    }
    html += "</div>";
    html += "</div>";
    html += "<div class=\"btn_list\">";
    html += "<span id=\"yes\">확 인</span><span id=\"no\">취 소</span>";
    html += "</div>";
    html += "</div>";
    html += "</div>";
    html += "<div class=\"bmk_bg\"></div>"

    $("#wrap").append(html);

    $("#yes").on("click", function() {

        if(isNaN($(":radio[name='folder_img']:checked").val())) {
            alert("폴더를 선택해주세요.");
        } else {
            console.log("북마크 완료");
            var params = $("#actionForm").serialize();

            $.ajax({
                url: "journalBmkAdds",
                type: "post",
                dataType: "json",
                data: params,
                success: function(res) {
                    $(".bmk_popup").remove();
                    $(".bmk_bg").remove();
                    $("#bmkBtn").css("background-color", "rgb(243, 115, 33)");
                    $(".bmkText").css("color", "rgb(243, 115, 33)");
                    $("#bmkBtn").attr("bmkcheck","1");
                },
                error: function(request, status, error) {
                    console.log(error);
                }
            }); // ajax end..
        }

    });
}

function reportPopup() {
    var html = "";

    html += "<div class=\"popup\">";
    html += "<div class=\"popup_contents_txt\">";
    html += "	<div>";
    html += "		신고하기<span>필수 입력 사항 </span><span class= \"asterisk\">&#42;</span>";
    html += "	</div>";
    html += "	<div class=\"radio_title\">";
    html += "		<span>신고 사유</span> <span class= \"asterisk\">&#42;</span>";
    html += "		<p>여러 사유에 해당하는 경우, 대표적인 사유 1개를 선택하십시오.</p>";
    html += "	</div>";
    html += "	<div class=\"report_radio\">";
    html += "		<div class=\"report_radio_box\">";
    html += "			<input type=\"radio\" id=\"report_radio0\" value=\"0\"name=\"report_reason\"><label for=\"report_radio0\">욕설 </label>";
    html += "		</div>";
    html += "		<div class=\"report_radio_box\">";
    html += "			<input type=\"radio\" id=\"report_radio1\" value=\"1\" name=\"report_reason\"><label for=\"report_radio1\">비방</label>";
    html += "		</div>";
    html += "	    <div class=\"report_radio_box\">";
    html += "		    <input type=\"radio\" id=\"report_radio2\" value=\"2\" name=\"report_reason\"><label for=\"report_radio2\">정치적 발언</label>";
    html += "	    </div>";
    html += "	    <div class=\"report_radio_box\">";
    html += "		    <input type=\"radio\" id=\"report_radio3\" value=\"3\" name=\"report_reason\"><label for=\"report_radio3\">외설적 언어</label>";
    html += "	    </div>";
    html += "	    <div class=\"report_radio_box\">";
    html += "		    <input type=\"radio\" id=\"report_radio4\" value=\"4\" name=\"report_reason\"><label for=\"report_radio4\">기타</label>";
    html += "	    </div>";
    html += "	</div>";
    html += "	<div>";
    html += "		상세 내용 <span class= \"asterisk\">&#42;</span><br /> <textarea class=\"pop_memo\" name=\"inputContents\" rows=\"3\" cols=\"73\"  placeholder=\"자세하게 적어주십시오\" ></textarea>";
    html += "	</div>";
    html += "</div>";
    html += "	<span class=\"submit_btn\">확 인</span> <span class=\"close_btn\">취 소</span>";
    html += "</div>";
    html += "</div>";
    html += "<div class=\"bg\"></div>";


    $("#pop").html(html);

    $(".submit_btn").on("click", function(){
        if(isNaN($(":radio[name='report_reason']:checked").val()))
        {
            alert("신고 사유를 선택하세요.");
        }
        else if($.trim($(".pop_memo").val()) =="")
        {
            alert("내용을 입력하세요.");
        }
        else
        {
            var params = $("#reportForm").serialize();
            console.log(params);
            $.ajax({
                url: "reports",
                type: "post",
                dataType: "json",
                data: params,
                success: function(result) {
                    if(result.msg == "success")
                    {
                        $(".popup").remove();
                        $(".bg").remove();
                        alert("신고 되었습니다.");
                    }
                    else
                    {
                        alert("실패하였습니다");
                    }
                },
                error: function(request, status, error) {
                    console.log(error);
                }
            });
        }
    }); //.submit_btn click end

    $("#pop").on("click", ".close_btn", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //.close_btn click end
}//reportPopup end

function getBmkNo() {
    var params = $("#actionForm").serialize();

    $.ajax({
        url: "journalGetBmkNos",
        type: "post",
        dataType: "json",
        data: params,
        success: function(res) {
            if(res.msg == "nullx") {
                $("#bmkBtn").attr("bmkno", res.getBmkNo.BMK_NO);
                $("#bmkNo").val(res.getBmkNo.BMK_NO);

                $("#bmkBtn").attr("bmkcheck", 1);
                $("#bmkBtn").css("background-color", "rgb(243, 115, 33)");
                $(".bmkText").css("color", "rgb(243, 115, 33)");
            } else if(res.msg == "nullo") {
                $("#bmkBtn").attr("bmkcheck", 0);
                $("#bmkBtn").css("background-color", "");
                $(".bmkText").css("color", "");
            } else {
                console.log("에러발생");
            }
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
}
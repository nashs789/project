//좋아요 첫화면 구성
function likeLoad() {
    if("${likeCheck.POST_NO}" !="") {//좋아요 o
        $(".reaction").children("ul").children("li").children("img").attr("like","1");
        $(".reaction").children("ul").children("li").children("img").css("background-color","#f37321");
        $(".likeText").css("color","#f37321");
        console.log("좋아요! 클릭");
    } else { //좋아요 x
        $(".reaction").children("ul").children("li").children("img").attr("like","0");
        $(".reaction").children("ul").children("li").children("img").css("background-color","#2e3459");
        $(".likeText").css("color","#2e3459");
        console.log("좋아요 xx");
    }
}
//좋아요 화면 재구성
function likeReload() {
    var img = document.getElementById("likeImg");
    var color = window.getComputedStyle(img).backgroundColor;

    if(color=="rgb(46, 52, 89)") {//남색 클릭: 좋아요 추가
        $(".reaction").children("ul").children("li").children("img").attr("like","1");
        $(".reaction").children("ul").children("li").children("img").css("background-color","#f37321");
        $(".likeText").css("color","#f37321");
        console.log("좋아요! 클릭");
    } else { //주황 클릭: 좋아요 취소
        $(".reaction").children("ul").children("li").children("img").attr("like","0");
        $(".reaction").children("ul").children("li").children("img").css("background-color","#2e3459");
        $(".likeText").css("color","#2e3459");
        console.log("좋아요 xx");
    }
}
//조회수
function hitCnt() {
    $.ajax({
        url:"postHits",
        type: "post",
        dataType: "json",
        data : params,
        success: function(res){
            if(result.msg == "success")
            {
            }
        }, //success end
        error: function (request, status, error) {
            console.log(error);
        }//error end
    });//ajax end
}//likeStatus end

function resetVal() {
    $("#pages").val(1);
}


function popup() {
    var popup = document.getElementById("popup");
    var bg = document.getElementByClass("bg");

    console.log(popup.style.display);

    if(popup.style.display == "none") {
        popup.style.display = "";
        bg.style.display = "";
    } else {
        popup.style.display = "none";
        bg.style.display = "none";
    }
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
            popupText = "신고 사유를 선택하세요.";
            commonPopup(popupText);
        }
        else if($.trim($(".pop_memo").val()) =="")
        {
            popupText = "신고 내용을 입력하세요.";
            commonPopup(popupText);
        }
        else
        {
            var params = $("#reportForm").serialize();

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
                        popupText = "신고가 접수 되었습니다.";
                        commonPopup(popupText);
                    }
                    else
                    {
                        popupText = "오류가 발생 하였습니다.";
                        commonPopup(popupText);
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

function reloadList() {
    var params = $("#goForm").serialize();

    $.ajax({
        url: "postCmts",
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

            html += "<div class=\"cmt_content_list\" cmtno=\"" + cmt[i].POST_CMT_NO + "\">";
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
            if($("#loginUserNo").val() == cmt[i].MEM_NO) {
                html += "			<span class=\"cmt_delete_btn\">삭제</span>";
            } else {
                html += "<span></span>";
            }
            html += "			<span class=\"report_btn\">신고</span>";
            if($("#loginUserNo").val() == cmt[i].MEM_NO) {
                html += "			<span class=\"cmt_edit_btn\">수정</span>";
            } else {
                html += "<span></span>";
            }
            html += "		</div>";
            html += "	</div>";
            html += "</div>";
            html += "</div>";
            for(j = 0 ; j < cmt.length ; j++) {
                if(cmt[i].POST_CMT_NO == cmt[j].PARENTS_CMT_NO) {
                    html += "<div class=\"cmt_cmt_contents_list\" cmtcmtnos=\"" + cmt[j].POST_CMT_NO + "\">";
                    html += "<div class=\"cmt_cmt_contents\" cmtcmtno=\"" + cmt[j].POST_CMT_NO + "\" cmtcmtmemno=\"" + cmt[j].MEM_NO + "\">";
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
                    if($("#loginUserNo").val() == cmt[j].MEM_NO) {
                        html += "			<span class=\"cmt_cmt_delete_btn\">삭제</span>";
                    } else {
                        html += "<span></span>";
                    }
                    html += "			<span class=\"report_btn\">신고</span>";
                    if($("#loginUserNo").val() == cmt[j].MEM_NO) {
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
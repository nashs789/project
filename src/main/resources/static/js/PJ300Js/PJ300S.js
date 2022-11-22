function drawList(list) {
    var html = "";
    console.log(list);
    for(var d of list){
        html += "<tr>";

        switch(d.CATEGORY_NO)
        {
            case 1:
                html += "<td><span>공지</span></td>";
                html +=	"<td class=\"td_n\">공지사항 </td>";
                break;
            case 2:
                html += "<td>" + d.POST_NO + "</td>";
                html +=	"<td class=\"td_t\">여행꿀팁 </td>";
                break;
            case 3:
                html += "<td>" + d.POST_NO + "</td>";
                html +=	"<td class=\"td_q\"> Q & A </td>";
                break;
            case 4:
                html += "<td>" + d.POST_NO + "</td>";
                html +=	"<td class=\"td_c\">잡&nbsp;&nbsp;&nbsp;담 </td>";
                break;
            default:
                console.log(d.CATEGORY_NO);
        }
        html += "<td class=\"title\" title=\"" + d.POST_NO + "\">" + d.TITLE +"</td>";
        switch(d.GRADE_NO)
        {
            case 0:
                html +=	"<td>관리자 </td>";
                break;
            case 1:
                html +=	"<td>여행꾼</td>";
                break;
            case 2:
                html +=	"<td>여행작가 </td>";
                break;
            default:
                console.log(d.GRADE_NO);
        }
        html += "<td class=\"user\" user=\"" + d.MEM_NO + "\">" + d.NIC + "</td>";
        html += "<td>" + d.BOARD_DATE + "</td>";
        html += "<td>" + d.HIT + "</td>";
        html += "<td>" + d.LIKE_CNT + "</td>";
        html += "</tr>";
    }

    $(".board_list tbody").html(html);
}

function makePathInfo()
{
    var html = "";

    if($("#categoryNo").val() == "0") {
        html += "&nbsp;&nbsp;>&nbsp;&nbsp;";
        html += "<span> 전체보기 &nbsp\;&nbsp\; </span>";
    } else if ($("#categoryNo").val() == "1"){
        html += "&nbsp;&nbsp;>&nbsp;&nbsp;";
        html += "<span> 공지사항 &nbsp\;&nbsp\; </span>";
    } else if ($("#categoryNo").val() == "2"){
        html += "&nbsp;&nbsp;>&nbsp;&nbsp;";
        html += "<span> 여행꿀팁 &nbsp\;&nbsp\; </span>";
    } else if ($("#categoryNo").val() == "3"){
        html += "&nbsp;&nbsp;>&nbsp;&nbsp;";
        html += "<span> Q & A &nbsp\;&nbsp\; </span>";
    } else {
        html += "&nbsp;&nbsp;>&nbsp;&nbsp;";
        html += "<span> 잡&nbsp\;&nbsp\;담 &nbsp\;&nbsp\; </span>";
    }

    if($("#gradeNo").val() == "0") {
        html += ">&nbsp;&nbsp;전체보기";
    } else if ($("#gradeNo").val() == "1") {
        html += ">&nbsp;&nbsp;여행꾼";
    } else if ($("#gradeNo").val() == "2") {
        html += ">&nbsp;&nbsp;여행작가";
    }  else if ($("#gradeNo").val() == "3") {
        html += ">&nbsp;&nbsp;내가 쓴 글";
    }  else {
        html += ">&nbsp;&nbsp;댓글 쓴 글";
    }

    $(".make_path_info").html(html);
}

function makePage(pb)
{
    var html = "<span name=\"1\"><<</span>";

    if($("#Pages").val() == "1") {
        html += "<span name=\"1\"><</span>";
    } else {
        html += "<span name=\"" + ($("#Pages").val() - 1) + "\">&lt;</span>";
    }

    for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
        if($("#Pages").val() == i) {
            html += "<span class=\"on\" name=\"" + i + "\">" + i + "</span>";
        } else {
            html += "<span name=\"" + i + "\">" + i + "</span>";
        }
    }

    if($("#Pages").val() == pb.maxPcount) {
        html += "<span name=\"" + pb.maxPcount + "\">></span>";
    } else {
        html += "<span name=\"" + ($("#Pages").val() * 1 + 1) + "\">></span>";
    }

    html += "<span name=\"" + pb.maxPcount + "\">>></span>";

    $(".paging").html(html);
}
// 카테고리별, 작성자별(등급, 내가 쓴 글)
function reloadList() {
    var params = $("#boardForm").serialize();

    $.ajax({
        url:"communityLists",
        type: "post",
        dataType: "json",
        data : params,
        success: function(res){
            drawList(res.list);
            makePage(res.pb);
            makePathInfo();
        },
        error: function (request, status, error) {
            console.log(error);
        }
    });
}
//공지사항
function noticeList() {
    var params = $("#boardForm").serialize();

    $.ajax({
        url:"communityNLists",
        type: "post",
        dataType: "json",
        data : params,
        success: function(res){
            drawList(res.list);
            makePage(res.pb);
            makePathInfo();
            $("#gradeNo").val(9);
        },
        error: function (request, status, error) {
            console.log(error);
        }
    });
}
// 댓글 쓴 글
function cmtWriteList() {
    var params = $("#boardForm").serialize();

    console.log(params);
    $.ajax({
        url:"communityCMTLists",
        type: "post",
        dataType: "json",
        data : params,
        success: function(res){
            drawList(res.list);
            makePage(res.pb);
            makePathInfo();
        },
        error: function (request, status, error) {
            console.log(error);
        }
    });
}

function commonPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열
{
    var html = "";

    html 	 +="<div class=\"popup2\">";
    html	 +="	 <div class=\"popup_entity_txt2\">"+ txt +"</div>";
    html	 +="     <div class=\"btn_list2\">";
    html	 +="        <div id=\"yesBtn\">예</div>";
    html	 +="     </div>";
    html	 +="</div>";
    html	 +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#yesBtn").on("click", function(){
        $(".popup2").remove();
        $(".bg").remove();
    }); //yesBtn click end
}//commonPopup end

function commonPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열
{
    var html = "";

    html 	 +="<div class=\"popup1\">";
    html	 +="	 <div class=\"popup1_entity_txt\">"+ txt +"</div>";
    html	 +="     <div class=\"btn1_list\">";
    html	 +="        <div id=\"yesBtn\">예</div>";
    html	 +="     </div>";
    html	 +="</div>";
    html	 +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#yesBtn").on("click", function(){
        $(".popup1").remove();
        $(".bg").remove();
    }); //yesBtn click end
}//commonPopup end
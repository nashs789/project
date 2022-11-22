function loadPage()
{
    var params = $("#journalForm").serialize();

    $.ajax({
        url:"journalListCnts",
        data: params,
        dataType:"json",
        type:"post",
        success: function(result){
            if(result.msg == "success")
            {
                var params = $("#journalForm").serialize();

                $.ajax({
                    url:"journalLists",
                    data: params,
                    dataType:"json",
                    type:"post",
                    success: function(result){
                        makeJournalList(result.list);
                        makePage();
                    }, //success end
                    error: function(error){
                        console.log(error);
                    } //error end
                }); //ajax end
            }
            else if(result.msg == "failed")
            {
                popupText = "일지가 없습니다.";
                commonPopup(popupText);
            }
            else
            {
                popupText = "오류가 발생했습니다.";
                commonPopup(popupText);
            }
        }, //success end
        error: function(error){
            console.log(error);
        } //error end
    }); //ajax end
}
function makeJournalList(list)
{
    var html = "";

    for(var data of list)
    {
        html += "   <div class=\"post2\">";
        html += "   <span class=\"thumb\" thumb=\"" + data.JOURNAL_NO + "\"><img alt=\"썸네일\" src=\"resources/upload/" + data.THUMB + "\"></span>";
        html += "      <div class=\"post_info\">";
        html += "         <p>";
        html += "            <span>" + data.CATEGORY + " > " + data.SUB_CATEGORY + "(" + data.REGION + ") </span>";
        html += "         </p>";
        html += "         <p>";
        html += "            <strong class=\"journal\" journal=\"" + data.JOURNAL_NO + "\">" + data.TITLE + "</strong>";
        html += "         </p>";
        html += "         <p>";
        html += "            <em>";

        if(data.PATH != null)
        {
            var hashTag = data.PATH;
            var arr =[];
            arr = hashTag.split(",");

            if(arr.length != 0)
            {
                for(var i = 0; i < arr.length; i++)
                {
                    html += "#" + arr[i]+ " ";
                }
            }
        }

        html += "</em>";
        html += "         </p>";
        html += "      </div>";
        html += "      <div class=\"post_profile\">";
        html += "         <img class=\"user\" user=\"" + data.MEM_NO + "\" alt=\"작성자\"";
        if(data.PHOTO_PATH != null)
        {
            html += " 			src=\"resources/upload/" + data.PHOTO_PATH + "\">";
        }
        else
        {
            html += " 			src=\"./resources/images/profile3.png\">";
        }
        html += " 			<span class=\"user\" user=\"" + data.MEM_NO + "\">" + data.NIC + "</br>(" + data.GRADE + ")</span>";
        html += "         <div>";
        html += "            <div>";
        html += "               <span>조회수</span> <span class=\"cnt\">" + data.HIT + "</span> <span>좋아요</sp";
        html += "               <span class=\"cnt\">" + data.LIKE_CNT + "</span>";
        html += "            </div>";
        html += "            <span>" + data.JOURNAL_DATE + "</span>";
        html += "         </div>";
        html += "      </div>";
        html += "   </div>";
    }

    $(".gallery").html(html);
}
function makePage()
{
    var html = "<span id=\"goFirstPage\" name=\"1\"><<</span>";

    if($("#page2").val() == "1") {
        html += "<span name=\"1\"><</span>";
    } else {
        html += "<span name=\"" + ($("#page2").val() - 1) + "\">&lt;</span>";
    }

    if($("#endPCnt").val() == $("#page2").val() && $("#endPCnt").val() != $("#maxCnt").val())
    {
        $("#startPCnt").val(($("#startPCnt").val()*1)+1);
        $("#endPCnt").val(($("#endPCnt").val()*1)+1);
    }
    else if($("#startPCnt").val() == $("#page2").val() && $("#startPCnt").val() != 1)
    {
        $("#startPCnt").val($("#startPCnt").val()-1);
        $("#endPCnt").val($("#endPCnt").val()-1);
    }
    else if($("#page2").val() == $("#maxCnt").val())
    {
        $("#startPCnt").val($("#maxCnt").val() - 4);
        $("#endPCnt").val($("#maxCnt").val());

        if($("#startPCnt").val() <= 0)
        {
            $("#startPCnt").val(1);
        }
    }
    else if($("#page2").val() == 1)
    {
        $("#startPCnt").val(1);
        $("#endPCnt").val($("#endPCnt").val());
    }

    for(var i = $("#startPCnt").val() * 1 ; i <= $("#endPCnt").val() * 1 ; i++) {
        if($("#page2").val() == i) {
            html += "<span class=\"on\" name=\"" + i + "\">" + i + "</span>";
        } else {
            html += "<span name=\"" + i + "\">" + i + "</span>";
        }
    }

    if($("#page2").val() == $("#maxCnt").val()) {
        html += "<span name=\"" + $("#maxCnt").val() + "\">></span>";
    } else {
        html += "<span name=\"" + ($("#page2").val() * 1 + 1) + "\">></span>";
    }

    html += "<span name=\"" + $("#maxCnt").val() + "\">>></span>";

    $(".paging").html(html);
}
function loadPage2()
{
    var params = $("#journalForm").serialize();

    $.ajax({
        url:"journalListCnts",
        data: params,
        dataType:"json",
        type:"post",
        success: function(result){
            if(result.msg == "success")
            {
                $("#cnt").val(result.cnt);
                $("#startCnt").val(result.pb.startCount);
                $("#endCnt").val(result.pb.endCount);
                $("#maxCnt").val(result.pb.maxPcount);
                $("#startPCnt").val(result.pb.startPcount);
                $("#endPCnt").val(result.pb.endPcount);

                var params = $("#journalForm").serialize();

                $.ajax({
                    url:"journalLists",
                    data: params,
                    dataType:"json",
                    type:"post",
                    success: function(result){
                        makeJournalList(result.list);
                        makePage();
                    }, //success end
                    error: function(error){
                        console.log(error);
                    } //error end
                }); //ajax end
            }
            else if(result.msg == "failed")
            {
                popupText = "일지가 없습니다.";
                commonPopup(popupText);
            }
            else
            {
                popupText = "오류가 발생했습니다.";
                commonPopup(popupText);
            }
        }, //success end
        error: function(error){
            console.log(error);
        } //error end
    }); //ajax end
}

function makePopup()
{
    var html = "";

    html+="   <div class=\"popup\">";
    html+="      <div class=\"popup_contents_txt\">";
    html+="         <div>";
    html+="            일지 작성 <span>필수 입력 사항 </span><span class=\"asterisk\">&#42;</span>";
    html+="         </div>";
    html+="            <span class=\"asterisk\">&#42;</span>여행 시작일 : <input type=\"date\" class=\"start_date\"> <span class=\"asterisk\">&#42;</span>";
    html+="            여행 종료일 : <input   type=\"date\" class=\"end_date\">";
    html+="         <div class=\"category_area\">";
    html+="            <span class=\"asterisk\">&#42;</span>";
    html+="               <span>여행지역  </span> <select id=\"regionSelect\">";
    html+="               <option value=\"17\">지역</option>";
    html+="               <option value=\"0\">서울</option>";
    html+="               <option value=\"1\">부산</option>";
    html+="               <option value=\"2\">대구</option>";
    html+="               <option value=\"3\">인천</option>";
    html+="               <option value=\"4\">광주</option>";
    html+="               <option value=\"5\">대전</option>";
    html+="               <option value=\"6\">울산</option>";
    html+="               <option value=\"7\">세종</option>";
    html+="               <option value=\"8\">경기도</option>";
    html+="               <option value=\"9\">강원도</option>";
    html+="               <option value=\"10\">층청북도</option>";
    html+="               <option value=\"11\">층청남도</option>";
    html+="               <option value=\"12\">전라북도</option>";
    html+="               <option value=\"13\">전라남도</option>";
    html+="               <option value=\"14\">경상북도</option>";
    html+="               <option value=\"15\">경상남도</option>";
    html+="               <option value=\"16\">제주도</option>";
    html+="            </select> ";
    html+="         </div>";
    html+="      </div>";
    html+="      <div class=\"btn_list\">";
    html+="         <span id=\"goWrite\">작 성</span> <span id=\"cancel\">취 소</span>";
    html+="      </div>";
    html+="   </div>";
    html+="   <div class=\"bg\"></div>";

    $("body").append(html);

    $(".start_date").on("change", function(){
        $("#startDate").val($(".start_date").val());
    })//start_date change end

    $(".end_date").on("change", function(){
        $("#endDate").val($(".end_date").val());
    })//start_date change end

    $("#goWrite").on("click", function(){
        if($(".start_date").val() == "")
        {
            popupText = "시작일을 입력하세요.";
            commonPopup(popupText);
        }
        else if($(".end_date").val() == "")
        {
            popupText = "종료일을 입력하세요.";
            commonPopup(popupText);
        }
        else if($("#startDate").val() > $("#endDate").val())
        {
            popupText = "시작일이 종료일보다 클 수 없음";
            commonPopup(popupText);
        }
        else if($("#regionSelect[id='regionSelect'] option:selected").val() == "17")
        {
            popupText = "지역을 입력하세요.";
            commonPopup(popupText);
        }
        else
        {
            $("#regionNo").val($("#regionSelect[id='regionSelect'] option:selected").val());
            $("#writeForm").submit();
        }
    });//goWrite click end

    $("#cancel").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //cancel click end
}
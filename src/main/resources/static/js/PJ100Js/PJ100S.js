function makeNoticeBoard(noticeData)
{
    var html = "";

    html +=" <div id=\"noticeBoard\">";
    html +=" <div class=\"title\">[공지 사항]</div>";
    html +=" <table>";
    html +=" 	<colgroup>";
    html +=" 		<col width=\"50px\">";
    html +=" 		<col width=\"300px\">";
    html +=" 		<col width=\"80px\">";
    html +=" 		<col width=\"70px\">";
    html +=" 		<col width=\"130px\">";
    html +=" 	</colgroup>";
    html +=" 	<thead>";
    html +=" 		<tr>";
    html +=" 			<th>번호</th>";
    html +=" 			<th>제목</th>";
    html +=" 			<th>작가</th>";
    html +=" 			<th>조회수</th>";
    html +=" 			<th>날짜</th>";
    html +=" 		</tr>";
    html +=" 	</thead>";

    for(var data of noticeData)
    {
        html +=" 	<tbody>";
        html +=" 		<tr>";
        html +=" 			<td>" + data.POST_NO + "</td>";
        html +=" 			<td class=\"post\" post=\"" + data.POST_NO + "\">" + data.TITLE + "</td>";
        html +=" 			<td>운영자</td>";
        html +=" 			<td>" + data.HIT + "</td>";
        html +=" 			<td>" + data.BOARD_DATE + "</td>";
        html +=" 		</tr>";
        html +=" 	</tbody>";
    }
    html +="	</table>";
    html +="</div><!-- noticeBoard end  -->";

    $("#noticeWrap").html(html);
}//makeNoticeBoard end

function makeRankBoard(yearData, monthData, weekData)
{
    var html = "";

    html +="<div id=\"regionName\"><" + yearData[0].REGION_NAME + "></div>";
    html +=" <div id=\"yearBoard\">";
    html +=" <div class=\"title\">[" + yearData[0].JOURNAL_DATE.substring(0, 4) + "년 랭킹]</div>";
    html +=" <table>";
    html +=" 	<colgroup>";
    html +=" 		<col width=\"50px\">";
    html +=" 		<col width=\"300px\">";
    html +=" 		<col width=\"80px\">";
    html +=" 		<col width=\"70px\">";
    html +=" 		<col width=\"130px\">";
    html +=" 	</colgroup>";
    html +=" 	<thead>";
    html +=" 		<tr>";
    html +=" 			<th>번호</th>";
    html +=" 			<th>제목</th>";
    html +=" 			<th>작가</th>";
    html +=" 			<th>조회수</th>";
    html +=" 			<th>날짜</th>";
    html +=" 		</tr>";
    html +=" 	</thead>";

    for(var data of yearData)
    {
        html +=" 	<tbody>";
        html +=" 		<tr>";
        html +=" 			<td>" + data.JOURNAL_NO + "</td>";
        html +=" 			<td class=\"journal\" journal=\"" + data.JOURNAL_NO + "\">" + data.TITLE + "</td>";
        html +=" 			<td class=\"user\" user=\"" + data.MEM_NO + "\">" + data.NIC + "</td>";
        html +=" 			<td>" + data.HIT + "</td>";
        html +=" 			<td>" + data.JOURNAL_DATE + "</td>";
        html +=" 		</tr>";
        html +=" 	</tbody>";
    }
    html +="	</table>";
    html +="</div><!-- yearBoard end  -->";
    /* -------------------------------------------------------------- */
    html +="<div id=\"monthBoard\">";
    if(monthData.length != 0)
    {
        html +="	<div class=\"title\">["+monthData[0].MONTH+"월 랭킹]</div>";
    }
    else
    {
        html +="	<div class=\"title\">[월간 랭킹]</div>";
    }

    html +="	<table>";
    html +="		<colgroup>";
    html +="			<col width=\"50px\">";
    html +="			<col width=\"300px\">";
    html +="			<col width=\"80px\">";
    html +="			<col width=\"70px\">";
    html +="			<col width=\"130px\">";
    html +="		</colgroup>";
    html +="		<thead>";
    html +="			<tr>";
    html +="				<th>글번호</th>";
    html +="				<th>제목</th>";
    html +="				<th>작가</th>";
    html +="				<th>조회수</th>";
    html +="			<th>날짜</th>";
    html +="		</tr>";
    html +="	</thead>";

    if(monthData.length != 0)
    {
        for(data of monthData)
        {
            html +="	<tbody>";
            html +="		<tr>";
            html +="			<td>" + data.JOURNAL_NO + "</td>";
            html +="			<td class=\"journal\" journal=\"" + data.JOURNAL_NO + "\">" + data.TITLE + "</td>";
            html +="			<td class=\"user\" user=\"" + data.MEM_NO + "\">" + data.NIC + "</td>";
            html +="			<td>" + data.HIT + "</td>";
            html +="			<td>" + data.JOURNAL_DATE + "</td>";
            html +="		</tr>";
            html +="	</tbody>";
        }
    }
    html +="	</table>";
    html +="</div> <!-- monthBoard end -->";
    /* -------------------------------------------------------------- */
    html +="<div id=\"weekBoard\">";
    html +="	<div class=\"title\">[이번 주 랭킹]</div>";
    html +=" <table>";
    html +="	<colgroup>";
    html +="		<col width=\"50px\">";
    html +="		<col width=\"300px\">";
    html +="		<col width=\"80px\">";
    html +="		<col width=\"70px\">";
    html +="		<col width=\"130px\">";
    html +="	</colgroup>";
    html +="	<thead>";
    html +="		<tr>";
    html +="			<th>번호</th>";
    html +="			<th>제목</th>";
    html +="			<th>작가</th>";
    html +="			<th>조회수</th>";
    html +="			<th>날짜</th>";
    html +="		</tr>";
    html +="	</thead>";

    if(weekData.length != 0)
    {
        for(data of weekData)
        {
            html +="	<tbody>";
            html +="		<tr>";
            html +="			<td>" + data.JOURNAL_NO + "</td>";
            html +="			<td class=\"journal\" journal=\"" + data.JOURNAL_NO + "\">" + data.TITLE + "</td>";
            html +="			<td class=\"user\" user=\"" + data.MEM_NO + "\">" + data.NIC + "</td>";
            html +="			<td>" + data.HIT + "</td>";
            html +="			<td>" + data.JOURNAL_DATE + "</td>";
            html +="		</tr>";
            html +="	</tbody>";
        }
    }

    html +="	</table>";
    html +="</div> <!-- weekBoard end -->";

    $("#rankWrap").html(html);
}//makeRankBoard end

function setNoticeBoard(){
    sendServer("selectPJ100Notices", paramObj, function callback(result){
        makeNoticeBoard(result);
        $("#CD0").click();
    });
}

function setRankBoard(){
    sendServer("selectPJ100regionBoards", paramObj, function callback(result){
        makeRankBoard(result.YearRankList, result.MonthRankList, result.WeekRankList);
        $("#yearBoard, #monthBoard, #weekBoard").css("display", "inline-block");
    });
}
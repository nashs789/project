function makeTimeline(timeline)
{
    var flag = 1;
    var html = "";

    for(time of timeline)
    {
        if(flag == 1)
        {
            html += " <div class=\"container left\">";
            flag--;
        }
        else
        {
            html += " <div class=\"container right\">";
            flag++;
        }

        html += "   <div class=\"content\">";
        html += "     <div class=\"date_area\">" + time.YEAR + time.MONTH + time.DAY + "("+time.CHA_DATE +")"+ "</div>";
        html += "     <div class=\"contents_area\">";
        html += "     	<div class=\"img_area\">";
        html += "     		<div class=\"first\" style=\"display: inline-block\">";

        switch(time.GBN)
        {
            case 0:
                html += "     			<img class=\"post\" post=\"" + time.POST_NO + "\" src=\"./resources/images/board.jpg\">";
                html += "     		</div>";
                html += "     		<div class=\"last\">";
                html += "     			<span class=\"post\" post=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
                html += "               <span class=\"post\" post=\"" + time.POST_NO + "\">" + time.CONTENTS + "</span>"
                html += "     		</div>";
                html += "     	</div>";
                html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 게시물을 포스트 하셨습니다. </div>";
                break;
            case 1:
                if(time.THUMB_PHOTO_PATH != null)
                {
                    html += "     			<img class=\"journal\" journal=\"" + time.POST_NO + "\" src=\"resources/upload/" + time.THUMB_PHOTO_PATH + "\">";
                }
                else
                {
                    html += "     			<img class=\"journal\" journal=\"" + time.POST_NO + "\" src=\"./resources/images/switzerland.jpg\">";
                }
                html += "     		</div>";
                html += "     		<div class=\"last\">";
                html += "     			<span class=\"journal\" journal=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
                html += "               <span class=\"journal\" journal=\"" + time.POST_NO + "\">" + time.CONTENTS + "</span>"
                html += "     		</div>";
                html += "     	</div>";
                html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 여행 일지를 포스트 하셨습니다. </div>";
                break;
            case 2:
                html += "     			<img class=\"post\" post=\"" + time.POST_NO + "\" src=\"./resources/images/board.jpg\">";
                html += "     		</div>";
                html += "     		<div class=\"last\">";
                html += "     			<span class=\"post\" post=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
                html += "               [댓글]<span class=\"post\" post=\"" + time.POST_NO + "\"> " + time.CONTENTS + "</span> 라고 남기셨습니다."
                html += "     		</div>";
                html += "     	</div>";
                html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 게시물에 댓글을 남기셨습니다. </div>";
                break;
            case 3:
                html += "     			<img class=\"journal\" journal=\"" + time.POST_NO + "\" src=\"./resources/images/switzerland.jpg\">";
                html += "     		</div>";
                html += "     		<div class=\"last\">";
                html += "     			<span class=\"journal\" journal=\"" + time.POST_NO + "\">" + time.TITLE + "</span><br><br>";
                html += "               [댓글]<span class=\"journal\" journal=\"" + time.POST_NO + "\"> " + time.CONTENTS + "</span> 라고 남기셨습니다."
                html += "     		</div>";
                html += "     	</div>";
                html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 위 여행 일지에 댓글을 남기셨습니다. </div>";
                break;
            case 4:
                html += "     			<img src=\"./resources/images/birthday.jpg\">";
                html += "     		</div>";
                html += "     		<div class=\"last\">";
                html += "     			<span></span><br>";
                html += "               <span></span>"
                html += "     		</div>";
                html += "     	</div>";
                html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님의 생일 이였습니다. </div>";
                break;
            case 5:
                html += "     			<img class=\"nic\" nic=\"" + time.MEM_NO + "\" src=\"resources/upload/" + time.PHOTO_PATH + "\">";
                html += "     		</div>";
                html += "     		<div class=\"last\">";
                html += "     			<span></span><br><br>";
                html += "               <span></span>"
                html += "     		</div>";
                html += "     	</div>";
                html += "     	<div class=\"txt_area\"><span class=\"nic\" nic=\"" + time.MEM_NO + "\">" + time.NIC + "</span>님께서 여행 작가가 되셨습니다. </div>";
                break;
            default:
                console.log("흠");
        }

        html += "     </div>";
        html += "   </div>";
        html += " </div>";
    } // for문  end

    $(".timeline").append(html);
}

function makeProfilePopup(mini, x, y)
{
    var html = "";

    html += "	<div class=\"popup\">";
    html += "	<div class=\"popup_entity_txt\">";
    html += "		<div id=\"miniPhoto\"><img src=\"resources/upload/" + mini.PHOTO_PATH + "\"></div>";
    html += "		<div id=\"miniNic\">" + mini.NIC + " (" + mini.GRADE_NAME + ")</div>";
    html += "		<table>";
    html += "			<colgroup>";
    html += "				<col width=\"150px\">";
    html += "				<col width=\"150px\">";
    html += "			</colgroup>";
    html += "			<tbody>";
    html += "				<tr>";
    html += "					<td>방문일수</td>";
    html += "					<td>" + mini.ACC_CNT + "</td>";
    html += "				</tr>";
    html += "				<tr>";
    html += "					<td>팔로워</td>";
    html += "					<td>" + mini.FOLLOWER_CNT + "</td>";
    html += "				</tr>";
    html += "				<tr>";
    html += "					<td>게시글</td>";
    html += "					<td>" + mini.POST_CNT + "</td>";
    html += "				</tr>";
    html += "				<tr>";
    html += "					<td>여행일지</td>";
    html += "					<td>" + mini.JOURNAL_CNT + "</td>";
    html += "				</tr>";
    html += "			</tbody>";
    html += "		</table>";
    html += "	</div>";
    html += "</div>";

    $("body").append(html);

    if(y < 330)
    {
        $(".popup").css("top", y);
    }
    else if(y >= 330 && y <= 415)
    {
        y-= 200;
        $(".popup").css("top", y);
    }
    else
    {
        y-= 445;
        $(".popup").css("top", y);
    }

    $(".popup").css("left", x);
}
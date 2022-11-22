function makeFollowing(myFollowing)
{
    var html = "";

    for(data of myFollowing)
    {
        html += "	<div class=\"user_area\ user_area=\"" + data.MEM_NO + "\">";
        html += "		<input type=\"checkbox\" class=\"ck" + data.MEM_NO + "\"/><span><img";
        if(data.PHOTO_PATH != null)
        {
            html += "			alt=\"profile\" src=\"resources/upload/" + data.PHOTO_PATH + "\"></span>";
        }
        else
        {
            html += "			alt=\"profile\" src=\"./resources/images/profile.png\"></span>";
        }
        html += "		<div class=\"user_info\">";
        html += "			<span class=\"nic\">" + data.NIC + "</span> <span class=\"memo\">" + data.REQUEST_DATE + "(" + data.CHA + "일)";
        html += "</span>";
        html += "			<hr>";
        if(data.MEMO == null)
        {
            html += "			<p>메모가 없습니다.</p>";
        }
        else
        {
            html += "			<p>" + data.MEMO + "</p>";
        }
        html += "		</div>";
        html += "		<div class=\"follow_btn_area\">";
        html += "			<input type=\"button\" class=\"user\" user=\"" + data.MEM_NO + "\"";
        html += "				value=\"여 행 일 지&nbsp;&nbsp;&nbsp;모 아 보 기 &nbsp;&nbsp;&nbsp;&#62;\" /> ";
        html += "		</div>";
        html += "	</div>";
    }
    $(".follow_list").append(html);
}
function makeMemo(followingMemo)
{
    var html = "";

    html += "   <div class=\"popup\">";
    html += "   	<div class=\"popup_contents_txt\">";
    html += "   		<div>";
    html += "   			팔로우 메모 작성";
    html += "   		</div>";
    html += "   		<div>";
    html += "   			 메모<br /> <input type=\"text\"";
    html += "   				class=\"pop_name\" required placeholder=\"팔로잉에 대한 메모를 적어주시오\"/>";
    html += "   		</div>";
    html += "   	</div>";
    html += "   	<div class=\"btn_list\">";
    html += "   		<span id=\"yes\">수 정</span> <span id=\"no\">취 소</span>";
    html += "   	</div>";
    html += "   </div>";
    html += "   <div class=\"bg\"></div>";

    $("body").append(html);
    if(followingMemo != null)
    {
        $(".pop_name").val(followingMemo.MEMO);
    }
    else
    {
        $(".pop_name").val("메모가 없습니다.");
    }

    $("#no").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //no click end

    $("#yes").on("click", function(){
        $("#memo").val($(".pop_name").val());
        var params = $("#boxNumber").serialize();

        $.ajax({
            url: "updateMemos",
            data: params,
            dataType: "json",
            type: "post",
            success: function(result){
                if(result.msg == "success")
                {
                    $(".popup").remove();
                    $(".bg").remove();
                    location.reload();
                }
                else
                {
                    popupText = "오류가 발생 했습니다.";
                    commonPopup(popupText);
                }
            },//success end
            error: function(error){
                console.log(error);
            }//error end
        }); //ajax end
    }); //yes click end
}
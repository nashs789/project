function makeBMK(BMK)
{
    var html = "";

    for(data of BMK)
    {
        html += "	<div class=\"folder\" folder=\"" + data.BMK_NO + "\">";
        html += "		<input type = \"checkbox\" class=\"ck\" ck=\"" + data.BMK_NO + "\"/></label>";
        switch(data.FOLDER_IMG)
        {
            case 1:
                html += "		<span class=\"folder_thumb\"><img alt=\"썸네일\" src=\"./resources/images/backpack1.png\"></span>";
                break;
            case 2:
                html += "		<span class=\"folder_thumb\"><img alt=\"썸네일\" src=\"./resources/images/backpack2.png\"></span>";
                break;
            case 3:
                html += "		<span class=\"folder_thumb\"><img alt=\"썸네일\" src=\"./resources/images/backpack3.png\"></span>";
                break;
        }
        html += "		<div class=\"folder_info\">";
        html += "			<p>";
        html += "				<strong>" + data.FOLDER_NAME + "</strong>";
        html += "			</p>";
        html += "			<p>";
        html += "				" + data.FOLDER_MEMO + "";
        html += "			</p>";
        html += "		</div>";
        html += "	</div>";
    }

    $(".gallery").html(html);
}

function makeAddPopup()
{
    var html = "";

    html += "    <div class=\"popup\">";
    html += "    	<div class=\"popup_contents_txt\">";
    html += "    		<div>";
    html += "    			폴더 추가<span>필수 입력 사항 </span><span class=\"asterisk\">&#42;</span>";
    html += "    		</div>";
    html += "    		<div class=\"radio_title\">";
    html += "    			<span>폴더 선택</span> <span class=\"asterisk\">&#42;</span>";
    html += "    		</div>";
    html += "    		<div class=\"folder_radio\">";
    html += "    			<div class=\"folder_radio_box\">";
    html += "    				<input type=\"radio\" id=\"folder_radio1\" value=\"1\" name=\"folder_img\"><br/>";
    html += "    		    	<label for=\"folder_radio1\"><img src=\"./resources/images/backpack1.png\"> </label>";
    html += "    			</div>";
    html += "    			<div class=\"folder_radio_box\">";
    html += "    				<input type=\"radio\" id=\"folder_radio2\" value=\"2\" name=\"folder_img\"><br/>";
    html += "    		    	<label for=\"folder_radio2\"><img src=\"./resources/images/backpack2.png\"> </label>";
    html += "    			</div>";
    html += "    		    <div class=\"folder_radio_box\">";
    html += "    			    <input type=\"radio\" id=\"folder_radio3\" value=\"3\" name=\"folder_img\"><br/>";
    html += "    			    <label for=\"folder_radio3\"><img src=\"./resources/images/backpack3.png\"></label>";
    html += "    		    </div>";
    html += "    		</div>";
    html += "    		<div>";
    html += "    			폴더 이름 <span class=\"asterisk\">&#42;</span><br /> <input type=\"text\" class=\"pop_name\" name=\"pop_name\" required/><br />";
    html += "    			폴더 메모<br /> <textarea class=\"pop_memo\" name=\"pop_memo\" rows=\"3\" cols=\"73\"  placeholder=\"폴더에 대해 간략히 설명해주십시오\" ></textarea>";
    html += "    		</div>";
    html += "    	</div>";
    html += "    	<div class=\"btn_list\">";
    html += "    		<span id=\"add\">추 가</span> <span id=\"no\">취 소</span>";
    html += "    	</div>";
    html += "    </div>";
    html += "<div class=\"bg\"></div>"

    $("#footer").append(html);

    $("#no").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //no click end

    $("#add").on("click", function(){
        if(isNaN($(":radio[name='folder_img']:checked").val()))
        {
            popupText = "폴더 이미지를 선택하세요.";
            commonPopup(popupText);
        }
        else if($.trim($(".pop_name").val()) == "")
        {
            popupText = "폴더 이름을 입력하세요.";
            commonPopup(popupText);
        }
        else
        {
            var params = $("#editForm").serialize();
            console.log(params);
            $.ajax({
                url:"addBMKs",
                data:params,
                dataType:"json",
                type:"post",
                success:function(result){
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
                error:function(error){
                    console.log(error);
                }//error end
            }); //ajax end
        }//if ~ else end
    }); //yes click end
}

function editBMK()
{
    var html = "";

    html += "    <div class=\"popup\">";
    html += "    	<div class=\"popup_contents_txt\">";
    html += "    		<div>";
    html += "    			폴더 수정<span>필수 입력 사항 </span><span class=\"asterisk\">&#42;</span>";
    html += "    		</div>";
    html += "    		<div class=\"radio_title\">";
    html += "    			<span>폴더 선택</span> <span class=\"asterisk\">&#42;</span>";
    html += "    		</div>";
    html += "    		<div class=\"folder_radio\">";
    html += "    			<div class=\"folder_radio_box\">";
    html += "    				<input type=\"radio\" id=\"folder_radio1\" value=\"1\" name=\"folder_img\"><br/>";
    html += "    		    	<label for=\"folder_radio1\"><img src=\"./resources/images/backpack1.png\"> </label>";
    html += "    			</div>";
    html += "    			<div class=\"folder_radio_box\">";
    html += "    				<input type=\"radio\" id=\"folder_radio2\" value=\"2\" name=\"folder_img\"><br/>";
    html += "    		    	<label for=\folder_radio2\"><img src=\"./resources/images/backpack2.png\"></label>";
    html += "    			</div>";
    html += "    		    <div class=\"folder_radio_box\">";
    html += "    			    <input type=\"radio\" id=\"folder_radio3\" value=\"3\" name=\"folder_img\"><br/>";
    html += "    			    <label for=\"folder_radio3\"><img src=\"./resources/images/backpack3.png\"></label>";
    html += "    		    </div>";
    html += "    		</div>";
    html += "    		<div>";
    html += "    			폴더 이름 <span class=\"asterisk\">&#42;</span><br /> <input type=\"text\" class=\"pop_name\" name=\"pop_name\"/><br />";
    html += "    			폴더 메모<br /> <textarea class=\"pop_memo\" name=\"pop_memo\" rows=\"3\" cols=\"73\"  placeholder=\"폴더에 대해 간략히 설명해주십시오\"></textarea>";
    html += "    		</div>";
    html += "    	</div>";
    html += "    	<div class=\"btn_list\">";
    html += "    		<span id=\"yes\">수 정</span><span id=\"no\">취 소</span>";
    html += "    	</div>";
    html += "    </div>";
    html += "<div class=\"bg\"></div>"

    $("#footer").append(html);

    var params = $("#BMKForm").serialize();

    $.ajax({
        url:"editBMKs",
        data:params,
        dataType:"json",
        type:"post",
        success:function(result){
            if(result.msg == "success")
            {
                if(result.BMK.FOLDER_IMG == 1)
                {
                    $("#folder_radio1").prop("checked", true)
                }
                else if(result.BMK.FOLDER_IMG == 2)
                {
                    $("#folder_radio2").prop("checked", true)
                }
                else
                {
                    $("#folder_radio3").prop("checked", true)
                }
                $(".pop_name").val(result.BMK.FOLDER_NAME);
                $(".pop_memo").val(result.BMK.FOLDER_MEMO);
            }
            else
            {
                popupText = "오류가 발생 했습니다.";
                commonPopup(popupText);
            }
        },//success end
        error:function(error){
            console.log(error);
        }//error end
    }); //ajax end

    $("#no").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //no click end

    $("#yes").on("click", function(){
        $("#BMKNO").val($("#box").val());
        var params = $("#editForm").serialize();

        $.ajax({
            url:"updateBMKs",
            data:params,
            dataType:"json",
            type:"post",
            success:function(result){
                popupText = "수정에 성공 했습니다.";
                commonPopup(popupText);
                location.reload();
            },//success end
            error:function(error){
                console.log(error);
            }//error end
        }); //ajax end
    }); //yes click end
} //function end
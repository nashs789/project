function setAllCompValue(result){
    setCompInpValue("inp_name", result.name);
    setCompInpValue("inp_id", result.id);
    setCompInpValue("inp_keyword", result.keyword);
    setCompInpValue("sel_telcom", result.telcom);
    setCompInpValue("sel_keyword", result.keyword_no);
    console.log(result.email);
    console.log(result.phone);

    /*
    result.birth
    result.sex
    result.phone
    result.email
    */
}

function checkPopup()
{
    var html = "";

    html +="<div class=\"popup\">";
    html +="	   <div class=\"popup_entity_txt\">정말로 탈퇴 하시겠습니까?</div>";
    html +="       <div class=\"btn_list\">";
    html +="       		<a id=\"ok\">확인</a>";
    html +="      		<a id=\"cancel\">취소</a>";
    html +="       </div>";
    html +="</div>";
    html +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#cancel").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //cancelImg click end

    $("#ok").on("click", function(){
        var params = $("#memForm").serialize();

        $.ajax({
            url: "deletes",
            data: params,
            dataType:"json",
            type: "post",
            success:function(result)
            {
                if(result.msg == "success")
                {
                    location.href="main";
                }
                else
                {
                    popupText = "탈퇴에 실패하였습니다.";
                    commonPopup(popupText);
                }
            }, //success end
            error: function(request, status, error) {
                console.log(error);
            } // error end
        }); //ajax end
    }); //cancelImg click end
}//findBtnPopup end


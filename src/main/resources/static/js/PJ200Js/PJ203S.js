function setAllCompValue(result){
    setCompInpValue("inp_name"    , result.name);
    setCompInpValue("inp_id"      , result.id);
    setCompInpValue("inp_keyword" , result.keyword);
    setCompInpValue("sel_telcom"  , result.telcom);
    setCompInpValue("sel_keyword" , result.keyword_no);
    setCompInpValue("sel_year"    , result.birth.substr(0, 4));
    setCompInpValue("sel_month"   , result.birth.substr(5, 2));
    setCompInpValue("sel_day"     , result.birth.substr(8, 2));
    setCompInpValue("inp_email"   , result.email.substr(0, result.email.indexOf('@')));
    setCompInpValue("inp_domain"  , result.email.substr(result.email.indexOf('@') + 1, result.email.length));
    setCompInpValue("inp_phone"   , result.phone.substr(3));
    setCompRadValue("rad_name_sex", result.sex);

    $("#btn_code").css("background-color", "#2e3459");
    $("#btn_code").css("color", "white");
    $("#btn_code").css("cursor", "default");
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


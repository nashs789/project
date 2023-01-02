// endPopup은 공통 팝업으로 변경해서 사용해도 될 것 같음
// 2023.01.03 (추가처리)
function endPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열
{
    $(".popup").remove();
    $(".bg").remove();

    var html = "";

    html +="<div class=\"popup\">";
    html	 +="	 <div class=\"popup_entity_txt\">"+ txt +"</div>";
    html	 +="     <div class=\"btn_list\">";
    html	 +="        <a href=\"PJ100M\" id=\"yesBtn\">예</a>";
    html	 +="     </div>";
    html	 +="</div>";
    html	 +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#yesBtn").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //yesBtn click end
}

/*function setValToForm(){
    $("#form_name").val($("#inp_name").val());
    $("#form_birth").val($("#sel_year").val() + getMonthAndDayWithZero("sel_month") + getMonthAndDayWithZero("sel_day"));
    $("#form_sex").val($(':radio[name="rad_name_sex"]:checked').val());
    $("#form_id").val($("#inp_id").val());
    $("#form_pw").val($("#inp_pw").val());
    $("#form_telcom").val($("#sel_telcom").val());
    $("#form_phone").val($("#inp_phone").val());
    $("#form_email").val($("#inp_email").val());
    $("#form_domain").val($("#inp_domain").val());
    $("#form_email_confirm").val("1");
    $("#form_keyword_no").val($("#sel_keyword").val());
    $("#form_keyword").val($("#inp_keyword").val());
    // 이메일 확인 했다는 변수 추가 2022.12.20 (추가처리)
}*/

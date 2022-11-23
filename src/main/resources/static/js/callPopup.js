function endPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열
{
    var html = "";

    html +="<div class=\"popup\">";
    html	 +="	 <div class=\"popup_entity_txt\">"+ txt +"</div>";
    html	 +="     <div class=\"btn_list\">";
    html	 +="        <a href=\"main\" id=\"yesBtn\">예</a>";
    html	 +="     </div>";
    html	 +="</div>";
    html	 +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#yesBtn").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //yesBtn click end
}
function commonPopup(txt) //공통적으로 쓰이는 팝업 , txt는 팝업에 들어갈 문자열
{
    var html = "";

    html 	 +="<div class=\"popup\">";
    html	 +="	 <div class=\"popup_entity_txt\">"+ txt +"</div>";
    html	 +="     <div class=\"btn_list\">";
    html	 +="        <div id=\"yesBtn\">예</div>";
    html	 +="     </div>";
    html	 +="</div>";
    html	 +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#yesBtn").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //yesBtn click end
}//commonPopup end

function findBtnPopup()
{
    var html = "";

    html +="<div class=\"popup\">";
    html +="	   <div class=\"popup_entity_txt\">무엇이 필요하십니까?</div>";
    html +="       <div class=\"btn_list\">";
    html +="       		<a href=\"PJ205M\">ID찾기</a>";
    html +="      		<a href=\"PJ206M\">PW찾기</a>";
    html +="       <img src=\"static/images/cancel.png\" id=\"cancelImg\"/>";
    html +="    </div>";
    html +="</div>";
    html +="<div class=\"bg\"></div>";

    $("body").append(html);

    $("#cancelImg").on("click", function(){
        $(".popup").remove();
        $(".bg").remove();
    }); //cancelImg click end
}//findBtnPopup end
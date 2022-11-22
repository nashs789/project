function findIDPopup(ID, name)
{
    var html = "";

    html+="  <div class=\"popup2\">";
    html+=" 	   <div class=\"popup_entity_txt\">[아이디 이메일 전송]</div>";
    html+="      <div class=\"list\">";
    html+="	       <table id=\"listTable\">";
    html+="		       	<colgroup>";
    html+="					<col width=\"360\" />";
    html+="					<col width=\"60\" />";
    html+="					<col width=\"80\" />";
    html+="				</colgroup>";
    html+="				<thead>";
    html+="	       			<tr>";
    html+="	       				<th>아이디</th>";
    html+="	       				<th>이름</th>";
    html+="	       			</tr>";
    html+="	       		</thead>";
    html+="	       		<tbody>";
    html+="	       			<tr>";
    html+="	       				<td>"+ ID  +"</td>";
    html+="	       				<td>"+ name +"</td>";
    html+="	       				<td><input type=\"button\" class=\"send_btn\" value=\"전송\"/></td>";
    html+="						<td class=\"send_finish\">전송완료</td>";
    html+="	       			</tr>";
    html+="	       		</tbody>";
    html+="	       	</table>";
    html+="      </div>";
    html+="      <img src=\"./resources/images/cancel.png\" id=\"cancelImg\"/>";
    html+=" </div>";
    html+=" <div class=\"bg\"></div>";

    $("body").append(html);

    $("table").on("mouseover", ".send_btn", function(){
        $(this).parent().parent().children(":nth-child(1)").css("background-color", "#d1e0e0");
    }); //table send_btn mouseover end

    $("table").on("mouseout", ".send_btn", function(){
        $(this).parent().parent().children(":nth-child(1)").css("background-color", "#fcfcfc");
    }); //table send_btn mouseover end

    $("table").on("click", ".send_btn", function(){
        $(this).attr("disabled", true);
        $(this).css("cursor", "default");
        $(this).css("color", "white");
        $(this).css("background-color", "#2e3459");
        $(this).parent().parent().children(":nth-child(4)").css("display", "inline");

        var params = $("#infoForm").serialize();

        $.ajax({
            url: "sendIDs",
            data: params,
            dataType: "json",
            type: "post",
            success:function(result)
            {
                location.href="main";
            }, //success end
            error: function(request, status, error) {
                console.log(error);
            } // error end
        }); //ajax end
    }); //table send_btn click end

    $("#cancelImg").on("click", function(){
        $(".popup2").remove();
        $(".bg").remove();
        location.href="main";
    }); //yesBtn click end
}
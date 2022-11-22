function resetPW() //비밀번호 조건이 안맞을 때 초기화
{
    $("#inputPW").val("");
    $("#inputRePW").val("");
    $("#inputPW").focus();
}
function resetPW2() //팝업에 비밀번호 조건이 안맞을 때 초기화
{
    $("#inputPWOnPopup").val("");
    $("#inputRePWOnPopup").val("");
    $("#inputPWOnPopup").focus();
}

function findPWPopup(MEM_NO)
{
    var html = "";
    var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
    var pattern3 = /[~!@\#$%<>^&*]/;

    html += "<div class=\"popup2\">";
    html += "	<div class=\"popup_entity_txt\">[비밀번호변경]</div>";
    html += "    <div class=\"btn_list\">";
    html += "			<div class=\"title2\">비밀번호</div>";
    html += "			<input type=\"password\" id=\"inputPWOnPopup\" placeholder=\"8~32자리 특수문자포함 입력해주세요\" minlength=\"8\" maxlength=\"32\"/>";
    html += "			<div class=\"title2\">비밀번호 재확인</div>";
    html += "		    <input type=\"password\" id=\"inputRePWOnPopup\" placeholder=\"비밀번호를 재입력 해주세요.\"  minlength=\"8\" maxlength=\"32\"/>";
    html += "       <div id=\"yesBtn2\">확인</div>";
    html += "       <img src=\"./resources/images/cancel.png\" id=\"cancelImg\"/>";
    html += "    </div>";
    html += "</div>";
    html += "<div class=\"bg2\"></div>";

    $("body").append(html);

    $("#cancelImg").on("click", function(){
        $(".popup2").remove();
        $(".bg2").remove();
    }); //cancelImg click end

    $("#yesBtn2").on("click", function(){
        if($.trim($("#inputPWOnPopup").val()) == "")
        {
            popupText = "비밀번호를 입력하세요.";
            commonPopup(popupText);
            $("#inputPWOnPopup").focus();
        }
        else if($.trim($("#inputRePWOnPopup").val()) == "")
        {
            popupText = "비밀번호 재확인을 입력하세요.";
            commonPopup(popupText);
            $("#inputRePWOnPopup").focus();
        }
        else if($("#inputPWOnPopup").val() != $("#inputRePWOnPopup").val())
        {
            popupText = "비밀번호가 서로 일치하지 않습니다.";
            commonPopup(popupText);
            resetPW2();
        }
        else if($("#inputPWOnPopup").val().length < 8) //minlength가 안먹을경우를 대비한 8글자 미만 비밀번호 거르기
        {
            popupText = "비밀번호를 8~32자리로 해주세요.";
            commonPopup(popupText);
            resetPW2();
        }
        else if(!pattern1.test($("#inputPWOnPopup").val())||!pattern2.test($("#inputPWOnPopup").val())||!pattern3.test($("#inputPWOnPopup").val()))
        {
            popupText = "숫자/영문/특수문자를 조합하세요.";
            commonPopup(popupText);
            resetPW2();
        }
        else
        {
            $("#MEM_NO").val(MEM_NO);
            $("#PW").val($("#inputPWOnPopup").val());

            var params = $("#infoForm2").serialize();

            $.ajax({
                url: "updateInputPWs",
                data: params,
                dataType:"json",
                type: "post",
                success:function(result)
                {
                    if(result.msg == "success")
                    {
                        location.href="main";
                    }
                    else if(result.msg == "failed")
                    {
                        popupText = "변경에 실패하였습니다.";
                        commonPopup(popupText);
                    }
                    else
                    {
                        popupText = "변경중 에러가 발생했습니다.";
                        commonPopup(popupText);
                    }
                }, //success end
                error: function(request, status, error) {
                    console.log(error);
                } // error end
            }); //ajax end
        } //if ~ else end
    }); //yesBtn click end
}
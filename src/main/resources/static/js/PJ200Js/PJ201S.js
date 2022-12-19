/**
 * function checkEmptyComponent()
 *
 * @author 이 인복
 * @date 2022-12-20
 * @param obj
 * @return {boolean}
 * @decs 컴포넌트(배열에 저장된 이름)에 value 값이 빈 값인지 확인하는 함수
 */
function checkEmptyComponent(){
    const nameList = [ "inp_name" , "inp_id"   ,  "inp_pw"   , "inp_re_pw"
                     , "inp_phone", "inp_email", "inp_domain", "inp_keyword"];
    const msgList = [ "이름을 입력하세요."   , "아이디를 입력하세요.", "비밀번호를 입력하세요."  , "비밀번호 재확인을 입력하세요."
                    , "전화번호를 입력하세요.", "이메일을 입력하세요.", "이메일 주소를 입력하세요.", "키워드를 입력하세요."];

    for(let idx = 0; idx < nameList.length; idx++){
        if(trim(nameList[idx]) == "") {
            commonPopup(msgList[idx]);
            $("#" + nameList[idx]).focus();
            return true;
        }
    }
    return false;
}

/**
 * function checkEmptyComponent()
 *
 * @author 이 인복
 * @date 2022-12-20
 * @param obj
 * @return {boolean}
 * @decs 회원가입에 필요한 조건들을 확인하는 함수
 */
/*
[ 추가로 필요한 사항들 ]
- 이메일 인증 여부(이메일 보내는거 아직 미구현)
*/

function checkAllConditionForJoin(){
    if(checkEmptyComponent()){
        return false;
    }

    if(  isExitSpeChar("inp_name", "이름에 특수문자 사용 불가능합니다.")
      || isExitEngChar("inp_name", "이름에 영어 사용 불가능합니다.")
      || isExitNumChar("inp_name", "이름에 숫자 사용 불가능합니다.")){
        return false;
    }

    if(  !isExitSpeChar("inp_pw", "")
      || !isExitEngChar("inp_pw", "")
      || !isExitNumChar("inp_pw", "")){
        commonPopup("숫자/영문/특수문자를 조합하세요.");
        return false;
    }

    if(  isSelectBoxZeroIndex("sel_year"   , "년도를 입력하세요.")
      || isSelectBoxZeroIndex("sel_month"  , "월을 입력하세요.")
      || isSelectBoxZeroIndex("sel_day"    , "날짜를 입력하세요.")
      || isSelectBoxZeroIndex("sel_telcom" , "통신사를 선택하세요.")
      || isSelectBoxZeroIndex("sel_keyword", "키워드를 선택 하세요.")){
        return false;
    }

    if(  $("#inp_id").val() != $("#form_id").val()
      || $("#form_idDupChkYn").val() == "N"){
        commonPopup("아이디 중복 확인을 해주세요.");
        return false;
    }

    if($("#inp_pw").val() != $("#inp_re_pw").val()){
        commonPopup("비밀번호가 일치하지 않습니다.");
        return false;
    }

    if(isRadioZeroIndex("rad_name_sex", "성별을 선택하세요.")){
        return false;
    }

    if(8 > getLength("inp_pw") || getLength("inp_pw") > 32){
        commonPopup("비밀번호를 8~32자리로 해주세요.");
        return false;
    }

    if(getLength("inp_phone" != 8)){
        commonPopup("8자리를 입력하세요");
        return false;
    }

    if(isSpecificWord("inp_id", "-", "-를 제외하고 입력하세요.")){
        return false;
    }

    return true;
}



/**
 * function: checkEmptyComponent
 * @Desc 빈칸인 컴포넌트가 있는지 확인 해주는 함수 (true: 비어있음 / false: 기입되어있음)
 * @returns {boolean}
 */
function checkEmptyComponent(){
    const nameList = [ "inp_name" , "inp_id"   ,  "inp_pw"    , "inp_re_pw"
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



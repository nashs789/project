/**
 * function trim()
 *
 * @author 이 인복
 * @date 2022-11-29
 * @param obj
 * @return value
 * @decs 값(value)를 가지고 있는 컴포넌트에서 값을 trim해서 리턴
 */
function trim(objName){
    return $.trim($("#" + objName).val());
}

/**
 * function isEmpty()
 *
 * @author: 이 인복
 * @date: 2022-12-14
 * @param obj
 * @param msg
 * @returns {boolean}
 * @decs 컴포넌트의 value 값을 확인하여 빈 값일 떄 팝업창 + 포커스
 */
function isEmpty(objName, msg){
    if(!trim(objName)){
        commonPopup(msg);
        $("#" + objName).focus();
        return true;
    }
    return false;
}

function isUndefined(){

}

// ====================================================
// 정규식

var regNum = /[0-9]/;
var regEng = /[a-zA-Z]/;
var regSpeCh = /[~!@\#$%<>^&*]/;

/**
 * function isExitSpeChar()
 *
 * @author: 이 인복
 * @date: 2022-12-16
 * @param obj
 * @param msg
 * @returns {boolean}
 */
function isExitSpeChar(objName, msg){
    if(regSpeCh.test(trim(objName))){
        commonPopup(msg);
        $("#" + objName).focus();
        return true;
    }
    return false;
}

/**
 * function isExitEngChar()
 *
 * @author: 이 인복
 * @date: 2022-12-19
 * @param obj
 * @param msg
 * @returns {boolean}
 */
function isExitEngChar(objName, msg){
    if(regEng.test(trim(objName))){
        commonPopup(msg);
        $("#" + objName).focus();
        return true;
    }
    return false;
}

/**
 * function isExitNumChar()
 *
 * @author: 이 인복
 * @date: 2022-12-19
 * @param obj
 * @param msg
 * @returns {boolean}
 */
function isExitNumChar(objName, msg){
    if(regNum.test(trim(objName))){
        commonPopup(msg);
        $("#" + objName).focus();
        return true;
    }
    return false;
}
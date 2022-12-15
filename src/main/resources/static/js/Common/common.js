/**
 * function trim()
 *
 * @author 이 인복
 * @date 2022-11-29
 * @param obj
 * @return value
 * @decs 값(value)를 가지고 있는 컴포넌트에서 값을 trim해서 리턴
 */
function trim(obj){
    return $.trim(obj.val());
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
function isEmpty(obj, msg){
    if(!trim(obj)){
        commonPopup(msg);
        obj.focus();
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
 *
 * @param obj
 * @param msg
 * @returns {boolean}
 */
function isExitSpeChar(obj, msg){
    if(regSpeCh.test(trim(obj))){
        commonPopup(msg);
        obj.focus();
        return true;
    }
    return false;
}
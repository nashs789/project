/**
 * function trim()
 *
 * author: 이 인복
 * date: 2022-11-29
 * param: obj
 * return: 값을 trim한 값
 * decs: 값(value)를 가지고 있는 컴포넌트에서 값을 trim해서 리턴
 */
function trim(obj){
    return $.trim(obj.val());
}

/**
 *
 * @param obj
 * @returns {boolean}
 */
function isEmpty(obj){
    if(trim(obj) == ""){
        obj.focus();
        return true;
    }
    return false;
}

/**
 *
 * @param obj
 * @param msg
 * @returns {boolean}
 */
function isEmpty(obj, msg){
    if(trim(obj) == ""){
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

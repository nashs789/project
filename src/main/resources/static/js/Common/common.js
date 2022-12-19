/**
 * function trim()
 *
 * @author 이 인복
 * @date 2022-11-29
 * @param obj
 * @return value
 * @decs 값(value)를 가지고 있는 컴포넌트에서 값을 trim 해서 리턴
 */
function trim(objName){
    return $.trim($("#" + objName).val());
}

/**
 * function getLength()
 *
 * @author 이 인복
 * @date 2022-12-20
 * @param obj
 * @return value
 * @decs 컴포넌트가 가진 value 값의 길이를 리턴해주는 함수
 */
function getLength(objName){
    return $("#" + objName).val().length;
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
        openPopupAndFocus(objName, msg);
        return true;
    }
    return false;
}

/**
 * function isZeroIndex()
 *
 * @author 이 인복
 * @date 2022-12-20
 * @param obj
 * @return {boolean}
 * @decs selectBox의 인덱스가 0인지 판단하는 함수
 */
function isSelectBoxZeroIndex(objName, msg){
    if($("#" + objName).val() == 0){
        openPopupAndFocus(objName, msg);
        return true;
    }
    return false;
}

/**
 * function isRadioZeroIndex()
 *
 * @author 이 인복
 * @date 2022-12-20
 * @param obj
 * @decs 라디오 박스의 선택을 하지 않은 경우 (= 인덱스가 0)를 체크하는 함수
 */
function isRadioZeroIndex(objName, msg){
    let compName = ":radio[name=\"" + objName + "\"]:checked";

    if($(compName).val() == 0){
        commonPopup(msg);
        $(compName).focus();
        return true;
    }
    return false;
}

/**
 * function openPopupAndFocus()
 *
 * @author 이 인복
 * @date 2022-12-20
 * @param obj
 * @decs 팝업 호출과 해당 컴포넌트 포커스 함수
 */
function openPopupAndFocus(objName, msg){
    commonPopup(msg);
    $("#" + objName).focus();
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
 * @decs 문자열에 특수 문자가 포함되어 있는지 확인한 후 특수문자가 있다면
 *       팝업창 호출과 포커스 해주는 함수
 */
function isExitSpeChar(objName, msg){
    if(regSpeCh.test(trim(objName))){
        openPopupAndFocus(objName, msg);
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
 * @decs 문자열에 영문자가 포함되어 있는지 확인한 후 영문자가 있다면
 *       팝업창 호출과 포커스 해주는 함수
 */
function isExitEngChar(objName, msg){
    if(regEng.test(trim(objName))){
        openPopupAndFocus(objName, msg);
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
 * @decs 문자열에 숫자가 포자되어 있는지 확인한 후 숫자가 있다면
 *       팝업창 호출과 포커스 해주는 함수
 */
function isExitNumChar(objName, msg){
    if(regNum.test(trim(objName))){
        if(msg != ""){
            openPopupAndFocus(objName, msg);
        }
        return true;
    }
    return false;
}

/**
 * function isSpecificWord()
 *
 * @author: 이 인복
 * @date: 2022-12-20
 * @param obj
 * @param msg
 * @returns {boolean}
 * @decs 문자열에 특정 단어가 포자되어 있는지 확인한 후 특정 단어가 있다면
 *       팝업창 호출과 포커스 해주는 함수
 */
function isSpecificWord(objName, reg, msg){
    if(trim(objName).indexOf(reg) != -1){
        openPopupAndFocus(objName, msg);
        return true;
    }
    return false;
}

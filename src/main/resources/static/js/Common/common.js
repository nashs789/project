/**
 * function trim(objName)
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
 * function getLength(objName)
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
 * function isEmpty(objName, msg){
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
 * function isSelectBoxZeroIndex(objName, msg)
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
 * function isRadioZeroIndex(objName, msg)
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
 * function openPopupAndFocus(objName, msg)
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

/**
 * function serializeToJson(objName)
 *
 * @author 이 인복
 * @date 2022-12-21
 * @param objName
 * @returns {Window.jQuery|*}
 * @decs form 태그를 json 타입으로 파싱하는 함수
 */
function serializeToJson(objName){
    return $("#" + objName).serializeObject();
}

/**
 * function getMonthAndDayWithZero(objName)
 *
 * @author 이 인복
 * @date 2022-01-03
 * @param objName
 * @returns {Window.jQuery|*}
 * @decs 달, 일이 한자리 수 인경우 두 자리로 변경 (1 -> 01)
 */
function getMonthAndDayWithZero(objName){
    let value = $("#" + objName).val();

    return value.length == 1 ? "0" + value : value;
}

/**
 * function setValue(objName)
 *
 * @author 이 인복
 * @date 2022-01-04
 * @param objName
 * @param value
 * @decs 컴포넌트에 값 세팅
 */
function setCompInpValue(objName, value){
    $("#" + objName).val(value);
}

function setCompRadValue(objName, value){
    $(":radio[name=\'" + objName + "\'][value=\'" + value + "\']").attr("checked", true);
}

// ====================================================
// 정규식

var regNum = /[0-9]/;
var regEng = /[a-zA-Z]/;
var regSpeCh = /[~!@\#$%<>^&*]/;

/**
 * function isExitSpeChar(objName, msg)
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
        if(msg != ""){
            openPopupAndFocus(objName, msg);
        }
        return true;
    }
    return false;
}

/**
 * function isExitEngChar(objName, msg)
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
        if(msg != ""){
            openPopupAndFocus(objName, msg);
        }
        return true;
    }
    return false;
}

/**
 * function isExitNumChar(objName, msg)
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
 * function isSpecificWord(objName, reg, msg)
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

// 배껴온거임
// serializeArray -> array -> json
jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }//if ( arr ) {
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }

    return obj;
};

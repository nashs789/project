function sendData(urlName, params){

    console.log("urlName = " + urlName);
    console.log("params = " + JSON.stringify(params));

    $.ajax({
        url: urlName
        , type: "get" // GET, PUT, POST
        , async: false // false: 동기, true: 비동기
        //, dataType: "json" // xml, json, script, html
        , contentType: "application/json; charset=utf-8"
        , data: params
        // beforeSend: function() 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
        // complete: function() // 성공 실패 상관없이 완료될경우
        , success: function(result) {
            console.log(result);
        } // callback success end
        , error: function(request, status, error) {
            console.log(request);
            console.log(status);
            console.log(error);
            console.log("request error end");
            return false;
        } // callback error end
    });
}

function sendServer(urlName, params, callback){
    console.log("params = " + params);
    console.log("urlName = " + urlName);
    console.log("jsonParams = " + JSON.stringify(params));

    $.ajax({
             url: urlName
           , type: "post"
           , dataType: "json"
           , contentType: "application/json; charset=utf-8"
           , data: JSON.stringify(params)
           , success: function(result) {
                return callback(result);
           } // callback success end
           , error: function(request, status, error) {
                return false;
           } // callback error end
    });
} // function callServer

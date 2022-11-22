function callServer(urlName, params){
    // var params = $("#regionForm").serialize();

    $.ajax({
             url: urlName
           , type: "post"
           , dataType: "json"
           , contentType: "application/json; charset=utf-8"
           , data: JSON.stringify(params)
           , success: function(result) {
                console.log("ok");

                return true;
           } // callback success end
           , error: function(request, status, error) {
                console.log(request);
                console.log(status);
                console.log(error);

                return false;
           } // callback error end
    });
} // function callServer
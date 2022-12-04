function redrawCmt(res) {
    var html = "";

    html = "<p class=\"admin_text_areas\">" + res.cmt_contents + "</p>"

    $(".admin_text_area").html(html);
}
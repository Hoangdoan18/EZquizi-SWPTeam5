$(function () {
    $("#register-box").show();    
  $("#forgot-link").click(function () {
    $("#login-box").hide();
    $("#register-box").hide();    
    $("#forgot-box").show();
  });
  $("#back-link").click(function () {
    $("#login-box").show();
    $("#register-box").hide();    
    $("#forgot-box").hide();
  });
});
$('#test').click(function() {
    var s = $(this);
    $('#extra').slideToggle('fast', function(){
        s.html(s.text() == 'Subscribe' ? 'Subscribed' : 'Subscribe');
    });
    return false;
});
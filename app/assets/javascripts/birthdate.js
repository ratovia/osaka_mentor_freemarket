$(function(){
  var time = new Date();
  var year = time.getFullYear();
  for (var i = year; i >= 1900; i--) {
    $('#year').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 12; i++) {
    $('#month').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 31; i++) {
    $('#day').append('<option value="' + i + '">' + i + '</option>');
  }

  $(".birthdate__box").change(function(){
    var year = $('#year option:selected').val();
    var month = $('#month option:selected').val();
    var day = $('#day option:selected').val();
    $('#birth_hidden').val(year * 10000 + month * 100 + day * 1);
  });
  var clearCall = function(response) {
    if(response != ""){
      $('.next_page_buttom').removeAttr('disabled');
    }
  }
  window.clearCall = clearCall;
});
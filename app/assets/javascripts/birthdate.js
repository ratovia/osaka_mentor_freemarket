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
})
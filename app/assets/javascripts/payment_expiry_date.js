$(function(){

  for (var i = 1; i <= 12; i++) {
    var ret = ( '00' + i ).slice( -2 );
    $('#expiry_month').append('<option value="' + i + '">' + ret + '</option>');
  }
  for (var i = 19; i <= 29; i++) {
    $('#expiry_year').append('<option value="' + i + '">' + i + '</option>');
  }

  $('.payment_description').on('click', function(){
    if ($('.credit_back_img').css('display') === 'none'){
      $('.credit_back_img').css('display', 'block');
    } else {
      $('.credit_back_img').css('display', 'none');
    }
  });

  $(document).on('click', function(e){
    if (!$(e.target).closest('.payment_description').length) {
      $('.credit_back_img').css('display', 'none');
    }
  });
});
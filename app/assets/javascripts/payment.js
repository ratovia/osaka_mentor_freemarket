$(function(){

  $(".payment_form").ready(function(){
    let date = new Date();
    let year = date.getFullYear();
    for (var i = 1; i <= 12; i++) {
      $('#credit_month').append('<option value="' + i + '">' + ('00' + i).slice(-2) + '</option>');
    }
    for (var i = year; i <= year + 10; i++) {
      $('#credit_year').append('<option value="' + i + '">' + String(i).slice(-2) + '</option>');
    }
  })

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

  $(".payment_submit").click(function(e){
    e.preventDefault();
    $(this).prop("disabled", true);
    Payjp.setPublicKey("pk_test_68441a355852291c0d9d6074");
    var card = {
      number: Number($(".credit_number_input").val()),
      cvc: Number($(".security_input").val()),
      exp_month: Number($("#credit_month").val()),
      exp_year: Number($('#credit_year').val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        $(".credit_number_input").removeAttr("name");
        $(".security_input").removeAttr("name");
        $("#credit_month").removeAttr("name");
        $('#credit_year').removeAttr("name");

        var token = response.id;
        $(".payment_form").append($('<input type="hidden" name="token" class="payment_token" />').val(token));
        $(".payment_form")[0].submit();
      } else {
        alert("クレジットカード認証に失敗しました。\n" + response.error.message);
        $(".payment_submit").prop("disabled", false);
      };
    });
  })
});
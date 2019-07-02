$(function () {

  $('#category1').change(function(){
    var categorySelect1 = $(this).prop('selectedIndex');

    if (categorySelect1 !== 0) {
      $('.category2').css('display', 'block');
    } else {
      $('.category2').css('display', 'none');
      $('.category3').css('display', 'none');
    }
  });
  $('#category2').change(function(){
    var categorySelect2 = $(this).prop('selectedIndex');
    if (categorySelect2 !== 0) {
      $('.category3').css('display', 'block');
    } else {
      $('.category3').css('display', 'none');
    }
  });
  $('#category3').change(function(){
    var categorySelect3 = $(this).prop('selectedIndex');
    var categorySelect1 = $('#category1').prop('selectedIndex');
    if (categorySelect3 !== 0 && categorySelect1 <= 3
      ) {
      $('#select_size').css('display', 'block');
    } else {
      $('#select_size').css('display', 'none');
    }
  });

  $('#delivery_burden').change(function () {
    var delivarySelect = $(this).prop('selectedIndex');

    if (delivarySelect === 0) {
      $('.delivery_method_select_label').css('display', 'none');
      $('.delivery_method_select').css('display', 'none');
    } else if (delivarySelect === 1) {
      $('.delivery_method_select_label').css('display', 'block');
      $('.delivery_method_select').css('display', 'block');

      $('#delivery_method').html(`
        <option value="0">---</option>
        <option value="1">未定</option>
        <option value="2">クロネコヤマト</option>
        <option value="3">ゆうパック</option>
        <option value="4">ゆうメール</option>`);
    } else if (delivarySelect === 2) {
      $('.delivery_method_select_label').css('display', 'block');
      $('.delivery_method_select').css('display', 'block');

      $('#delivery_method').html(`
        <option value="0">---</option>
        <option value="1"> 未定 </option>
        <option value="2">らくらくメルカリ</option>
        <option value="3">ゆうメール</option>
        <option value="4"> レターパック</option>
        <option value="5"> 普通郵便(定型、定形外）</option>
        <option value="6"> クロネコヤマ</option>
        <option value="7"> ゆうパック</option>
        <option value="8"> クリックポス</option>
        <option value="9"> ゆうパケット</option>
        `);
    }
  });
  $('#price').on('keyup', function () {

    var inputPrice = $(this).val();
    if (inputPrice.match(/\d+/)) {
      if (inputPrice >= 300 && inputPrice <= 9999999) {
        var salesFee = Math.floor(inputPrice / 10);
        var salesBenefit = inputPrice - salesFee;
        $('.sales_fee__computed').text('¥' + salesFee);
        $('.sales_benefit__computed').text('¥' + salesBenefit);
      } else {
        $('.sales_fee__computed').text('-');
        $('.sales_benefit__computed').text('-');
      }
    } else {
        return;
    }
    });
});
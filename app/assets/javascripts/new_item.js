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

  $('#item_delivery_burden').change(function () {
    var delivarySelect = $(this).prop('selectedIndex');

    if (delivarySelect === 0) {
      $('.delivery_method_select_label').css('display', 'none');
      $('.delivery_method_select').css('display', 'none');
    } else if (delivarySelect === 1) {
      $('.delivery_method_select_label').css('display', 'block');
      $('.delivery_method_select').css('display', 'block');
      
      $('#item_delivery_method').html(`
      <option value="">---</option>
      <option value="未定"> 未定 </option>
      <option value="らくらくメルカリ便">らくらくメルカリ便</option>
      <option value="ゆうメール">ゆうメール</option>
      <option value="レターパック"> レターパック</option>
      <option value="普通郵便(定型、定形外"> 普通郵便(定型、定形外）</option>
      <option value="クロネコヤマ"> クロネコヤマ</option>
      <option value="ゆうパック"> ゆうパック</option>
      <option value="クリックポスト"> クリックポスト</option>
      <option value="ゆうパケット"> ゆうパケット</option>
        `);
    } else if (delivarySelect === 2) {
      $('.delivery_method_select_label').css('display', 'block');
      $('.delivery_method_select').css('display', 'block');

      $('#item_delivery_method').html(`
        <option value="">---</option>
        <option value="未定">未定</option>
        <option value="クロネコヤマト">クロネコヤマト</option>
        <option value="ゆうパック">ゆうパック</option>
        <option value="ゆうメール">ゆうメール</option>
        `);
    }
  });
  

  $('#price').on('keyup', function () {

    var inputPrice = $(this).val();
    if (inputPrice.match(/\d+/)) {
      if (inputPrice >= 300 && inputPrice <= 9999999) {
        var salesFee = Math.floor(inputPrice / 10);
        var salesBenefit = inputPrice - salesFee;
        $('.sales_fee__computed').text('¥' + String(salesFee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        $('.sales_benefit__computed').text('¥' + String(salesBenefit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
      } else {
        $('.sales_fee__computed').text('-');
        $('.sales_benefit__computed').text('-');
      }
    } else {
        return;
    }
    });
});
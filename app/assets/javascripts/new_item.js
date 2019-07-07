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
      <option value="---">---</option>
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
        <option value="---">---</option>
        <option value="未定">未定</option>
        <option value="クロネコヤマト">クロネコヤマト</option>
        <option value="ゆうパック">ゆうパック</option>
        <option value="ゆうメール">ゆうメール</option>
        `);
    }
  });
  var i = 1;
  $('#upload_file').change(function(e){
    
    var reader = new FileReader();
    reader.onload = function(e){
      $('.new_item_page_container_main_item_image_area').append(`
      <div class="select_image" data-id=${i}>
        <img src=${e.target.result} id="image_preview">
        <p><a href="">編集</a></p>
        <p><a class="remove_image">削除</a></p>
      </div>
      `);
      $('.image_file_area').css('width', `calc(100% - ${i * 20}% + 120px)`);
      if (i === 6) {
        $('.image_file_area').css('display', 'none');
      }
    }
    reader.readAsDataURL(e.target.files[0]);
    $(`.item_image_url${i}`).val(e.target.files[0].name);
    i++;
  });
  $('body').on('click', '.remove_image', function () {
    $(this).closest('.select_image').remove();
    var width = $('.image_file_area').css('width');
    $('.image_file_area').css('width', `calc(${width} + 20%)`);
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
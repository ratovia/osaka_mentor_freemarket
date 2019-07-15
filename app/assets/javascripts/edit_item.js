$(function () {

  //商品削除時の警告
  $('.preview_page_box__destroy').on('click', function () {
    var confirm = window.confirm('本当に削除しますか？');
    if (!confirm) {
      return false;
    }
  });

  //商品編集時の手数料、利益をデフォルトで表示
  var price = $('.edit_item').val();
  var salesFee = Math.floor(price / 10);
  var salesBenefit = price - salesFee;
  $('.edit_page_fee').text('¥' + String(salesFee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
  $('.edit_page_benefit').text('¥' + String(salesBenefit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));


  var imagesLength = $('.select_image').length;
  $('.image_file_area').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
  
  $('.edit_image_remove').on('click', function () {
   var num = $(this).closest('.select_image').data('number')
   console.log(num);
   $('.image_file_area:first').append(`
   <input multiple="multiple" value=${num} type="hidden" name="item[remove_image][]" id="item_remove_image">
   `)
 })
});
$(function () {
  $('.preview_page_box__destroy').on('click', function () {
    var confirm = window.confirm('本当に削除しますか？');
    if (!confirm) {
      return false;
    }
  });
  var price = $('.edit_item').val();
  var salesFee = Math.floor(price / 10);
  var salesBenefit = price - salesFee;
  $('.edit_page_fee').text('¥' + String(salesFee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
  $('.edit_page_benefit').text('¥' + String(salesBenefit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
});
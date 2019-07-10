$(function () {
  $('.small_image').on('mouseover', function () {
    currentSrc = $(this).attr('src');
    $('#big_image').attr('src', currentSrc);
    $('.small_image').css('opacity', '0.5');
    $(this).css('opacity', '1');
  });
  var price = $('.main_price__display').text();
  $('.new_item__text_area--price_display').each(function (index, element) {
    var itemPrice = $(element).text();
    $(element).text('¥' + String(itemPrice).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
  })
  
  $('.main_price__display').text('¥' + String(price).replace(/\B(?=(\d{3})+(?!\d))/g, ','));

});
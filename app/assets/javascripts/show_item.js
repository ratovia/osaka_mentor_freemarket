$(function () {
  $('.small_image').on('mouseover', function () {
    currentSrc = $(this).attr('src');
    $('#big_image').attr('src', currentSrc);
    $('.small_image').css('opacity', '0.5');
    $(this).css('opacity', '1');
  });
  var price = $('.main_price__display').text();
  $('.main_price__displa').text('¥' + String(price).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
console.log(price);


});
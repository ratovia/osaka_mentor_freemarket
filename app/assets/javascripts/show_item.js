$(function () {
  $('.small_image').on('mouseover', function () {
    currentSrc = $(this).attr('src');
    $('#big_image').attr('src', currentSrc);
  });
});
$(function () {
  $('.preview_page_box__destroy').on('click', function () {
    var confirm = window.confirm('本当に削除しますか？');
    if (!confirm) {
      return false;
    }
  })
});
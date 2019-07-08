$(function () {
  var i = 1;
  files = [];
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
      var width = $('.image_file_area').css('width');
      $('.image_file_area').css('width', `calc(${width} - 20% + 80px)`);
      
    }
    reader.readAsDataURL(e.target.files[0]);
    files.push(e.target.files[0].name);
    
    $('.item_images_hidden').val(files);
    var filesArray = $('.item_images_hidden').val().split(',');
    
      if ( filesArray.length > 4) {
        $('.image_file_area').css('display', 'none');
      }
    i++;
  });
  $('body').on('click', '.remove_image', function () {
    $(this).closest('.select_image').remove();
    var width = $('.image_file_area').css('width');
    $('.image_file_area').css('display', 'block');
    $('.image_file_area').css('width', `calc(${width} + 20%)`);
  });



});
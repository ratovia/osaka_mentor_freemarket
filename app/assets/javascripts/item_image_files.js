$(function () {
  var i = 1;
  $('#upload_file').change(function(e){
    var filesArray = $('.item_images_hidden').val().split(',');
    if (filesArray[0] === "") {
      filesArray.splice(0, 1);
    }
    var reader = new FileReader();
    var url = e.target.files[0].name;
    reader.onload = function(e){
      $('.new_item_page_container_main_item_image_area').prepend(`
      <div class="select_image" data-url=${url}>
        <img src=${e.target.result} id="image_preview">
        <p><a href="">編集</a></p>
        <p><a class="remove_image">削除</a></p>
      </div>
      `);
      var width = $('.image_file_area').css('width');
      $('.image_file_area').css('width', `calc(${width} - 20% + 80px)`);
    }
    reader.readAsDataURL(e.target.files[0]);
    
    $('.image_file_area').prepend(`<input multiple="multiple" id="upload_file" accept="image/png, image/jpeg, image/gif" type="file" name="item[images][${i}]">`);
    console.log($('#upload_file').attr('name'));
    // $('.images').files.push(url);
    
    filesArray.push(url);
    
    $('.item_images_hidden').val(filesArray);
    console.log(filesArray);
    
    var filesArray = $('.item_images_hidden').val().split(',');
      if ( filesArray.length > 4) {
        $('.image_file_area').css('width', '100%');
      }
      i++;
  });



  $('body').on('click', '.remove_image', function () {
    var filesArray = $('.item_images_hidden').val().split(',');
    var url = $(this).closest('.select_image').data('url');
    $.each(filesArray, function (index, file) {
      if(url === file){
        filesArray.splice(index, 1);
      };
      $('.item_images_hidden').val(filesArray);
    });
    
    $(this).closest('.select_image').remove();
    var width = $('.image_file_area').css('width');
    $('.image_file_area').css('display', 'block');
    $('.image_file_area').css('width', `calc(${width} + 20%)`);
  });
});
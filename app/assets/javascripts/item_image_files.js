$(function () {
  var id = 1;
  $('body').on('change', '#upload_file', function(e){
    var filesArray = $('.item_images_hidden').val().split(',');
    var target = e.target;
    if (filesArray[0] === "") {
      filesArray.splice(0, 1);
    }
    var reader = new FileReader();
    
    reader.onload = function(e){
      $(target).closest('.prepend_area').prepend(`
        <div class="select_image" data-id=${id - 1}>
          <img src=${e.target.result} id="image_preview">
          <p><a href="">編集</a></p>
          <p><a class="remove_image">削除</a></p>
        </div>
      `);
      var width = $(target).closest('.image_file_area').css('width');
      $(target).closest('.image_file_area').css('width', `calc(${width} - 20% + 80px)`);
    }
    reader.readAsDataURL(target.files[0]);
    
    $(target).closest('.image_file_area').prepend(`<input multiple="multiple" id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]" data-id="${id + 1}">`);
    $(target).css('width', '0px');

    filesArray.push(id);
    $('.item_images_hidden').val(filesArray);
    
    var filesArray = $('.item_images_hidden').val().split(',');
    switch (filesArray.length) {
      case 5: $(target).closest('.image_file_area').css('display', 'none');
              $('.under_area .image_file_area').css('display', 'block');
              $('.under_area .image_file_area').css('width', '100%');
              $('.under_area .image_file_area').prepend(`<input multiple="multiple" id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]" data-id="${id + 1}">`);
        break;
      case 10: $(target).closest('.image_file_area').css('display', 'none');     
        break;
    }
  id++;
  
  });

  $('body').on('click', '.remove_image', function () {
    var filesArray = $('.item_images_hidden').val().split(',');
    var id = $(this).closest('.select_image').data('id');

    // 選択されたidとfilesArrayの要素が一致すればfilesArrayから削除
    $.each(filesArray, function (index, file) {
      if(id === Number(file)){
        filesArray.splice(index, 1);
      };
      // .item_images_hiddenのval()を更新
      $('.item_images_hidden').val(filesArray);
    });


    // 選択されたidを持つinput[type="file"]を削除
    $('.upload_files').each(function (index, element) {
      if(!$(element).data('id')){
       return true;
      }     
      if($(element).data('id') === Number(id)) {
        $(element).remove();
      }
    });

    // .select_imageを削除
    $(this).closest('.select_image').remove();

    var filesArray = $('.item_images_hidden').val().split(',');
    // .image_file_areaの幅を調整
    if(filesArray.length < 5) {
      var width = $('.image_file_area:first').css('width');
      if (filesArray.length === 4) {
        var fileField = $('.under_area .upload_files');
        fileField.remove();
        $('.image_file_area:first').prepend(fileField);
      }
      $('.image_file_area:last').css('display', 'none');
      $('.image_file_area:first').css('display', 'block').css('width', `calc(${width} + 20%)`);
    } else {
      var width = $('.image_file_area:last').css('width');
      
      $('.image_file_area:last').css('display', 'block').css('width', `calc(${width} + 20%)`);
    }
    
  });
});
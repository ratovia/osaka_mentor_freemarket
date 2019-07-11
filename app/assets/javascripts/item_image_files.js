$(function () {
  $('body').on('change', '#upload_file', function(e){
    var filesArray = $('.item_images_hidden').val().split(',');
    var target = e.target;
    if (filesArray[0] === "") {
      filesArray.splice(0, 1);
    }
    var reader = new FileReader();
    var url = e.target.files[0].name;
    reader.onload = function(e){
      $(target).closest('.prepend_area').prepend(`
        <div class="select_image" data-url=${url}>
          <img src=${e.target.result} id="image_preview">
          <p><a href="">編集</a></p>
          <p><a class="remove_image">削除</a></p>
        </div>
      `);
      var width = $(target).closest('.image_file_area').css('width');
      $(target).closest('.image_file_area').css('width', `calc(${width} - 20% + 80px)`);
    }
    reader.readAsDataURL(target.files[0]);
    
    $(target).closest('.image_file_area').prepend(`<input multiple="multiple" id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]">`);
    $(target).css('width', '0px');

    filesArray.push(url);
    $('.item_images_hidden').val(filesArray);
    
    var filesArray = $('.item_images_hidden').val().split(',');
    switch (filesArray.length) {
      case 5: $(target).closest('.image_file_area').css('display', 'none');
              $('.under_area .image_file_area').css('display', 'block');
              $('.under_area .image_file_area').css('width', '100%');       
        break;
      case 10: $(target).closest('.image_file_area').css('display', 'none');     
        break;
    }
  });

  $('body').on('click', '.remove_image', function () {
    var filesArray = $('.item_images_hidden').val().split(',');
    var url = $(this).closest('.select_image').data('url');

    // 選択されたurlとfilesArrayの要素が一致すればfilesArrayから削除
    $.each(filesArray, function (index, file) {
      if(url === file){
        filesArray.splice(index, 1);
      };
      // .item_images_hiddenのval()を更新
      $('.item_images_hidden').val(filesArray);
      console.log(filesArray.length);
    });


    // 選択されたurlを持つinput[type="file"]を削除
    $('.upload_files').each(function (index, element) {
      if(!element.files[0]){
       return true;
      }     
      if(element.files[0].name === url) {
        $(element).remove();
      }
    });

    // .select_imageを削除
    $(this).closest('.select_image').remove();

    var filesArray = $('.item_images_hidden').val().split(',');
    // .image_file_areaの幅を調整
    if(filesArray.length < 6) {
      var width = $('.image_file_area:first').css('width');
      console.log('first');
      
      $('.image_file_area:first').css('display', 'block').css('width', `calc(${width} + 20%)`);
    } else {
      var width = $('.image_file_area:last').css('width');
      console.log('last');
      
      $('.image_file_area:last').css('display', 'block').css('width', `calc(${width} + 20%)`);
    }
  });
});
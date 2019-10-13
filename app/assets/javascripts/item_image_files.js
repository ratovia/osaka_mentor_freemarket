$(function(){
  if (window.location.href.match(/\/items\/new/)){
    // 灰色縮める関数
    function uploadAreaSizing(image_num){
      if(image_num == 10){
        $('.image_file_area').css('display', "none");
      }
      $('.image_file_area').css('display', "block").css('width', `calc(100% - ${20 * (image_num % 5) }%)`);
    }

    var image_num = 0;
    var select_image_id, prev_input;
    uploadAreaSizing(image_num);

    $(document).on('change', 'input[type="file"]', function(e) {
      // プレビュー関数
      function handleFiles(files,preview) {
        for (var i = 0; i < files.length; i++) {
          var file = files[i];
          var imageType = /image.*/;
          uploadAreaSizing(image_num + i);
          if (!file.type.match(imageType)) {
            continue;
          }
          var img = document.createElement("img");
          img.classList.add(`preview_image`);
          img.file = file;
          var select_box = $(`
            <div class="select_image">
              <div class="select_image_footer">
                <p><a class="edit-btn" href data-link-id="${image_num}">編集</a></p>
                <p><a class="remove-btn" href data-link-id="${image_num}">削除</a></p>
              </div>
            </div> 
          `).prepend(img);
          preview.prepend(select_box);
          var reader = new FileReader();
          reader.onload = (function(aImg) { return function(e) { aImg.src = e.target.result; }; })(img);
          reader.readAsDataURL(file);
        }
      }

      // inputを増やす
      function appendFileInput(image_num){
        var html = `<input multiple="multiple" id="upload_file" class="upload_files" data-id="${image_num}" type="file" name="item[images][]">`;
        $(".image_file_area").append(html);
      }

      var files = e.target.files;
      var preview = $(".top_area");
      image_num++;
      
      // 色々remove
      $(`[data-link-id='${select_image_id}']`).parents(".select_image").remove();
      $(`[data-id='${select_image_id}']`).remove();
      
      // プレビューする
      handleFiles(files,preview);
      // display noneでinput隠す
      prev_input = `[data-id='${image_num - 1}']`;
      $(prev_input).css("display","none");
      
      // 新しいinputだす
      appendFileInput(image_num);
    });

    $(document).on("click",".remove-btn",function(e){
      e.preventDefault();
      var item_id = $(this).data("link-id");
      $(`[data-id='${item_id}']`).remove();
      $(this).parents(".select_image").remove();
      $(prev_input).css("display","block");
      image_num--;
      uploadAreaSizing(image_num);
    });

    $(document).on("click",".edit-btn",function(e){
      e.preventDefault();
      // モーダル出す
      var item_id = $(this).data("link-id");
      $(`[data-id='${item_id}']`).click();
      select_image_id = item_id;
    });
  };
});
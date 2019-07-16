$(function(){

  function appendItem(item){
    if(item.buy_history){
      var html = `
                  <a class="one_item item_soldout__parent search_item" href="/items/${item.id}">
                    <div class="one_item__image_area item_soldout__children">
                      <img src="${window.location.origin}${item.image}">
                    </div>
                    <div class="one_item__text_area">
                      <div class="one_item__text_area--title">
                        ${item.name}
                      </div>
                      <div class="one_item__text_area--price">
                        ¥${item.price}
                        <span>
                          <i class="fa fa-heart-o"></i>
                          8
                        </span>
                      </div>
                    </div>
                  </a>
                  `
    }else{
      var html = `
                  <a class="one_item search_item" href="/items/${item.id}">
                    <div class="one_item__image_area">
                      <img src="${window.location.origin}${item.image}">
                    </div>
                    <div class="one_item__text_area">
                      <div class="one_item__text_area--title">
                        ${item.name}
                      </div>
                      <div class="one_item__text_area--price">
                        ¥${item.price}
                        <span>
                          <i class="fa fa-heart-o"></i>
                          8
                        </span>
                      </div>
                    </div>
                  </a>
                  `
    }
    $(".main_block__item").append(html);
  }

  $(".incremental").on("keyup",function(event){
    if(event.code === "Space"){
      return;
    }else{
      
      let input = $(this).val();
      $.ajax({
        method: "GET",
        url: "./incremental",
        data: { keyword: input },
        dataType: "json",
      }).done(function(data){
        $(".main_block__item").empty();
        if(data["keyword"] === ""){
          $(".main_block__text__keyword").text("無効な入力です。");
        } else if(data["hit_count"] === 0){
          $(".main_block__text__keyword").text("申し訳ありません！お探しの商品はありませんでした");
          $(".main_block__text__hit_count").text("0 件表示");
        } else {
          $(".main_block__text__keyword").text(data["keyword"] + " の検索結果");
          $(".main_block__text__hit_count").text(data["hit_count"] + " 件表示");
        }
        data["items"].forEach(function(item){
          appendItem(item)
        });
        if(event.key === "Backspace"){
          if(input === ""){
            $(".main_block__item").empty();
            $(".main_block__text__hit_count").text("0 件表示");
          }
        }
      }).fail(function(){
        alert("アイテム検索に失敗しました");
      });
    }
  });
})

$(function () {
  
  $('#delivery_burden').change(function () {
    var userSelect = $('#delivery_burden').val();
    
    if (userSelect === "---") {
      $('.delivery_method_select_label').css('display', 'none');
      $('.delivery_method_select').css('display', 'none');
    } else if (userSelect === "着払い(購入者負担)") {
        $('.delivery_method_select_label').css('display', 'block');
        $('.delivery_method_select').css('display', 'block');
       
        $('#delivery_method').html(`
        <option>---</option>
        <option>未定</option>
        <option>クロネコヤマト</option>
        <option>ゆうパック</option>
        <option>ゆうメール</option>`)
      } else if(userSelect === "送料込み(出品者負担)") {
        $('.delivery_method_select_label').css('display', 'block');
        $('.delivery_method_select').css('display', 'block');

        $('#delivery_method').html(`
              <option>---</option>
              <option> 未定 </option>
              <option>らくらくくメルカリ</option>
              <option>ゆうメール</option>
              <option> レターパック</option>
              <option> 普通郵便(定型、定形外）</option>
              <option> クロネコヤマ</option>
              <option> ゆうパック</option>
              <option> クリックポス</option>
              <option> ゆうパケット</option>
        `)
      }

});

});
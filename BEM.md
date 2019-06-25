# BEMの命名規則

## block__element
blockとelementの間は__(アンダーバー2つ)で繋ぎます。<br>
ex. class="header__title"

## block--modifire
blockとmodifireの間は--(ハイフン2つ)で繋ぎ、keyとvalueの間は-(ハイフン1つ)で繋ぎます。<br>
 - block--key-value<br>
 

## block__element--modifire
elementとmodifireの間は--(ハイフン2つ)で繋ぎ、keyとvalueの間は-(ハイフン1つ)で繋ぎます。<br>
 - block__element--key-value<br>
 ex. class="boxes__box--alert-big"<br>
     class="boxes__box--alert-small"<br>

## word1_word2
二つ以上の単語を使うときは_(アンダーバー1つ)で繋ぎます
<br>
ex. class="header_right"

## まとめ
class="items_list__item--select-current"

## ページ作成のルール
1. ページ全体をblockで囲う<br>
2. ページ内のblockにはページを囲うblockの名前を_(アンダーバー1つ)を使って継承する<br>
```
例
トップページ
<div class="top">
  <div class="top_header">
  </div>
</div>

userページ
<div class="user">
  <div class="user_header">
  </div>
</div>
```
## reference 
https://app.codegrid.net/entry/bem-basic-1
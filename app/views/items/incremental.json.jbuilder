json.set! :keyword, @keyword
json.set! :hit_count, @items.length

json.set! :items do
  json.array! @items do |item|
    json.id item.id
    json.name item.name
    json.price item.price
    json.description item.description
    json.buy_history item.buy_history.present?
    json.image url_for(item.images[0])
  end
end

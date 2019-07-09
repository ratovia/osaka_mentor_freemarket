class ItemsController < ApplicationController
  def index
    @item = Item.limit(4).order("id DESC")
  end
  
  def new
    @prefecture = Prefecture.all
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end
  
  private

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      :status,
      :delivery_burden,
      :delivery_method,
      :delivery_prefecture,
      :delivery_time,
      images: []
    )
  end
end

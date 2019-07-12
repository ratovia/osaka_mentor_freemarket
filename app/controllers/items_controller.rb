class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.limit(4).order("id DESC")
  end
  
  def new
    @prefectures = Prefecture.all
  end

  def edit
    @item = Item.find(parame[:id])
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
    @item = Item.find(params[:id])
  end

  def preview
    @item = Item.find(params[:id])
    @items = Item.where(user_id: current_user.id)
    # preview_item_path
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
      :size,
      images: []
    ).merge(user_id: current_user.id)
  end
end

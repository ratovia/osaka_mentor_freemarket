class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index,:create,:new,:edit,:update,:destory,:preview]

  def index
    @items = Item.limit(4).order("id DESC")
  end
  
  def new
    @prefectures = Prefecture.all
  end

  def edit
   @item = Item.find(params[:id])
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

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to root_path
  end

  def destory
    @item.destory if @item.user.id == current_user.id
  end

  def preview
    @item = Item.find(params[:id])
    @items = Item.where(user_id: current_user.id)
  end


  
  private

  def set_item
    @item = Item.find(params[:id])
  end

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

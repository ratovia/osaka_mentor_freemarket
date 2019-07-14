class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index,:create,:new]

  def index
    @items = Item.limit(4).order("id DESC")
  end
  
  def new
    @prefectures = Prefecture.all
    @item = Item.new
  end

  def edit
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
    @items = Item.limit(4).order("id DESC")
  end

  def update
    images = @item.images
    if @item.update(item_params)
      remove_images_params.map(&:to_i).each do |i|
        images[i].purge
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user.id == current_user.id
    redirect_to root_path
  end

  def preview
    @items = current_user.items
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

  def remove_images_params
    params.require(:item).permit(remove_images: [])
  end
end


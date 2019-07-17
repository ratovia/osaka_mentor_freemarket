class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index,:create,:new,:search,:incremental]

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
    if @item.update(
        name: item_params["name"],
        price: item_params["price"],
        description: item_params["description"],
        status: item_params["status"],
        delivery_burden: item_params["delivery_burden"],
        delivery_method: item_params["delivery_method"],
        delivery_prefecture: item_params["delivery_prefecture"],
        delivery_time: item_params["delivery_time"],
        user_id: item_params["user_id"],
        size: item_params["size"],
        )
      if item_params[:images].present?
        @item.update(images: item_params["images"])
      end
      if remove_images_params[:remove_images].present?
        if @item.images.length <= remove_images_params[:remove_images].length
          flash[:alert] = "商品情報を更新できませんでした"
          render :edit
          return false
        end
        remove_images_params[:remove_images].map(&:to_i).each do |i|
          images[i].purge
        end
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

  def search
    @keyword = keyword_params[:keyword]
    @items = Item.where('name LIKE(?)', "%#{@keyword}%")
  end

  def incremental
    @keyword = keyword_params[:keyword]
    @items = []
    @items.push(Item.where('name LIKE(?)', "%#{@keyword}%"))
    if @keyword.to_i > 0
      @items.push(Item.where('price = ?', @keyword.to_i))
      @items.push(Item.where('price < ? ', @keyword.to_i).where('price > ? ', @keyword.to_i * 0.9).limit(10))
    end
    @items.flatten!
    @items.uniq!
    respond_to do |format|
      format.json {}
    end 
  end
  private

  def keyword_params
    params.permit(:keyword)
  end

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
    ).merge(user_id: current_user.id).merge(images: images_params)
  end

  def images_params
    strong_param = params.require(:item).permit(images: [])
    strong_param[:images].each do |image|
      image.original_filename = URI.encode(image.original_filename)
    end
    strong_param[:images]
  end

  def remove_images_params
    params.require(:item).permit(remove_images: [])
  end
end


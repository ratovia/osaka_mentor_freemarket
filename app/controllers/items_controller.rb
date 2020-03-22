class ItemsController < ApplicationController
  before_action :set_item, except: %i[index create new search incremental ransack]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @latest_items = Item.limit(20).order("id DESC")
    @ladies = item_list(1)
    @mens = item_list(2)
  end

  def new
    @prefectures = Prefecture.all
    @item = Item.new
    @parent_categories = Category.where('id < 14')
    @child_categories = Category.where(category_id: params[:keyword])

    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    redirect_to item_path(@item) if current_user.id != @item.user.id
  end

  def create
    @item = Item.new(item_params)
    if item_params[:images].present? && @item.save
      flash[:notice] = "商品を出品しました！"
      redirect_to root_path
    else
      flash[:alert] = "商品を出品できませんでした"
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
      category_id: item_params["category_id"]
    )
      @item.update(images: item_params["images"]) if item_params[:images].present?
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
      flash[:notice] = "商品情報を更新しました！"
      redirect_to root_path
    else
      flash[:alert] = "商品情報を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user.id == current_user.id
    flash[:notice] = "商品を削除しました"
    redirect_to root_path
  end

  def preview
    @items = current_user.items
  end

  def search
    @keyword = keyword_params[:keyword]
    @items = Item.where('name LIKE(?)', "%#{@keyword}%")
    @q = Item.ransack(params[:q])
  end

  def ransack
    @keyword = params[:q].values[0]
    @q = Item.ransack(search_params)
    @items = @q.result.includes(:category)
    render :search
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
      :category_id
    ).merge(user_id: current_user.id).merge(images: images_params)
  end

  def images_params
    strong_param = params.require(:item).permit(images: [])
    if strong_param[:images].present?
      strong_param[:images].each do |image|
        image.original_filename = URI.encode(image.original_filename)
      end
    end
    strong_param[:images]
  end

  def remove_images_params
    params.require(:item).permit(remove_images: [])
  end

  def item_list(i)
    item_array = []
    Item.find_each do |item|
      category_id = item.category.parent.parent.id
      item_array.push(item) if category_id == i
    end
    array_length = item_array.length
    item_array.slice!(-4, 4)
  end

  def search_params
    params.require(:q).permit!
  end
end

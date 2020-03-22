class ProductsController < ApplicationController
  before_action -> {
    set_product
    seller_check
  }, only: %i[ edit update ]

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # showに飛ばす方が自然
      redirect_to root_path
    else
      @product.images = []
      @product.images.new
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update
      # showに飛ばす方が自然
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def seller_check
    redirect_to root_path if current_user != @product.seller
  end

  def product_params
    params.require(:product).permit(
      :condition,
      :delivery_burden,
      :delivery_method,
      :delivery_time,
      :description,
      :name,
      :price,
      :size,
      :product_category_id,
      :brand_id,
      :prefecture_id,
      images_attributes: [:src]
    )
    .merge(seller: current_user, status: :on_sale)
  end
end

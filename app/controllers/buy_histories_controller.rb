class BuyHistoriesController < CreditsController
  before_action :set_item

  def new
    redirect_to item_path(@item) if @item.buy_history.present?

    @card_info = get_card_info(current_user) if current_user.credits.present?
  end

  def create
    @buy_history = BuyHistory.new(
      user_id: current_user.id,
      item_id: @item.id
    )
    if pay(current_user, @item) && @buy_history.save
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end

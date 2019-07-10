class CreditsController < ApplicationController
  def index
    unless current_user.credits.blank?
      Payjp.api_key = get_payjp_key()
      credit = current_user.credits.first
      customer = Payjp::Customer.retrieve(credit.customer_id)
      card = customer.cards.retrieve(customer.default_card)
      @card_info = get_card_info(card)
  end

  end
  
  def new
    unless current_user.credits.blank?
      redirect_to credits_path
    end
  end
  end
end

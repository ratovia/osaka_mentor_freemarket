class CreditsController < ApplicationController
  def index
    if current_user.credits.present?
      Payjp.api_key = get_payjp_key
      credit = current_user.credits.first
      customer = Payjp::Customer.retrieve(credit.customer_id)
      card = customer.cards.retrieve(customer.default_card)
      @card_info = get_card_info(current_user)
    end
  end

  def new
    redirect_to credits_path if current_user.credits.present?
  end

  def create
    if current_user.credits.present?
      redirect_to credits_path
    else
      Payjp.api_key = get_payjp_key
      customer = Payjp::Customer.create
      @credit = create_payjp_card(current_user, customer)
      if @credit.save
        flash[:notice] = "クレジットカードを登録しました"
        redirect_to credits_path
      else
        flash[:alert] = "登録に失敗しました"
        render "new"
      end
    end
  end

  def destroy
    if current_user.credits.present?
      Payjp.api_key = get_payjp_key
      credit = current_user.credits.first
      customer = Payjp::Customer.retrieve(credit.customer_id)
      customer.delete
      credit.destroy
      flash[:notice] = "クレジットカードを削除しました"
    end
    redirect_to credits_path
  end

  private

  def create_payjp_customer
    Payjp.api_key = get_payjp_key
    customer = Payjp::Customer.create
  end

  def create_payjp_card(user, customer)
    customer.cards.create(card: token_parmas[:token])
    credit = Credit.new(
      user_id: user.id,
      customer_id: customer.id
    )
  end

  def token_parmas
    params.permit(:token)
  end

  def get_payjp_key
    Rails.application.credentials.MERUCARI_PAYJP_SECRET_KEY
  end

  def get_card_info(user)
    Payjp.api_key = get_payjp_key
    credit = user.credits.first
    customer = Payjp::Customer.retrieve(credit.customer_id)
    card = customer.cards.retrieve(customer.default_card)
    card_info = {}
    card_info[:brand] = if card.brand == "Visa"
                          "visa.svg"
                        elsif card.brand == "master"
                          "master.png"
                        elsif card.brand == "jcb"
                          "jcb.png"
                        else
                          "non-card.png"
                        end

    card_info[:last4] = "*" * 12 + card.last4
    card_info[:exp_date] = "#{card.exp_month}/#{card.exp_year.to_s.slice(2, 2)}"
    card_info
  end

  def pay(user, item)
    return false if user.nil? || item.nil? || user.credits.blank?

    Payjp.api_key = get_payjp_key
    charge = Payjp::Charge.create(
      amount: item.price,
      customer: user.credits.first.customer_id,
      currency: 'jpy'
    )
    true
  end
end

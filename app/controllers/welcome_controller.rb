class WelcomeController < ApplicationController
  def index
  end

  def new_item
    @prefecture = Prefecture.all
  end
  def mypage
  end
  def new
  end
  def new2
  end
  def identification
    @prefecture = Prefecture.all
  end
end

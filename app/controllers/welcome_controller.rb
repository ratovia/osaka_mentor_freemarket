class WelcomeController < ApplicationController
  def index
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

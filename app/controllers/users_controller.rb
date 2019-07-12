class UsersController < ApplicationController

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def logout
  end

  def identification
    @prefectures = Prefecture.all
  end

end

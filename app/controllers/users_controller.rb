class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :logout, :identification]
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

  private
  
  def set_user
    @user = User.find(params[:id])
  end
end

class CommentsController < ApplicationController
  before_action :set_item, only: :create
  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      # ActionCable.server.broadcast 'comment_channel', content: @comment
      CommentsChannel.broadcast_to @item, @comment
      
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(item_id: @item.id,user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

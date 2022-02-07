class CommentsController < ApplicationController
  def create
    if @current_user
      @comment = Comment.new(
        user_id: @current_user.id,
        item_id: params[:item_id],
        content: params[:content]
      )
      if @comment.save
        flash[:notice] = "送信しました"
        
        
      else
        redirect_to("/items/index}")
        
      end
    else
      redirect_to("/login")
    end
  end
  def destroy
    @comment = Comment.find_by(
      user_id: @current_user.id,
      post_id: params[:item_id]
    )
    @comment.destroy
    redirect_to("/items/#{params[:item_id]}")
  end
end

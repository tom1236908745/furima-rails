class LikesController < ApplicationController
  def create
    if @current_user
      @like = Like.new(
        user_id: @current_user.id,
        item_id: params[:item_id]
      )
      @like.save
      redirect_to("/items/#{params[:item_id]}")
      @current_user_id = @current_user.id
    else
      redirect_to("/login")
    end
    
  end
  def destroy
    if @current_user
      @like = Like.find_by(
        user_id: @current_user.id,
        item_id: params[:item_id]
      )
      @like.destroy
      redirect_to("/items/#{params[:item_id]}")
    else
      redirect_to("/login")
  end
end
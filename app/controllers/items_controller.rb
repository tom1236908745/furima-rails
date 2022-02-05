class ItemsController < ApplicationController
  before_action :ensure_correct_user_to_item, {only: [:edit, :update, :destroy]}
  def index
    @items = Item.all.order(created_at: :desc)
  end
  def category
    @items = Item.where(category: params[:category]).order(created_at: :desc)
  end
  def show
    @item = Item.find_by(id: params[:id])
    logger.debug(@item)
    if @item
      @user = @item.user
      @match_user = false
      @likes_count = Like.where(item_id: @item.id).count
      if @current_user
        if @current_user.id == @item.user_id
          @match_user = true
        end
      end
    end
    
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(content: params[:content], image: params[:image], user_id: @current_user.id, category: params[:category], money: params[:money] )
    
    # if @item.save && params[:image]
    #   @item.image_name = "#{@item.id}.jpg"
    #   image = params[:image]
    #   File.binwrite("public/item_images/#{@item.image_name}",image.read)
    #   if @item.save
    #     flash[:notice] = "出品完了しました"
    #     redirect_to("/")
    #   else
    #     render :new
    #   end
    # else
    #   render :new
    # end

    if @item.save
      flash[:notice] = "出品完了しました"
      redirect_to("/")
    else
      render :new
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end
  def update
    @item = Item.find_by(id: params[:id])
    @item.content = params[:content]
    
    if params[:image]
      image = params[:image]
      File.binwrite("public/item_images/#{@item.image_name}",image.read)
    end
    if @item.save
      flash[:notice] = "出品内容を編集しました"
      redirect_to("/")
    else
      render :edit
    end
  end
  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    redirect_to("/")
  end
end

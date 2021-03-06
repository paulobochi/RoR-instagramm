class PicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
  end

  def new
    @pic = current_user.pics.new
  end

  def create
    @pic = current_user.pics.new(pic_params)

    if @pic.save
      redirect_to @pic, notice: 'Yess! It was posted!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Congrats! Pic was updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  def like
    @pic.liked_by current_user
    redirect_to :back
  end

  def unlike
    @pic.unliked_by current_user
    redirect_to :back
  end

  private

    def find_pic
      @pic = Pic.find(params[:id])
    end

    def pic_params
      params.required(:pic).permit(:title, :description, :image)
    end

end

class PicsController < ApplicationController

  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all
  end

  def show
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic, notice: 'Yess! It was posted!'
    else
      render 'new'
    end
  end

  private

    def find_pic
      @pic = Pic.find(params[:id])
    end

    def pic_params
      params.required(:pic).permit(:title, :description)
    end

end

class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all.order('en ASC')
  end

  def show
    @words = @category.words.order('ja')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
      flash[:success] = 'Created category!'
    end
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to @category
      flash[:success] = 'Updated category!'
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
      flash[:success] = 'Deleted category!'
    end
  end

  private

  def category_params
    params.require(:category).permit(:en, :vi, :image, :slug)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end

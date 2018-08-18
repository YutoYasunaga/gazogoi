class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all.order('en ASC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
      flash[:success] = t('flash.category.created_category')
    end
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path
      flash[:success] = t('flash.category.updated_category')
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
      flash[:success] = t('flash.category.deleted_category')
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

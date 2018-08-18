class WordsController < ApplicationController
  before_action :set_word, only: [:edit, :update, :destroy]

  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
  end

  def edit
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to category_path(@word.category)
      flash[:success] = t('flash.word.created_word')
    end
  end

  def update
    if @word.update_attributes(word_params)
      redirect_to category_path(@category)
      flash[:success] = t('flash.word.updated_word')
    end
  end

  private

  def word_params
    params.require(:word).permit(:category_id, :ja, :furigana, :en, :vi, :image)
  end

  def set_word
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
  end
end

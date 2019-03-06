class BookmarksController < ApplicationController

  def bookmark
    @word = Word.find(params[:word_id])
    Bookmark.create(user: current_user, word: @word)
    respond_to do |format|
      format.js
    end
  end

  def remove_bookmark
    @word = Word.find(params[:word_id])
    Bookmark.where(user: current_user, word: @word).first.destroy
    respond_to do |format|
      format.js
    end
  end

  def show_bookmark
    @user = User.find(params[:user_id])
    @words = @user.words.order('ja')
  end

end

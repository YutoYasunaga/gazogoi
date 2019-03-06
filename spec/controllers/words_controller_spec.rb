require 'rails_helper'

describe WordsController, type: :controller do

  describe '#create' do
    context 'as a guest' do
      it 'does not create the word'
      it 'returns a 302 response'
      it 'redirects to home page'
    end
    
    context 'as an user' do
      it 'does not create the word'
      it 'returns a 302 response'
      it 'redirects to home page'
    end

    context 'as an admin' do
      it 'adds a word'
    end
  end

  describe '#update' do
    context 'as a guest' do
      it 'does not update the word'
      it 'returns a 302 response'
      it 'redirects to home page'
    end

    context 'as an user' do
      it 'does not update the word'
      it 'returns a 302 response'
      it 'redirects to home page'
    end

    context 'as an admin' do
      it 'updates a word'
    end
  end

  describe '#destroy' do
    context 'as a guest' do
      it 'does not delete the word'
      it 'returns a 302 response'
      it 'redirects to home page'
    end

    context 'as an user' do
      it 'does not delete the word'
      it 'returns a 302 response'
      it 'redirects to home page'
    end

    context 'as an admin' do
      it 'deletes a word'
    end
  end
end

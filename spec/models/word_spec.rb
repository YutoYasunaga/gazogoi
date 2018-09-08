require 'rails_helper'

describe Word, type: :model do

  before(:all) do
    example_category = FactoryBot.create(:category)
    @example_word = example_category.words.create(
      ja: '日本',
      furigana: 'にほん',
      en: 'Japan',
      vi: 'Nhật Bản'
    )
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:word)).to be_valid
  end

  it 'is valid with a Japanese, Furigana, English, Vietnamese' do
    expect(@example_word).to be_valid
  end

  it 'is invalid without a Japanese' do
    word = FactoryBot.build(:word, ja: nil)
    word.valid?
    expect(word.errors[:ja]).to include("can't be blank")
  end

  it 'does not allow duplicate word Japanese per category' do
    category = FactoryBot.create(:category)
    word1 = FactoryBot.create(:word, category_id: category.id, ja: '英語')
    word2 = FactoryBot.build(:word, category_id: category.id, ja: '英語')
    word2.valid?
    expect(word2.errors[:ja]).to include('has already been taken')
  end

  it 'allow two categories to share a word Japanese' do
    category1 = FactoryBot.create(:category)
    category2 = FactoryBot.create(:category)
    word1 = FactoryBot.create(:word, category_id: category1.id, ja: '中国')
    word2 = FactoryBot.build(:word, category_id: category2.id, ja: '中国')
    expect(word2).to be_valid
  end

end

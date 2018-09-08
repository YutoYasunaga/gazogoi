require 'rails_helper'

describe Category, type: :model do
  before do
    @first_category = Category.create(
      en: 'Animals',
      vi: 'Động Vật',
      slug: 'animals'
    )
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is valid with a English title, Vietnamese title' do
    expect(@first_category).to be_valid
  end

  it 'is invalid without a English title' do
    category = FactoryBot.build(:category, en: nil)
    category.valid?
    expect(category.errors[:en]).to include("can't be blank")
  end

  it 'is invalid without a Vietnamese title' do
    category = FactoryBot.build(:category, vi: nil)
    category.valid?
    expect(category.errors[:vi]).to include("can't be blank")
  end

  it 'is invalid with a duplicate English title' do
    category = FactoryBot.build(:category, en: 'Animals')
    category.valid?
    expect(category.errors[:en]).to include('has already been taken')
  end

  it 'is invalid with a duplicate Vietnamese title' do
    category = FactoryBot.build(:category, vi: 'Động Vật')
    category.valid?
    expect(category.errors[:vi]).to include('has already been taken')
  end

end

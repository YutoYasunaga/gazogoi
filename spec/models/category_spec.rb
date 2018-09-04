require 'rails_helper'

describe Category, type: :model do

  it 'has a valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is valid with a English title and Vietnamese title' do
    category = Category.new(
      en: 'Vegetables',
      vi: 'Rau Củ',
      slug: 'vegetables'
    )
    expect(category).to be_valid
  end

  it 'is invalid without English title' do
    category = FactoryBot.build(:category, en: nil)
    category.valid?
    expect(category.errors[:en]).to include("can't be blank")
  end

  it 'is invalid without Vietnamese title' do
    category = FactoryBot.build(:category, vi: nil)
    category.valid?
    expect(category.errors[:vi]).to include("can't be blank")
  end

  it 'is invalid with a duplicate English title' do
    exist_category = FactoryBot.create(:category, en: 'Vehicle')
    category = FactoryBot.build(:category, en: 'Vehicle')
    category.valid?
    expect(category.errors[:en]).to include("has already been taken")
  end

  it 'is invalid with a duplicate Vietnamese title' do
    exist_category = FactoryBot.create(:category, vi: 'Xe Cộ')
    category = FactoryBot.build(:category, vi: 'Xe Cộ')
    category.valid?
    expect(category.errors[:vi]).to include("has already been taken")
  end

end

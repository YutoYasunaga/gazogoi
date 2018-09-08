require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @example_user = User.create(
      name: 'Example User',
      email: 'example@gmail.com',
      password: 'example'
    )
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is valid with a name, email' do
    expect(@example_user).to be_valid
  end

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email' do
    user = FactoryBot.build(:user, email: 'example@gmail.com')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

end

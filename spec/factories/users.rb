require 'ffaker'

FactoryBot.define do

  factory :user do
    name { FFaker::Name.name }
    sequence(:email) { |n| "#{n}#{FFaker::Internet.email}" }
    password { FFaker::Internet.password }
  end

end

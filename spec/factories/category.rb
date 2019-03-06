require 'ffaker'

FactoryBot.define do

  factory :category do
    en { FFaker::Name.name }
    vi { FFaker::NameVN.name }
    sequence(:slug) { |n| "#{FFaker::Internet.slug}-#{n}" }
  end

end


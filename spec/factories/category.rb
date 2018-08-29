FactoryGirl.define do
  factory :category do
    en { Faker::Construction.material }
    vi { Faker::Construction.material }
    slug { Faker::Internet.slug }
  end
end


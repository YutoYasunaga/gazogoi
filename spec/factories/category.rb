FactoryGirl.define do
  factory :category do
    en { Faker::IndustrySegments.industry }
    vi { Faker::IndustrySegments.industry }
    slug { Faker::Internet.slug }
  end
end


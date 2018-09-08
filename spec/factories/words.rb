require 'ffaker'

FactoryBot.define do

  factory :word do
    association :category
    ja { FFaker::LoremJA.words }
    furigana { FFaker::LoremJA.word }
    en { FFaker::Lorem.words }
    vi { FFaker::NameVN.name }
  end

end

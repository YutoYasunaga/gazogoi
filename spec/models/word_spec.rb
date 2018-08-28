require 'rails_helper'

RSpec.describe Word, type: :model do

  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:ja).of_type(:string) }
      it { should have_db_column(:furigana).of_type(:string) }
      it { should have_db_column(:en).of_type(:string) }
      it { should have_db_column(:vi).of_type(:string) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:ja) }
  end

  describe 'associations' do
    it { should belong_to(:category) }
  end

end

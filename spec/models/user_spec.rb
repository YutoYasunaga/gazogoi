require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:provider).of_type(:string) }
      it { should have_db_column(:uid).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

end

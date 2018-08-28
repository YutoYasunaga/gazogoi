require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:en).of_type(:string) }
      it { should have_db_column(:vi).of_type(:string) }
      it { should have_db_column(:slug).of_type(:string) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:en) }
    it { should validate_presence_of(:vi) }
  end

  describe "associations" do
    it { should have_many(:words) }
  end

end

require 'rails_helper'

RSpec.describe Product, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:product_category) }

    it { should have_many(:reviews) }

    it { should have_many(:ingredients) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end

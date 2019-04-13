require 'rails_helper'

RSpec.describe Product, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:product_category) }

    it { should have_many(:reviews) }

    it { should have_many(:ingredients) }

    end

    describe "InDirect Associations" do

    it { should have_many(:porosities) }

    it { should have_many(:curl_patterns) }

    end

    describe "Validations" do
      
    end
end

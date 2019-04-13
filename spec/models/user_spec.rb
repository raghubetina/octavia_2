require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:age_group) }

    it { should belong_to(:density) }

    it { should belong_to(:porosity) }

    it { should belong_to(:curl_pattern) }

    it { should have_many(:reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end

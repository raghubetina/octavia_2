require 'rails_helper'

RSpec.describe AgeGroup, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:users) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end

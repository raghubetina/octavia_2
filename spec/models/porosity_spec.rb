require 'rails_helper'

RSpec.describe Porosity, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:users) }

    end

    describe "InDirect Associations" do

    it { should have_many(:products) }

    end

    describe "Validations" do
      
    end
end

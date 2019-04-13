require 'rails_helper'

RSpec.describe Substance, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ingredients) }

    end

    describe "InDirect Associations" do

    it { should have_many(:products) }

    end

    describe "Validations" do
      
    end
end

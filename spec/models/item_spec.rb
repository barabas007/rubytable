require 'rails_helper'

RSpec.describe Item, type: :model do
    it 'validates name' do
        should validate_presence_of :name 
    end

    it 'validates price' do
        should validate_numericality_of :price
    end

    it 'has_many'do
        should have_many :positions
        should have_many :comments  
        should have_many :carts   
    end

    #it 'has_one' do 
    #    should have :----
    #end 
end
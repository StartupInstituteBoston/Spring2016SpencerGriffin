require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  let :restaurant do
    Restaurant.new(name: 'test',
                   description: 'test',
                   phone: '123-123-1234',
                   address: 'test',
                   owner_id: 1)
  end

  it 'should create new restaurant' do
    expect( restaurant.save! ).to be_truthy
  end

  it 'should validate presense of name' do
    restaurant.name = nil
    expect( restaurant ).to be_invalid
  end

  it 'should validate presense of name' do
    restaurant.phone = nil
    expect( restaurant ).to be_invalid
  end
end

require 'rails_helper'

RSpec.describe Train, type: :model do
  direction = Direction.create(source: 'indore', destination: 'pune', distance: 1400)
  train = Train.create(name: 'chennai express', total_seets: 40, departure_time: Time.now, arrival_time: Time.now,
                       price: 1000, direction_id: direction.id, traintype: 'superfast', remaning_seats: 40)

  it 'is valid with valid attributes' do
    expect(train).to be_valid
  end

  it 'is not valid without a name' do
    train.name = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a total_seets' do
    train.total_seets = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a departure_time' do
    train.departure_time = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a arrival_time' do
    train.arrival_time = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a price' do
    train.price = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a direction_id' do
    train.direction_id = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a traintype' do
    train.traintype = nil
    expect(train).to_not be_valid
  end

  it 'is not valid without a remaning_seats' do
    train.remaning_seats = nil
    expect(train).to_not be_valid
  end
end

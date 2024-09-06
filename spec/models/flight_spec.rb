require 'rails_helper'

RSpec.describe Flight, type: :model do
  direction = Direction.create(source: 'pune', destination: 'delhi', distance: 1000)
  flight = Flight.create(name: 'air india', total_seets: 200, departure_time: Time.now, arrival_time: Time.now,
                         price: 1000, direction_id: direction.id, remaning_seats: 200)

  it 'is valid with valid attributes' do
    expect(flight).to be_valid
  end

  it 'is not valid without a name' do
    flight.name = nil
    expect(flight).to_not be_valid
  end

  it 'is not valid without a total_seets' do
    flight.total_seets = nil
    expect(flight).to_not be_valid
  end

  it 'is not valid without a departure_time' do
    flight.departure_time = nil
    expect(flight).to_not be_valid
  end

  it 'is not valid without a arrival_time' do
    flight.arrival_time = nil
    expect(flight).to_not be_valid
  end

  it 'is not valid without a price' do
    flight.price = nil
    expect(flight).to_not be_valid
  end

  it 'is not valid without a direction_id' do
    flight.direction_id = nil
    expect(flight).to_not be_valid
  end

  it 'is not valid without a remaning_seats' do
    flight.remaning_seats = nil
    expect(flight).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Bus, type: :model do
  direction = Direction.create(source: 'bhopal', destination: 'jabalpur', distance: 500)
  bus = Bus.create(name: 'verma travllers', total_seets: 40, departure_time: Time.now, arrival_time: Time.now,
                   price: 1000, direction_id: direction.id, bustype: 'superfast', remaning_seats: 40)

  it 'is valid with valid attributes' do
    expect(bus).to be_valid
  end

  it 'is not valid without a name' do
    bus.name = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a total_seets' do
    bus.total_seets = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a departure_time' do
    bus.departure_time = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a arrival_time' do
    bus.arrival_time = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a price' do
    bus.price = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a direction_id' do
    bus.direction_id = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a bustype' do
    bus.bustype = nil
    expect(bus).to_not be_valid
  end

  it 'is not valid without a remaning_seats' do
    bus.remaning_seats = nil
    expect(bus).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Direction, type: :model do
  direction = Direction.create(source: 'bhopal', destination: 'jabalpur', distance: 500)

  it 'is valid with valid attributes' do
    expect(direction).to be_valid
  end

  it 'is not valid without a source' do
    direction.source = nil
    expect(direction).to_not be_valid
  end

  it 'is not valid without a total_seets' do
    direction.destination = nil
    expect(direction).to_not be_valid
  end

  it 'is not valid without a departure_time' do
    direction.distance = nil
    expect(direction).to_not be_valid
  end
end

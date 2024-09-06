require 'rails_helper'

RSpec.describe Train, type: :model do
  direction = Direction.create(id: 9, source: 'indore', destination: 'bhopal', distance: 400)
  it 'is valid with valid attributes' do
    train = Train.create(id: 2, name: 'chennai express', total_seets: 40, departure_time: Time.now, arrival_time: Time.now,
                         price: 1000, direction_id: direction.id, traintype: 'superfast', remaning_seats: 40)
    expect(train).to be_valid
  end
end

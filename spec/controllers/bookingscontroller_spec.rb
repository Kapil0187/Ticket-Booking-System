require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:user) { User.create!(email: 'test@example.com', password: 'password') }
  let!(:direction) { Direction.create(source: 'pune', destination: 'banglore', distance: 1000) }
  let!(:bus) do
    Bus.create!(direction_id: direction.id, name: 'super travllers', total_seets: 50, departure_time: Time.now,
                arrival_time: Time.now, price: 1000, bustype: 'super fast')
  end

  let(:booking_params) do
    {
      user_id: user.id,
      date: Date.today,
      mode_type: 'Bus',
      bookingable_type: 'Bus',
      bookingable_id: bus.id,
      tickets_attributes: [{ name: 'John Doe', age: 30, gender: 'Male' }]
    }
  end

  let(:booking) do
    Booking.create!(
      user: user,
      date: Date.today,
      mode_type: 'Bus',
      bookingable_type: 'Bus',
      bookingable_id: bus.id
    )
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end

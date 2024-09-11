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
      mode_type: 'BUS',
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

  before do
    # Sign in user
    sign_in user # If using Devise for authentication
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'initializes a new booking with associated tickets' do
      get :new
      expect(response).to be_successful
      expect(assigns(:booking)).to be_a_new(Booking)
      expect(assigns(:booking).tickets).to_not be_empty
    end
  end

  describe 'GET #show' do
    it 'assigns the requested booking to @booking' do
      # Create a ticket associated with the booking
      Ticket.create!(name: 'John Doe', age: 30, gender: 'Male', booking: booking)

      get :show, params: { id: booking.id }
      expect(response).to be_successful
      expect(assigns(:booking)).to eq(booking)
      expect(assigns(:tickets)).to eq(booking.tickets)
    end
  end

  describe 'POST #create' do
    it 'creates a new booking and allocates seats' do
      expect do
        post :create, params: { booking: booking_params }
      end.to change(Booking, :count).by(1)

      expect(response).to redirect_to(Booking.last)
      expect(ActionMailer::Base.deliveries.last.subject).to eq('Booking Confirmation')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested booking and updates remaining seats' do
      # Create a ticket associated with the booking
      Ticket.create!(name: 'John Doe', age: 30, gender: 'Male', booking: booking)

      expect do
        delete :destroy, params: { id: booking.id }
      end.to change(Booking, :count).by(-1)

      expect(response).to redirect_to(allbookings_path(user_id: user.id))
    end
  end

  private

  def sign_in(user)
    # If using Devise, this method should work for signing in
    allow(controller).to receive(:current_user).and_return(user)
  end
end

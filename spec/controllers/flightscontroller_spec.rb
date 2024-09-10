# spec/controllers/flights_controller_spec.rb
require 'rails_helper'
require 'simplecov'

RSpec.describe FlightsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show_flight' do
    let!(:direction) { Direction.create!(source: 'New York', destination: 'india', distance: 10_000) }
    let!(:flight) do
      Flight.create!(direction_id: direction.id, name: 'Air India', total_seets: 200, departure_time: Time.now,
                     arrival_time: Time.now, price: 20_000)
    end

    context 'when valid parameters are passed' do
      before do
        get :show_flight, params: { source: 'New York', destination: 'india' }
      end

      it 'renders the show_flight template' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when no matching direction is found' do
      before do
        get :show_flight, params: { source: 'india', destination: 'New' }
      end

      it 'renders the show_flight template' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end

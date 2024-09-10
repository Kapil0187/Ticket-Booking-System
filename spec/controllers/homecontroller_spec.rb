# spec/controllers/home_controller_spec.rb
require 'rails_helper'
require 'simplecov'

RSpec.describe HomeController, type: :controller do
  # Create test data
  let!(:direction) { Direction.create(source: 'pune', destination: 'banglore', distance: 1000) }
  let!(:bus) do
    Bus.create!(direction_id: direction.id, name: 'super travllers', total_seets: 50, departure_time: Time.now,
                arrival_time: Time.now, price: 1000, bustype: 'super fast')
  end
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    context 'when direction exists' do
      before do
        get :show, params: { source: direction.source, destination: direction.destination }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when direction does not exist' do
      before do
        get :show, params: { source: 'Nonexistent', destination: 'Destination' }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end

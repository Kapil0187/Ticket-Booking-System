require 'rails_helper'
require 'simplecov'

RSpec.describe TrainsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show_train' do
    let!(:direction) { Direction.create!(source: 'delhi', destination: 'pune', distance: 200) }
    let!(:train) do
      Train.create!(direction_id: direction.id, name: 'super fast', total_seets: 200, departure_time: Time.now,
                    arrival_time: Time.now, price: 1000, traintype: 'super fast')
    end

    context 'when valid parameters are passed' do
      before do
        get :show_train, params: { source: 'delhi', destination: 'pune' }
      end

      it 'renders the show_train template' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when no matching direction is found' do
      before do
        get :show_train, params: { source: 'pune', destination: 'delhi' }
      end

      it 'renders the show_train template' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end

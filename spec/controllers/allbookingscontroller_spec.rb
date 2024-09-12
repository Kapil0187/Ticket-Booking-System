# spec/controllers/allbookings_controller_spec.rb

require 'rails_helper'

RSpec.describe AllbookingsController, type: :controller do
  let(:user) { create(:user) }
  let!(:future_booking) { create(:booking, user: user, date: Date.today + 1) }
  let!(:past_booking) { create(:booking, user: user, date: Date.today - 1) }

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end

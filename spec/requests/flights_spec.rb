require 'rails_helper'

RSpec.describe 'Flights', type: :request do
  describe 'GET /index' do
    it 'works! (now write some real specs)' do
      get flight_path
      expect(response).to have_http_status(200)
    end
  end
end

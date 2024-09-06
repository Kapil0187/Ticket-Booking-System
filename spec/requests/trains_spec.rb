require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  describe 'GET /trains' do
    it 'works! (now write some real specs)' do
      get train_path
      expect(response).to have_http_status(200)
    end
  end
end

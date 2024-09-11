require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  context 'Get /show_train' do
    it 'should render show train page' do
      get train_path
      expect(response).to have_http_status(200)
    end
  end
end

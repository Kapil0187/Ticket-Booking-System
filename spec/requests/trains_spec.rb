require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  context 'Get /show_train' do
    it 'should render show train page' do
      get train_path
      expect(response).to render_template :show_train
    end
  end
end
spec / controllers / trains_controller_spec.rb

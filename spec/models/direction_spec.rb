require 'rails_helper'
require 'simplecov'

RSpec.describe Direction, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:source) }
    it { should validate_presence_of(:destination) }
    it { should validate_presence_of(:distance) }
  end

  describe 'association' do
    it { should have_many(:buses) }
  end
end

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:mode_type) }
    it { should validate_presence_of(:date) }
  end
  
  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:bookingable) }
    it { should have_many(:tickets).dependent(:destroy) }
    it { should accept_nested_attributes_for(:tickets) }
  end
end

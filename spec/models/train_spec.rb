require 'rails_helper'

RSpec.describe Train, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:total_seets) }
    it { should validate_presence_of(:departure_time) }
    it { should validate_presence_of(:arrival_time) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:direction_id) }
    it { should validate_presence_of(:traintype) }
  end
  
  describe "association" do
    it { should have_many(:bookings)}
    it { should belong_to(:direction) }
  end
  
end

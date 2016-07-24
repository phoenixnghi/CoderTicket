require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should belong_to(:region) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:full_address) }
  it { should validate_presence_of(:region_id) }
end

require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { is_expected.to belong_to(:region) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:full_address) }
  it { is_expected.to validate_presence_of(:region_id) }
end

require 'rails_helper'

RSpec.describe Event, type: :model do
  it { expect(Event.new).to belong_to(:venue) }
  it { expect(Event.new).to validate_uniqueness_of(:name) }
end

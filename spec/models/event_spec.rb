require 'rails_helper'

RSpec.describe Event, type: :model do
  # describe Event do
    it { should belong_to(:venue) }
  # end
end

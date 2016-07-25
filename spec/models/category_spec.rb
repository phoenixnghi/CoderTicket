require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_inclusion_of(:name).in_array(['Entertainment', 'Learning', 'Everything Else']) }
  it { is_expected.to validate_uniqueness_of(:name) }
end

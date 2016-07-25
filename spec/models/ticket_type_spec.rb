require 'rails_helper'

RSpec.describe TicketType, type: :model do
  it { is_expected.to belong_to(:event) }
end

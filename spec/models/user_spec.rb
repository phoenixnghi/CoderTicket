require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  auth_hash = OmniAuth::AuthHash.new({
                                         :info => {
                                             :email    => 'abc@example.com',
                                             :name     => 'ABC',
                                             :password => 'abc123'
                                         }
                                     })
  it 'retrieves an existing user' do
    user = User.new(
        :email    => 'abc@example.com',
        :name     => 'ABC',
        :password => 'abc123',
    )
    user.save
    omniauth_user = User.from_omniauth(auth_hash)

    expect(user.name).to eq(omniauth_user.name)
    expect(user.email).to eq(omniauth_user.email)
  end
end

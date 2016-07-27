FactoryGirl.define do
  factory :user do
    name 'pxn'
    email { Faker::Internet.safe_email }
    password 'abc'
  end
end
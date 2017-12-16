FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'

    after(:build) do |user, eval|
      user.default_deck = build(:deck, user_id: user.id)
    end
  end
end

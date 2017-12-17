FactoryBot.define do
  factory :card do
    original_text 'the table'
    translated_text 'стол'
    review_date Date.today
    user
    deck
  end
end

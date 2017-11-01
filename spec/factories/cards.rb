FactoryGirl.define do
  factory :card do
    original_text 'the table'
    translated_text 'стол'
    user
    deck
  end
end

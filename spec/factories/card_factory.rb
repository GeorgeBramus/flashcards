FactoryGirl.define do
  factory :card do
    original_text 'стол'
    translated_text 'a table'
  end
  factory :card_original_text_empty do
    original_text ''
    translated_text 'a table'
  end
  factory :card_translated_text_empty do
    original_text 'стол'
    translated_text ''
  end
end

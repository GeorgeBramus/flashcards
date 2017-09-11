require 'rails_helper'

RSpec.describe Card, :type => :model do
  describe 'change when creating' do
    it 'the original_text is empty' do
      # card = FactoryGirl.build(:card_original_text_empty)
      expect { FactoryGirl.build(:card_original_text_empty) }.to raise_error
    end
    it 'the translated_text is empty' do
      # card = FactoryGirl.build(:card_translated_text_empty)
      expect { FactoryGirl.build(:card_translated_text_empty) }.to raise_error
    end
    it 'field review_date' do
      card = FactoryGirl.build(:card)
      card.review_date = 3.days.since
    end
  end
end

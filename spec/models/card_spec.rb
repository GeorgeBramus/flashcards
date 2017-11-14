require 'rails_helper'

RSpec.describe Card do
  context 'validates' do
    it 'original_text not to be empty' do
      card = FactoryGirl.build(:card, original_text: '')
      expect(card.valid?).to be_falsey
    end

    it 'translated_text not to be empty' do
      card = FactoryGirl.build(:card, translated_text: '')
      expect(card.valid?).to be_falsey
    end

    it 'same string' do
      card = FactoryGirl.build(:card, translated_text: 'the table')
      expect(card.valid?).to be_falsey
    end
  end

  context 'callbacks' do
    it 'add 3 days' do
      card = FactoryGirl.create(:card)
      expect(card.review_date).to eq(3.days.since.to_date)
    end
  end
end

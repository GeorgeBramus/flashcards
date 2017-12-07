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
end

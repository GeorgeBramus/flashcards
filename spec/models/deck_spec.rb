require 'rails_helper'

RSpec.describe Deck, type: :model do
  context 'validates' do
    it 'field Name not to be empty' do
      deck = FactoryBot.build(:deck, name: '')
      expect(deck.valid?).to be_falsey
    end
  end
end

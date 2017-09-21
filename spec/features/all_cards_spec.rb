require 'rails_helper'

RSpec.describe Card, type: :feature do
  describe 'All cards' do
    it 'title page' do
      visit('/cards')
      expect(page).to have_content "Все карточки"
    end
    it 'count all cards on the page' do
      created_cards = FactoryGirl.create_list(:card, 2)
      cards_in_db = Card.all.count
      visit('/cards')
      cards_on_the_page = Array.new
      cards_on_the_page = find('.wrapper-cards').all('.card')
      expect(cards_in_db).to eq(cards_on_the_page.size)
    end
  end
end

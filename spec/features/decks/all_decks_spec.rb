require 'rails_helper'

RSpec.describe Deck, type: :feature do
  describe 'All decks' do
    it 'title page' do
      visit('/decks')
      expect(page).to have_content "Все колоды"
    end
    it 'count all decks on the page' do
      deck = FactoryGirl.create(:deck)
      decks_in_db = Deck.all.count

      user = deck.user

      visit('/users/sign_in')
      fill_in('Email', with: user.email)
      fill_in('Пароль', with: 'password')
      click_button('Авторизоваться')

      visit('/decks')
      decks_on_the_page = Array.new
      decks_on_the_page = find('.wrapper-decks').all('.card')
      expect(decks_in_db).to eq(decks_on_the_page.size)
    end
  end
end

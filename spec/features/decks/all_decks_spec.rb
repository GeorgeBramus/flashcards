require 'rails_helper'

RSpec.describe Deck, type: :feature do
  let(:deck) {  FactoryGirl.create(:deck) }

  before(:each) do
    @deck = deck
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@deck.user)
    visit('/users/sign_in')
    fill_in('Email', with: @deck.user.email)
    fill_in('Пароль', with: 'password')
    click_button('Авторизоваться')
  end

  describe 'All decks' do
    it 'title page' do
      visit('/decks')
      expect(page).to have_content "Все колоды"
    end
    it 'count all decks on the page' do
      visit('/decks')
      decks_on_the_page = find('.wrapper-decks').all('.card').size

      expect(decks_on_the_page).to eq(1)
    end
  end
end

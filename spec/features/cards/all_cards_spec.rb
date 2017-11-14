require 'rails_helper'

RSpec.describe Card, type: :feature do
  let(:card) {  FactoryGirl.create(:card) }

  before(:each) do
    @card = card
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@card.user)
    visit('/users/sign_in')
    fill_in('Email', with: @card.user.email)
    fill_in('Пароль', with: 'password')
    click_button('Авторизоваться')
  end

  describe 'All cards' do
    it 'title page' do
      visit('/cards')
      expect(page).to have_content "Все карточки"
    end
    it 'count all cards on the page' do
      visit('/cards')
      cards_on_the_page = find('.wrapper-cards').all('.card').size

      expect(cards_on_the_page).to eq(1)
    end
  end
end

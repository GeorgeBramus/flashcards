require 'rails_helper'

RSpec.describe Deck, type: :feature do
  let(:deck) {  FactoryBot.create(:deck) }

  before(:each) do
    @deck = deck
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@deck.user)
    visit('/users/sign_in')
    fill_in('Email', with: @deck.user.email)
    fill_in('Пароль', with: 'password')
    click_button('Авторизоваться')
  end

  it 'Name fields is empty' do
    visit('/decks/new')
    fill_in('Name', with: '')
    click_button('Создать')
    expect(page).to have_content "Name can't be blank"
  end
end

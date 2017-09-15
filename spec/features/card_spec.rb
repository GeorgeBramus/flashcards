require 'rails_helper'

RSpec.describe Card, type: :feature do
  before do
    visit('/cards/new')
    fill_in('Original text', with: 'a table')
    fill_in('Translated text', with: 'стол')
    click_button('Создать')
  end

  it 'new card' do
    card = Card.last
    expect(page).to have_content "Карточка №#{card.id}"
  end
end

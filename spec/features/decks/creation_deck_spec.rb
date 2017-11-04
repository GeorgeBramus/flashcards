require 'rails_helper'

RSpec.describe Deck, type: :feature do
  it 'Name fields is empty' do
    visit('/decks/new')
    fill_in('Name', with: '')
    click_button('Создать')
    expect(page).to have_content "Original text can't be blank"
  end
end

require 'rails_helper'

RSpec.describe Card, type: :feature do
  # before(:each) do
  #   visit('/cards/new')
  #   fill_in('Original text', with: 'a table')
  #   fill_in('Translated text', with: 'стол')
  #   click_button('Создать')
  # end

  describe 'page New Card' do
    it 'title on the page' do
      visit('/cards/new')
      expect(page).to have_content "Новая карточка"
    end
    it 'form for create card' do
      user = FactoryGirl.create(:user)
      visit('/cards/new')
      fill_in('Original text', with: 'a table')
      fill_in('Translated text', with: 'стол')
      select(user.id, from: 'card_user_id')
      click_button('Создать')
      card = Card.last
      expect(page).to have_content "Карточка №#{card.id}"
    end
  end
  describe 'status message' do
    it 'one of the fields is empty' do
      visit('/cards/new')
      fill_in('Original text', with: 'a table')
      fill_in('Translated text', with: '')
      click_button('Создать')
      expect(page).to have_content "Translated text can't be blank"
    end
    it 'one of the fields is empty' do
      visit('/cards/new')
      fill_in('Original text', with: '')
      fill_in('Translated text', with: 'стол')
      click_button('Создать')
      expect(page).to have_content "Original text can't be blank"
    end
    it 'both fields must be different' do
      visit('/cards/new')
      fill_in('Original text', with: 'a table')
      fill_in('Translated text', with: 'a table')
      click_button('Создать')
      expect(page).to have_content "The original text should be different from the translated text"
    end
  end
end

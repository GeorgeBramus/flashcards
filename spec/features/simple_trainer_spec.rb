require 'rails_helper'

RSpec.describe Card, type: :feature do
  before (:example) do
    @card = FactoryGirl.create(:card)
    @card.update(review_date: 1.day.ago)

    visit('/users/sign_in')
    fill_in('Email', with: 'email@email.mail')
    fill_in('Пароль', with: 'password')
    click_button('Авторизоваться')
  end

  describe 'Main page' do
    it 'title' do
      visit('/')
      expect(page).to have_content "Введите перевод и отправьте для проверки"
    end
    it 'successful verification' do
      visit('/')
      id = find('#card_id', visible: :hidden).value
      original_text = Card.find_by(id: id).original_text
      fill_in('original_text', with: original_text)
      click_button('Проверить')
      expect(page).to have_content "Вы правильно ответили!"
    end
    it 'poor verification result' do
      visit('/')
      translated_text = find(:xpath, '//textarea[@name="translated_text"]').value
      fill_in('original_text', with: translated_text)
      click_button('Проверить')
      expect(page).to have_content "Неверно!"
    end
  end
end

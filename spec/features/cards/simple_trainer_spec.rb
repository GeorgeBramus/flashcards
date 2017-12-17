require 'rails_helper'

RSpec.describe Card, type: :feature do
  before (:each) do
    @card = FactoryBot.create(:card)
    @card.update(review_date: 1.day.ago)

    user = @card.user

    visit('/users/sign_in')
    fill_in('Email', with: user.email)
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
      original_text = @card.original_text
      fill_in('original_text', with: original_text)
      click_button('Проверить')
      expect(page).to have_content "right"
    end
    it 'poor verification result' do
      visit('/')
      translated_text = find(:xpath, '//textarea[@name="translated_text"]').value
      fill_in('original_text', with: translated_text)
      click_button('Проверить')
      expect(page).to have_content "wrong"
    end
  end
end

require 'rails_helper'

RSpec.describe Card, type: :feature do
  describe 'Main page' do
    it 'title' do
      visit('/')
      expect(page).to have_content "Введите перевод и отправьте для проверки"
    end
    it 'empty db' do
      card = FactoryGirl.create(:card)
      card.update!(review_date: 1.day.ago)
      visit('/')
      expect(page).to have_content "Карточки для повторения не найдены. Попробуйте завтра"
    end
    # it 'successful verification' do
    #   created_card = FactoryGirl.create(:card)
    #   created_card.update(review_date: 1.day.ago)
    #   visit('')
    #   # id = page.assert_selector('input#card_id', visible: :hidden)
    #   # id = find :xpath, "//input[@id='card_id']"
    #   # id = find('#card_id', visible: false).native.text
    #   # id = find_field('id', visible: false).value
    #   # id = find_by_id('card_id', visible: false)
    #   id = find('#card_id', visible: :hidden).value
    #   # id = find('.form_for_simple_trainer').all('#card_id', visible: :hidden)
    #   # id = id[0]
    #   # id = id.value
    #   # id = find(:xpath, "//input[@id='card_id']").value
    #   original_text = Card.find_by(id: id).original_text
    #   fill_in('Original text', with: original_text)
    #   click_button('Проверить')
    #   expect(page).to have_content "Вы правильно ответили!"
    # end
    # it 'poor verification result' do
    #   created_card = FactoryGirl.create(:card)
    #   visit('/')
    #   translated_text = find_field('translated_text').text
    #   fill_in('Original text', with: translated_text)
    #   click_button('Проверить')
    #   expect(page).to have_content "Неверно!"
    # end
  end
end

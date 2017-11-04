require 'rails_helper'

RSpec.describe Deck, type: :feature do
  let(:user) { FactoryGirl.build(:user) }

  it 'Name fields is empty' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    @user = FactoryGirl.create(:user)
    visit('/users/sign_in')
    fill_in('Email', with: 'email@email.mail')
    fill_in('Пароль', with: 'password')
    click_button('Авторизоваться')

    visit('/decks/new')
    fill_in('Name', with: '')
    click_button('Создать')
    expect(page).to have_content "Name can't be blank"
  end
end

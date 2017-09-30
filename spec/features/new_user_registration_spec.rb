require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'new registration' do
    visit('/users/sign_up')
    fill_in('Email', with: 'email@email.mail')
    fill_in('Пароль', with: 'password')
    fill_in('Повторите пароль', with: 'password')
    click_button('Регистрация')
    user = User.last
    expect(user.email).to eq('email@email.mail')
  end
end

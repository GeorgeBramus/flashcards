require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'will show information about one card' do
      card = Card.all
      get :index
      expect(assigns(:card)).to eq([card])
    end
  end
  describe '.create' do
    it 'create card' do
      FactoryGirl.create(:card)
    end
  end
end

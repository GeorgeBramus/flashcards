require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET' do
    it '#index' do
      get :index
      expect(response.status).to eq(200)
    end
    it '#new' do
      get :new
      expect(response.status).to eq(200)
    end
    it '#edit' do
      get :edit
      expect(response.status).to eq(200)
    end
  end
  # describe '.create' do
  #   it 'create card' do
  #     FactoryGirl.create(:card)
  #   end
  # end
end

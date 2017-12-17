require 'rails_helper'

RSpec.describe CheckCardAndUpdate, type: :interactor do
  before (:example) do
    @card = FactoryBot.create(:card)
  end

  describe 'return message' do
    it 'correct answer' do
      interactor = CheckCardAndUpdate.call(
        custom_original_text: @card.original_text,
        card_id: @card.id
      )
      expect(interactor.message).to eq(:right)
    end
    it 'wrong answer' do
      interactor = CheckCardAndUpdate.call(
        custom_original_text: '*',
        card_id: @card.id
      )
      expect(interactor.message).to eq(:wrong)
    end
    # it 'failed to update' do
    #   interactor = CheckCardAndUpdate.call(
    #     custom_original_text: @card.original_text,
    #     card_id: @card.id
    #   )
    #   expect(interactor.message).to eq('Не удалось обновить карточку. Попробуйте позже')
    # end
  end

  it 'update review_date' do
    interactor = CheckCardAndUpdate.call(
      custom_original_text: @card.original_text,
      card_id: @card.id
    )
    expect(@card.review_date).to eq(Date.today)
  end
end

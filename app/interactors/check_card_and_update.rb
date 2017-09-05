class CheckCardAndUpdate
  include Interactor

  def call
    custom_original_text = context.custom_original_text
    card_id = context.card_id
    card_current = Card.find_by(id: card_id)

    if card_current
      if card_current.original_text.to_s.downcase.intern == custom_original_text.to_s.downcase.intern
        if card_current.update(review_date: 3.days.since)
          context.message = 'Вы правильно ответиди!'
        end
      else
        context.message = 'Неверно!'
      end
    else
      context.message = 'Не удалось обновить карточку. Попробуйте позже'
    end
  end
end

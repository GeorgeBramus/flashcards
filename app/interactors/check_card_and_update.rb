class CheckCardAndUpdate
  include Interactor

  def call
    custom_original_text = context.custom_original_text
    card_current = context.verified_card

    if card_current.original_text.to_s.downcase.intern == custom_original_text.to_s.downcase.intern
      # Updating the review_date field for the current card
      card = Card.find(card_current.id).update(review_date: 3.days.since)
      # Result of checking and updating as a message.
      if card
        context.message = message 'correctly'
      else
        context.message = message 'wrong_db'
      end
    else
      context.message = message 'wrong'
      context.fail!
    end
  end

  private
    def message message
      if message == 'correctly'
        'Вы правильно ответили!'
      elsif message == 'wrong'
        'Неверно!'
      elsif message == 'wrong_db'
        'Не удалось обновить карточку. Попробуйте чуть позже.'
      end
    end
end

class CheckCardAndUpdate
  include Interactor

  def call
    custom_original_text = context.custom_original_text
    card_id = context.card_id
    card = Card.find_by(id: card_id)

    if card
      if coincides?(card.original_text, custom_original_text)
        if card.correct_answer < 5
          increment_correct_answer(card)
          if card.review_date = set_date(card.correct_answer)
            context.message = 'Вы правильно ответили!'
          else
            context.message = 'Не удалось обновить карточку. Попробуйте позже'
          end
        end
      else
        context.message = 'Неверно!'
        unless allowable_errors?(card)
          card.review_date = set_date(1)
        else
          increment_incorrect_answer(card)
        end
      end
    else
      context.fail!
    end
  end

  private def coincides?(card_original_text, custom_original_text)
    card_original_text.to_s.downcase.intern == custom_original_text.to_s.downcase.intern
  end

  private def set_date(count_correct_answer)
    new_date = case count_correct_answer
                  when 1 then 1
                  when 2 then 6
                  when 3 then 14
                  when 4 then 28
                  when 5 then 60
                  else then 1
                end
    12.hours.since * new_date
  end

  private def allowable_errors?(card)
    card.incorrect_answer == 3
  end

  private def increment_incorrect_answer(card)
    card.update(incorrect_answer: card.incorrect_answer + 1)
  end

  private def increment_correct_answer(card)
    card.update(correct_answer: card.correct_answer + 1)
  end

end

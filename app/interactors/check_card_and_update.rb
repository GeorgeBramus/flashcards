class CheckCardAndUpdate
  include Interactor

  def call
    card = Card.find(context.card_id)

    context.message = if coincides?(card.original_text, context.custom_original_text)
      correct_answer(card)
      'Вы правильно ответили!'
    else
      incorrect_answer(card)
      'Неверно!'
    end
    card.save!
  rescue ActiveRecord::RecordNotFound
    context.fail!
  # rescue => e
  #   context.fail!
  end

  private def correct_answer(card)
    increment_correct_answer(card)
    card.review_date = set_date(card.correct_answer)
  end

  private def incorrect_answer(card)
    unless allowable_errors?(card)
      reset_counters(card)
      card.review_date = set_date(1)
    else
      increment_incorrect_answer(card)
    end
  end

  private def coincides?(card_original_text, custom_original_text)
    card_original_text.to_s.downcase.intern == custom_original_text.to_s.downcase.intern
  end

  private def set_date(count_correct_answer)
    new_date =
      case count_correct_answer
      when 1 then 12.hours.since
      when 2 then 3.days.since
      when 3 then 1.week.since
      when 4 then 2.weeks.since
      when 5 then 1.month.since
      else 12.hours.since
      end
  end

  private def allowable_errors?(card)
    card.incorrect_answer == 3
  end

  private def increment_incorrect_answer(card)
    if card.incorrect_answer
      card.incorrect_answer = card.incorrect_answer + 1
    else
      card.incorrect_answer = 1
    end
  end

  private def reset_counters(card)
    card.incorrect_answer = 0
    card.correct_answer = 0
  end

  private def increment_correct_answer(card)
    if card.correct_answer
      card.correct_answer = card.correct_answer + 1
    else
      card.correct_answer = 1
    end
  end
end

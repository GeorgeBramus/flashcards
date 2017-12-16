class CheckCardAndUpdate
  include Interactor
  ALLOWED_TYPOS = 0.02

  def call
    card = Card.find(context.card_id)

    context.message = if coincides?(card.original_text, context.custom_original_text)
      correct_answer(card)
      :right
    else
      incorrect_answer(card)
      :wrong
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
    if allowable_errors?(card)
      reset_counters(card)
      card.review_date = set_date(0)
    else
      increment_incorrect_answer(card)
    end
  end

  private def coincides?(card_original_text, custom_original_text)
    DamerauLevenshtein.distance(card_original_text.mb_chars.downcase.to_s, custom_original_text.mb_chars.downcase.to_s) < card_original_text.size * ALLOWED_TYPOS
  end

  private def set_date(count_correct_answer)
    new_date =
      case count_correct_answer
      when 0 then Date.today
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
    card.incorrect_answer += 1
  end

  private def reset_counters(card)
    card.incorrect_answer = 0
    card.correct_answer = 0
  end

  private def increment_correct_answer(card)
    card.correct_answer += 1
  end
end

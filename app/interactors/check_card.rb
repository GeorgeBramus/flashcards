class CheckCard
  include Interactor

  def call
    original_text_check = context.custom_original_text
    card_check = context.verified_card

    if card_check.original_text.to_s.downcase.intern == original_text_check.to_s.downcase.intern
      context.result_of_checking = true
    else
      context.fail!
    end
  end
end

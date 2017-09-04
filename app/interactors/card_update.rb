class CardUpdate
  include Interactor

  def call
    if context.desired_card
      context_card = context.desired_card
      new_translated_text = context_card.translated_text
      if Card.find(context.params).update(translated_text: context_card.translated_text)
        context.card = true
      else
        context.fail!
      end
    else
      context.fail!
    end
  end
end

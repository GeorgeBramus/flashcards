class CardUpdate
  include Interactor

  def call
    new_translated_text = desire_card.translated_text
    if context.desired_card
      unless Card.find(context.params).update(translated_text: context.desired_card.translated_text)
        context.fail!
      end
    end
  end
end

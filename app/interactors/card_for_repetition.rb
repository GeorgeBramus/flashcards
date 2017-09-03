class CardForRepetition
  include Interactor

  def call
    if context.up_to_date
      up_to_date = context.up_to_date
    else
      up_to_date = Date.today
    end

    card = Card.where("review_date <= :date", { date: up_to_date })
    if card
      context.card = card.order("RANDOM()").first
    else
      context.fail!
    end
  end
end

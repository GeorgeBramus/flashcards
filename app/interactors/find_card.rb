class FindCard
  include Interactor

  def call
    up_to_date = context.up_to_date ? context.up_to_date : Date.today

    card = Card.where("review_date <= :date", { date: up_to_date })
    if card
      context.card = card.order("RANDOM()").first
    else
      context.fail!
    end
  end
end

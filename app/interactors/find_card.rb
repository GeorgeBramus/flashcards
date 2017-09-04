class FindCard
  include Interactor

  def call
    card = Card.where("review_date <= :date", { date: Date.today })
    if card
      context.card = card.order("RANDOM()").first
    else
      context.fail!
    end
  end
end

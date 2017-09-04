class FindCard
  include Interactor

  def call
    card = Card.where("review_date <= :date", { date: Date.today })
    card = card.order("RANDOM()").first
    if card.count > 0
      context.card = card
    else
      context.fail!
    end
  end
end

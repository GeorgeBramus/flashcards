class FindOneCard
  include Interactor

  def call
    card = Card.find(context.params)
    if card
      context.card = card
    else
      context.fail!
    end
  end
end

class FindOneCrad
  include Interactor

  def call
    card = Card.find(context.params)
    if card
      contet.card = card
    else
      context.fail!
    end
  end
end

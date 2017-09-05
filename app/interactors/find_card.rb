class FindCard
  include Interactor

  def call
    context.card = Card.where('review_date <= ?', DateTime.now).order('RANDOM()').first
  end
end

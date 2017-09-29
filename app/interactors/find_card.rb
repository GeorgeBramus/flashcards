class FindCard
  include Interactor

  def call
    user = context.user
    context.card = user.cards.where('review_date <= ?', DateTime.now).order('RANDOM()').first
  end
end

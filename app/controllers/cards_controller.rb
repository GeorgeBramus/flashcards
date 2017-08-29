class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    if @card.save!
      redirect_to @card
    else
      render :new
    end
  end

  def edit
  end

  def update
    @card.update(card_params)
    redirect_to @card
  end

  def destroy
    @card.destroy
    redirect_to @card
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end

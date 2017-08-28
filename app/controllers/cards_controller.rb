class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def show
    @card = @set_card
    # @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    record_card = Card.create(card_params)
    if record_card.errors.empty?
      redirect_to action: 'index'
      render 'new'
    end
  end

    @card = @set_card
    # @card = Card.find(params[:id])
  end

  def update
    @card = @set_card
    @card.update_attributes(card_params)
    redirect_to action: 'index'
  end

  def destroy
    @card = @set_card
    # @card = Card.find(params[:id])
    @card.destroy
    redirect_to action: 'index'
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end

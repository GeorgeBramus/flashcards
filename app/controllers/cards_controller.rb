class CardsController < ApplicationController
  before_action :set_card, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  def index
    @cards = current_user.cards
  end

  # before_action :set_card
  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.new(card_params)
    if @card.save
      redirect_to @card
    else
      render :new
    end
  end

  # before_action :set_card
  def edit
  end

  # before_action :set_card
  def update
    @card.update(card_params)
    redirect_to action: 'index'
  end

  # before_action :set_card
  def destroy
    @card.destroy
    redirect_to action: 'index'
  end

  private def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :deck_id, :image)
  end

  private def set_card
    @card = Card.find(params[:id])
  end
end

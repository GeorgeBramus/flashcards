class CardsController < ApplicationController
  before_action :set_card, only: [ :show, :edit, :update, :destroy ]

  def index
    if user_signed_in?
      user = current_user
      @cards = user.cards
    else
      @cards = Card.all
    end
  end

  # before_action
  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card
    else
      render :new
    end
  end

  # before_action
  def edit
  end

  # before_action
  def update
    @card.update(card_params)
    redirect_to action: 'index'
  end

  # before_action
  def destroy
    @card.destroy
    redirect_to action: 'index'
  end

  private def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :user_id, :image)
  end

  private def set_card
    @card = Card.find(params[:id])
  end
end

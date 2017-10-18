class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      user = current_user
      @decks = user.decks
      @default_deck = user.default_deck
    end
  end

  # before_action :set_deck
  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @default_deck = params.permit(:default_deck)
    # if @deck.save
    #   current_user.update_attribute(:default_deck, @deck.id) if default_deck
    #   redirect_to @deck
    # else
    #   render :new
    # end
  end

  # before_action :set_deck
  def edit
  end

  # before_action :set_deck
  def update
    @deck.update(deck_params)
    redirect_to action: 'index'
  end

  # before_action :set_deck
  def destroy
    @deck.destroy
    redirect_to action: 'index'
  end

  private def deck_params
    params.require(:deck).permit(:name, :user_id)
  end

  private def set_deck
    @deck = Deck.find(params[:id])
  end
end

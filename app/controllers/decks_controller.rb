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
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.new(name: deck_params[:name])
    current_user.default_deck = @deck if deck_params[:default_deck] == true
    if @deck.save && current_user.save
      redirect_to @deck
    else
      render :new
    end
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
    params.require(:deck).permit(:name, :default_deck)
  end

  private def set_deck
    @deck = Deck.find(params[:id])
  end
end

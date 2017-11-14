class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @decks = current_user.decks
    @default_deck = current_user.default_deck_id
  end

  # before_action :set_deck
  def show
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.new(name: deck_params[:name])
    if @deck.save
      current_user.update(default_deck_id: @deck.id) if to_b(deck_params[:default_deck]) == true
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

  private def to_b(val)
    val.to_i == 1 ? true : false
  end
end

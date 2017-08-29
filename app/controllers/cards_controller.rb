class CardsController < ApplicationController
  before_action :set_card, only: [ :show, :edit, :update, :destroy ]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
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
    redirect_to action: "index"
  end

  def parsing
    require 'open-uri'
    require 'nokogiri'

    url = 'http://1000mostcommonwords.com/1000-most-common-russian-words/'
    html = open(url)

    @words = Nokogiri::HTML(html)
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end

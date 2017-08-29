class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_card, only: [ :show, :edit, :update, :destroy ]

  def set_card
    @card = Card.find(params[:id])
  end
end

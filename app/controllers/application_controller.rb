class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_card

  private
    def set_card
      Card.find(params[:id])
    end
end

class HomeController < ApplicationController
  def index
    result = FindCard.call()
    @card = result.card
  end

  def check
    result = CheckCardAndUpdate.call(
      custom_original_text: params[:original_text],
      verified_card: Card.find(params[:id]),
    )
    message = result.message

    flash[:notice] = message
    redirect_to action: :index
  end
end

class HomeController < ApplicationController
  def index
    result = FindCard.call()
    @card = result.card
  end

  def check
    result = CheckCardAndUpdate.call(
      custom_original_text: params[:original_text],
      card_id: params[:id]
    )

    # flash[:notice] = result.message
    redirect_to action: :index, notice: result.message
  end
end

class HomeController < ApplicationController
  def index
    if user_signed_in?
      result = FindCard.call(
          user: current_user
        )
    end
    @card = result.card if result
  end

  def check
    result = CheckCardAndUpdate.call(
        custom_original_text: params[:original_text],
        card_id: params[:id]
      )

    # flash[:notice] = 'Неверно'
    flash[:notice] = result.message
    redirect_to action: :index
  end
end

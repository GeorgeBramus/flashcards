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

    require "damerau-levenshtein"
    differ = DamerauLevenshtein::Differ.new
    @misspelling = differ.run(params[:original_text], Card.find(params[:id]).original_text)
    flash[:notice] = result.message
    redirect_to action: :index
  end
end

class HomeController < ApplicationController
  def index
    result = FindCard.call()
    @card = result.card
  end

  def check
    result = CheckCard.call(
      custom_original_text: params[:original_text],
      verified_card: Card.find(params[:id]),
    )
    result_of_checking = result.result_of_checking

    if result_of_checking
      card = Card.find(params[:id]).update(original_text: params[:original_text])
      if card
        message = message 'correctly'
      else
        message = message 'wrong_db'
      end
    else
      message = message 'wrong'
    end

    flash[:notice] = message
    redirect_to action: :index
  end

  private
    def message message
      if message == 'correctly'
        message = 'Вы правильно ответили!'
      elsif message == 'wrong'
        message = 'Неверно! Попробуйте другую карточку.'
      elsif message == 'wrong_db'
        message = 'Не удалось обновить карточку. Попробуйте чуть позже.'
      end
    end
end

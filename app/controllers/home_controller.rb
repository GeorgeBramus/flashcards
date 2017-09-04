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

    if result.result_of_checking
      card = Card.find(params[:id]).update(original_text: params[:original_text])
      if card
        message 'correctly'
      else
        message 'wrong_db'
      end
    else
      message 'wrong'
    end

    redirect_to action: :index
  end

  private
    def message message
      if message == 'correctly'
        @message = 'Вы правильно ответили! Повторите через три дня.'
      elsif message == 'wrong'
        @message = 'Неверно! Введите ваш ответ снова.'
      elsif message == 'wrong_db'
        @message = 'Не удалось обновить карточку. Попробуйте чуть позже.'
      end
    end
end

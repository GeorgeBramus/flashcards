class HomeController < ApplicationController
  def index
    result = CardForRepetition.call()
    @card = result.card
  end

  def check
    # The text of the translation that the user entered.
    translated_text_check = params[:translated_text]
    # We are looking for a card in which there is a correct translation.
    result = FindOneCard.call( params: params[:id] )
    card_check = result.card

    if card_check.translated_text.to_s.downcase.intern == translated_text_check.to_s.downcase.intern
      result = CardUpdate.call(
        desired_card: card_check,
        params: params[:id]
      )
      card = result.card
      if card
        message 'correctly'
        result = CardForRepetition.call( up_to_date: Date.today )
        @card = result.card
      else
        message 'wrong_db'
        result = FindOneCard.call( params: params[:id] )
        @card = result.card
      end
    else
      message 'wrong'
      result = FindOneCard.call( params: params[:id] )
      @card = result.card
    end
    redirect_to action: :index
  end

  private
    def message message
      if message == 'correctly'
        @message = 'Вы правильно ответили! Повторите через три дня.'
      elsif message == 'wrong'
        @message = 'Неверно! Введите другой ответ.'
      elsif message == 'wrong_db'
        @message = 'Не удалось обновить карточку. Попробуйте чуть позже.'
      end
    end
end

class HomeController < ApplicationController
  def index
    # Стоит отметить, что этот код работет
    # card = Card.where("review_date <= :up_to_date", { up_to_date: Date.today })
    # @card = card.order("RANDOM()").first

    # А интерактор никак не хочет. Видимо проблема внутри
    @card = CardForRepetition.call()
  end

  def check
    # The text of the translation that the user entered.
    translated_text_check = params[:translated_text]
    # We are looking for a card in which there is a correct translation.
    card_check = FindOneCard.call( params: params[:id] )

    if card_check.translated_text.to_s.downcase.intern == translated_text_check.to_s.downcase.intern
      card = CardUpdate.call(
        desired_card: card_check,
        params: params[:id]
      )
      if card
        message 'correctly'
        @card = CardForRepetition.call( up_to_date: Date.today )
      else
        message 'wrong_db'
        @card = FindOneCard.call( params: params[:id] )
      end
    else
      message 'wrong'
      @card = FindOneCard.call( params: params[:id] )
    end
    render :index
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

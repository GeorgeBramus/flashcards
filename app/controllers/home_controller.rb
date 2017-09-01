class HomeController < ApplicationController
  def index
    cards_until_that_day
  end

  def check
    translated_text_check = params[:translated_text]
    card_check = card_find

    if card_check.translated_text.to_s.downcase.intern == translated_text_check.to_s.downcase.intern
      card_update
      message 'correctly'
      cards_until_that_day
    else
      message 'wrong'
      @card = card_find
    end
    render :index
  end

  private
    def card_find
      Card.find(params[:id])
    end

    def cards_until_that_day
      card = Card.where("review_date <= :date_today", { date_today: Date.today })
      @card = card.order("RANDOM()").first
    end

    def card_update
      Card.find(params[:id]).update(translated_text: card_check.translated_text)
    end

    def message message
      if message == 'correctly'
        @message = 'Вы правильно ответили! Повторите через три дня.'
      elsif message == 'wrong'
        @message = 'Неверно! Введите ваш ответ снова.'
      end
    end
end

class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.pending_cards.subject
  #
  default from: 'notifications@example.com'

  def pending_cards
    users = Users.all
    # @url  = 'http://example.com/login'
    users.each do |user|
      check_cards = user.cards.where('review_date <= ?', DateTime.now).first
      if check_cards
        @user = user
        mail(to: @user.email, subject: 'Есть карточки для проверки')
      end
    end

    # @greeting = "Hi"

    # mail to: "to@example.org"
  end
end

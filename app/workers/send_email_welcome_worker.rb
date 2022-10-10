# frozen_string_literal: true

class SendEmailWelcomeWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    mail = UsersMailer.welcome_email(user.id)
    mail.deliver_now
  end
end

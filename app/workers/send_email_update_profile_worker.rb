class SendEmailUpdateProfileWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    mail = UsersMailer.update_profile(user.id)
    mail.deliver_later
  end
end

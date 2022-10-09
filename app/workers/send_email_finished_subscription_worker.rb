class SendEmailFinishedSubscriptionWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    mail = UsersMailer.finished_subscription(user.id)
    mail.deliver_later
    user.authorization_tier = 'member'
    user.subscriptions.where(active: true).update_all(active: false)
  end
end

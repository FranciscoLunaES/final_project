class UsersMailer < ApplicationMailer
  def welcome_email(user_id)
    @user = User.find(user_id)

    mail(to: @user.email,
         subject: 'Welcome') do |format|
      format.html
      format.text
    end
  end

  def update_profile(user_id)
    @user = User.find(user_id)

    mail(to: @user.email,
         subject: 'Updated profile') do |format|
      format.html
      format.text
    end
  end

  def finished_subscription(user_id)
    @user = User.find(user_id)

    mail(to: @user.email,
         subject: 'Finished subscription') do |format|
      format.html
      format.text
    end
  end
end

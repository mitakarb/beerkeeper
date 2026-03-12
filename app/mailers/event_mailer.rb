class EventMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.participation_email.subject
  #
  def participation_email
    @user = params[:user]
    @event = params[:event]

    mail to: @user.email, subject: "【#{@event.name}】参加登録を受け付けました"
  end
end

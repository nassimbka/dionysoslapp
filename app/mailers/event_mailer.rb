class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.share_event.subject
  #
  def share(email, event_id)
    @event = Event.find(event_id)
    mail(
      to: email,
      subject: 'Ton plan pour ce soir!'
      )
  end
end

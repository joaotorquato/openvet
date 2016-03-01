class AlertNotifier < ActionMailer::Base
  default from: 'noreply.openvet@gmail.com'

  def alert_mail(vaccination)
    @vaccination = vaccination
    mail to: vaccination.pet.user.email,
         subject: "OpenVet - Alerta de vacinação do(a) #{vaccination.pet.name}"
  end
end

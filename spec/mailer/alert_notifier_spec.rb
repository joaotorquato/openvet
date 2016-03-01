require 'rails_helper'

describe AlertNotifier do
  it 'renders the subject' do
    vaccination = create(:vaccination)
    mail = AlertNotifier.alert_mail(vaccination)
    expect(mail.subject)
      .to eq "OpenVet - Alerta de vacinação do(a) #{vaccination.pet.name}"
  end

  it 'renders the body' do
    vaccination = create(:vaccination)
    mail = AlertNotifier.alert_mail(vaccination)
    expect(mail.body.encoded)
      .to include "Vacina #{vaccination.vaccine.name} do(a) \
#{vaccination.pet.name} expirará em #{vaccination.expiration_days} dias"
  end
end

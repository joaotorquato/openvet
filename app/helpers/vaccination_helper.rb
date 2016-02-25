module VaccinationHelper
  def vaccination_message(vaccination)
    if vaccination.expired?
      "Vacina #{vaccination.name} expirou há #{vaccination.expired_days} dias"
    elsif vaccination.to_expire?
      if vaccination.expiration_days == 0
        "Vacina #{vaccination.name} expira hoje!"
      else
        "Vacina #{vaccination.name} expira
         em #{vaccination.expiration_days} dias"
      end
    end
  end
end

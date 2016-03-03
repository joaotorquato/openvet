module VaccinationHelper
  def vaccination_message(vaccination)
    if vaccination.vaccine.expired?
      "Vacina #{vaccination.vaccine.name} expirou há
       #{vaccination.expired_days} dias"
    elsif !vaccination.expired? && vaccination.to_expire?
      if vaccination.expiration_days == 0
        "Vacina #{vaccination.vaccine.name} expira hoje!"
      else
        "Vacina #{vaccination.vaccine.name} expira
         em #{vaccination.expiration_days} dias"
      end
    end
  end
end

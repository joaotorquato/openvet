class Vaccination < ActiveRecord::Base
  belongs_to :pet

  def to_expire?
    (expiration_date.to_time - 15.days.from_now.to_time) < 0
  end

  def expired?
    Time.zone.today > expiration_date
  end

  def expiration_days
    (expiration_date - Time.zone.today).floor
  end

  def expired_days
    (Time.zone.today - expiration_date).floor
  end
end

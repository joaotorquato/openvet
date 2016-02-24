class Vaccination < ActiveRecord::Base
  belongs_to :pet

  def to_expire?
    (expiration_date.to_time - 15.days.from_now.to_time) < 0
  end

  def expired?
    Time.zone.now.to_time.day > expiration_date.to_time.day
  end

  def expiration_days
    time_diff = expiration_date.to_time - Time.zone.now.to_time
    (time_diff / 1.day).round
  end

  def expired_days
    time_diff = Time.zone.now.to_time - expiration_date.to_time
    (time_diff / 1.day).round
  end
end

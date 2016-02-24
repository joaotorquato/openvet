class Vaccination < ActiveRecord::Base
  belongs_to :pet

  def to_expire?
    (expiration_date.to_time - 15.days.from_now.to_time) < 0
  end

  def expired?
    Time.zone.now.to_time > expiration_date.to_time
  end

  def expiration_days
    Time.zone.now.day - expiration_date.day
  end
end

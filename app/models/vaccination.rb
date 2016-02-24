class Vaccination < ActiveRecord::Base
  belongs_to :pet
  validates :name, :vaccination_date, :expiration_date, :veterinary,
            presence: true

  def to_expire?
    (expiration_date.in_time_zone - 15.days.from_now.in_time_zone) < 0
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

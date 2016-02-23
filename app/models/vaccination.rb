class Vaccination < ActiveRecord::Base
  belongs_to :pet

  def to_expire?
    Time.zone.now >= expiration_date - 15.days
  end
end

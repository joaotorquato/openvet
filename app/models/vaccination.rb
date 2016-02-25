class Vaccination < ActiveRecord::Base
  belongs_to :pet
  belongs_to :vaccine
  accepts_nested_attributes_for :vaccine
  validates :vaccination_date, :expiration_date, :veterinary,
            presence: true

  def self.build_vaccination(pet, params)
    vaccine = build_vaccine(params[:vaccine_attributes][:name])
    new_vaccination_params = params.tap do |v|
      v.delete(:vaccine_attributes)
      v.merge!(pet: pet, vaccine: vaccine)
    end
    Vaccination.new(new_vaccination_params)
  end

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

  def self.build_vaccine(name)
    Vaccine.find_by(name: name) || Vaccine.create(name: name)
  end
end

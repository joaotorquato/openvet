class Vaccine < ActiveRecord::Base
  has_many :vaccinations
  validates :name, presence: true

  def expired?
    return false if Vaccination.last.vaccine.id != id
    vaccinations.last.expired?
  end
end

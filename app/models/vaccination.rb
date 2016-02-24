class Vaccination < ActiveRecord::Base
  belongs_to :pet
  validates :name, :vaccination_date, :expiration_date, :veterinary,
            presence: true
end

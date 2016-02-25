class Vaccine < ActiveRecord::Base
  has_many :vaccinations
  validates :name, presence: true
end

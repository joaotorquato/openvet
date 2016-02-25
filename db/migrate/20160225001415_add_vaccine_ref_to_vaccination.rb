class AddVaccineRefToVaccination < ActiveRecord::Migration
  def change
    add_reference :vaccinations, :vaccine, index: true, foreign_key: true
  end
end

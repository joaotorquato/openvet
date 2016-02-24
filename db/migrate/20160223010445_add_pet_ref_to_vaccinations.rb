class AddPetRefToVaccinations < ActiveRecord::Migration
  def change
    add_reference :vaccinations, :pet, index: true, foreign_key: true
  end
end

class RemoveNameFromVaccination < ActiveRecord::Migration
  def change
    remove_column :vaccinations, :name, :string
  end
end

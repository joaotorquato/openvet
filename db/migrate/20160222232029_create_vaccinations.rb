class CreateVaccinations < ActiveRecord::Migration
  def change
    create_table :vaccinations do |t|
      t.string :name
      t.date :vaccination_date
      t.integer :expiration_date
      t.string :veterinary

      t.timestamps null: false
    end
  end
end

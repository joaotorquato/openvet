class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :owner
      t.string :name
      t.string :species
      t.string :breed
      t.string :gender
      t.date :birth_date
      t.text :address

      t.timestamps null: false
    end
  end
end

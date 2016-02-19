class AddPetRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :pet, index: true, foreign_key: true
  end
end

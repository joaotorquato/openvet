class ChangeExpirationDateToDate < ActiveRecord::Migration
  def change
    change_column :vaccinations, :expiration_date, :date
  end
end

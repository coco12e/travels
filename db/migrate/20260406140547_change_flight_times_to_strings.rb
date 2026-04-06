class ChangeFlightTimesToStrings < ActiveRecord::Migration[8.1]
  def change
    change_column :flights, :take_off_at, :string
    change_column :flights, :land_at, :string
  end
end

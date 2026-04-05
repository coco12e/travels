class AddDetailsToFlights < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :photo, :string
    add_column :flights, :company_return, :string
    add_column :flights, :photo_return, :string
    add_column :flights, :take_off_at_return, :string
    add_column :flights, :land_at_return, :string
    add_column :flights, :duration_return, :string
    add_column :flights, :stopover_return, :string
  end
end

class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.string :company
      t.string :arrival
      t.datetime :take_off_at
      t.string :stopover
      t.string :departure
      t.string :duration
      t.datetime :land_at
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end

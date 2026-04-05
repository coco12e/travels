class CreateTransports < ActiveRecord::Migration[8.1]
  def change
    create_table :transports do |t|
      t.string :name
      t.text :advantages
      t.text :disadvantages
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end

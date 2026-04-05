class CreatePlaces < ActiveRecord::Migration[8.1]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :photo_url
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBookmarks < ActiveRecord::Migration[8.1]
  def change
    create_table :bookmarks do |t|
      t.references :trip, null: false, foreign_key: true
      t.integer :favori_id

      t.timestamps
    end
  end
end

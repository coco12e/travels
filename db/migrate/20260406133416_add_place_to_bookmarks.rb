class AddPlaceToBookmarks < ActiveRecord::Migration[8.1]
  def change
    add_reference :bookmarks, :place, null: false, foreign_key: true
  end
end

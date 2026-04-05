class AddSubCategoryToPlaces < ActiveRecord::Migration[8.1]
  def change
    add_column :places, :sub_category, :string
  end
end

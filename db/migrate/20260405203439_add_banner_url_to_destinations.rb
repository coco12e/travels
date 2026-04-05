class AddBannerUrlToDestinations < ActiveRecord::Migration[8.1]
  def change
    add_column :destinations, :banner_url, :string
  end
end

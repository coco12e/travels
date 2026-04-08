class AddFieldsToTransports < ActiveRecord::Migration[8.1]
  def change
    add_column :transports, :advantages, :text
    add_column :transports, :disadvantages, :text
    add_column :transports, :transport_type, :string
  end
end

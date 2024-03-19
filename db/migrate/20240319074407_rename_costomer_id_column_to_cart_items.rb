# db/migrate/[timestamp]_rename_costomer_id_column_to_cart_items.rb

class RenameCostomerIdColumnToCartItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :cart_items, :costomer_id, :customer_id
  end
end

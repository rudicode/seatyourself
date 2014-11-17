class AddMapUrlToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :map_url, :string
  end
end

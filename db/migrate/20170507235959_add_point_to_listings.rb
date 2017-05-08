class AddPointToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :coordinates, :point, :geographic => true
  end
end

class AddLatitudeToListings < ActiveRecord::Migration
  def change_table
    add_column :listings, :latitude, :decimal, :precision => 10, :scale => 6
    add_column :listings, :longitude, :decimal, :precision =>10, :scale => 6
  end
end
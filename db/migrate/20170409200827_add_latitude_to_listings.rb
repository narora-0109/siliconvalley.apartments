class AddLatitudeToListings < ActiveRecord::Migration
  def change_table
    add_column :listings, :latitude, :string
    add_column :listings, :longitude, :string
  end
end



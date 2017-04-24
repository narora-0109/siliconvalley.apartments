class AddFieldsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :streetnum, :integer
    add_column :listings, :country, :string
    add_column :listings, :state, :string
    add_column :listings, :property_desc, :text
    add_column :listings, :latitude, :string
    add_column :listings, :longitude, :string
  end
end

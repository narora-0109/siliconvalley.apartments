class AddColumnsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :property_type, :string
    add_column :listings, :sq_ft, :integer
    add_column :listings, :bedrooms, :string
    add_column :listings, :bathrooms, :string
    add_column :listings, :pets, :string
    add_column :listings, :leasing_fees, :string
  end
end

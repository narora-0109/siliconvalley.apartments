class ChangeColumnListingBb < ActiveRecord::Migration[5.0]
  def change
    change_column :listings, :bathrooms, 'integer USING CAST("bathrooms" AS integer)'
    change_column :listings, :bedrooms, 'integer USING CAST("bedrooms" AS integer)'
    add_column :listings, :user_id, :integer
  end
end

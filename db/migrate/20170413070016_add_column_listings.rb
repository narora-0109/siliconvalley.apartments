class AddColumnListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings,:unit_num, :integer
  end
end

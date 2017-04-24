class ChangeTypeLatllong < ActiveRecord::Migration[5.0]
  def change
    change_column :listings, :latitude, :string
    change_column :listings, :longitude, :string
  end
end

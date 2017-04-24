class AddColumnsPicture < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :listing
    add_column :pictures, :picture_json, :text
  end
end

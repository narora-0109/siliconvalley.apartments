class ChangeColumnTypePictures < ActiveRecord::Migration[5.0]
  def change
    change_column :pictures, :picture_json, :string
  end
end

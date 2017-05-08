class AddGeographyToListings < ActiveRecord::Migration[5.0]
  def change
    enable_extension :postgis
    change_table :listings do |t|
      t.remove :coordinates
      t.st_point :coordinates, geographic: true
    end
  end
end

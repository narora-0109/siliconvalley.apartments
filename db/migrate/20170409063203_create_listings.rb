class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.float :price
      t.string :streetname
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end

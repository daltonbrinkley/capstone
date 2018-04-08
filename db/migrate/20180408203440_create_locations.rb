class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :hours
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end

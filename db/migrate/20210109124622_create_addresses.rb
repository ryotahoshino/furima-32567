class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.integer :urban_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :telephone_number, null: false
      t.references :record, foreign_key: true
      t.timestamps
    end
  end
end

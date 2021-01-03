class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.integer :state_id, null: false
      t.integer :burden_id, null: false
      t.integer :origin_id, null: false
      t.integer :day_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end

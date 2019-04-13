class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :product_category_id
      t.string :name
      t.string :amazon_asin
      t.string :photo

      t.timestamps
    end
  end
end

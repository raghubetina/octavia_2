class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer :product_id
      t.integer :substance_id

      t.timestamps
    end
  end
end

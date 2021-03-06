class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :user_id
      t.integer :product_id
      t.boolean :would_use_again

      t.timestamps
    end
  end
end

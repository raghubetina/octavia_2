class CreateCurlPatterns < ActiveRecord::Migration[5.1]
  def change
    create_table :curl_patterns do |t|
      t.string :number
      t.string :letter
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end

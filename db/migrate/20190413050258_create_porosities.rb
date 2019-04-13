class CreatePorosities < ActiveRecord::Migration[5.1]
  def change
    create_table :porosities do |t|
      t.string :level
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end

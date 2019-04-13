class CreateDensities < ActiveRecord::Migration[5.1]
  def change
    create_table :densities do |t|
      t.string :level
      t.text :description
      t.string :position

      t.timestamps
    end
  end
end

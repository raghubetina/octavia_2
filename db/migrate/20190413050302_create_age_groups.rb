class CreateAgeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :age_groups do |t|
      t.string :range
      t.string :position

      t.timestamps
    end
  end
end

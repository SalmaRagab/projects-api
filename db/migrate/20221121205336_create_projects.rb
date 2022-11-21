class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :state
      t.string :owner_id

      t.timestamps null: false
    end
  end
end

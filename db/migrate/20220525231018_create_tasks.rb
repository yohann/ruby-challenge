class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :archived, null: false, default: false 
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end

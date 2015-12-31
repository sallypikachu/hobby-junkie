class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false
      t.string :description
      t.string :link
      t.integer :hobby_id, null: false
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end

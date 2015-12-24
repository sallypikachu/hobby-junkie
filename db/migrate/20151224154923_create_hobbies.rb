class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :name, null: false
      t.text :description
    end
  end
end

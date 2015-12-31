class AddUniqueHobbies < ActiveRecord::Migration
  def change
    add_index :hobbies, :name, unique: true
  end
end

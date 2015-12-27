class AddColumnHobbies < ActiveRecord::Migration
  def change
    add_column :hobbies, :user_id, :integer, null: false
  end
end

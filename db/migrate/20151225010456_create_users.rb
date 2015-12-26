class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :username, null: false
      t.string :email
      t.string :avatar_url
      t.index [:uid, :provider, :username], unique: true

      t.timestamps null: false
    end
  end
end

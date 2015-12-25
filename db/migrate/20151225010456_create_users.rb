class CreateUsers < ActiveRecord::Migration
  def change
    create_t :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :avatar_url, null: false
      t.index [:uid, :provider], unique: true

      t.timestamps null: false
    end
  end
end

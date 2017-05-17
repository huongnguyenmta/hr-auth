# 20160823044024_create_access_grants.rb
class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps
    end
    add_index :authentications, :user_id, unique: true
  end
end

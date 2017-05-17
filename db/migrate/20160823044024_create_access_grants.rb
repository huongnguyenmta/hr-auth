# 20160823044024_create_access_grants.rb
class CreateAccessGrants < ActiveRecord::Migration[5.1]
  def change
    create_table :access_grants do |t|
      t.string :code
      t.string :state
      t.string :access_token
      t.string :refresh_token
      t.datetime :access_token_expires_at
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end

    add_index :access_grants, :user_id, unique: true
    add_index :access_grants, :client_id, unique: true
  end
end

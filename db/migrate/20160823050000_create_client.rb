# 20160823044024_create_access_grants.rb
class CreateClient < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :app_id
      t.string :app_secret
      t.integer :user_id

      t.timestamps
    end

    add_index :clients, :user_id
    add_index :clients, [:app_id, :app_secret], unique: true
  end
end

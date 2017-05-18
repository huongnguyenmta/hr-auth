class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :title
      t.string :uid
      t.string :authentication_token
      t.string :name
      t.integer :gender, default: 0
      t.integer :role, default: 2
      t.date :birthday
      t.string :employee_code
      t.string :position
      t.date :contract_date
      t.date :start_probation_date
      t.date :end_probation_date
      t.integer :status, default: 0
      t.string :avatar
      t.string :phone_number
      t.string :contract_type
      t.string :university
      t.date :join_date
      t.date :resigned_date

      t.timestamps
    end
    add_index :users, :uid, unique: true
    add_index :users, :authentication_token, unique: true
  end
end

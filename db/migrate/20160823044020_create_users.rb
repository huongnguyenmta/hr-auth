class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :authentication_token
      t.string :name
      t.integer :gender, default: 0
      t.integer :role, default: 0
      t.date :birthday
      t.string :employee_code
      t.string :position
      t.date :contract_date
      t.integer :status, default: 0
      t.string :avatar
      t.string :phone_number
      t.string :contract_type
      t.string :university
      t.date :join_date
      t.date :resigned_date
      t.string :workspace_name
      t.string :group_name
      t.string :division_name
      t.string :team_name
      t.string :project_name
      t.string :chatwork_id
      t.string :github_account

      t.timestamps
    end
    add_index :users, :authentication_token, unique: true
  end
end

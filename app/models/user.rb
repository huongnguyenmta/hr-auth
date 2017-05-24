class User < ApplicationRecord
  include UserSso
  mount_uploader :avatar, AvatarUploader

  paginates_per 50
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients, dependent: :destroy

  enum role: [:normal, :admin]

  ATTRIBUTES_PARAMS = [:name, :gender, :role, :birthday, :employee_code,
    :position, :contract_date, :status, :avatar, :phone_number, :contract_type,
    :university, :join_date, :resigned_date, :workspace_name, :group_name,
    :team_name, :project_name, :email].freeze
end

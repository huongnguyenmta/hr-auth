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

  ATTRIBUTES_PARAMS = [:gender, :birthday, :position, :status, :avatar,
    :phone_number, :university, :workspace_name, :group_name, :division_name,
    :team_name, :project_name, :github_account, :chatwork_id].freeze
end

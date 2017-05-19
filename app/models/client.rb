class Client < ActiveRecord::Base
  belongs_to :user

  before_create :generate_app_id_and_secret

  class << self
    def authenticate app_id, app_secret
      find_by app_id: app_id, app_secret: app_secret
    end
  end

  private

  def generate_app_id_and_secret
    self.app_id = Client.generate_unique_secure_token
    self.app_secret = SecureRandom.hex(30)
  end
end

class Client < ActiveRecord::Base
  class << self
    def authenticate app_id, app_secret
      where(["app_id = ? AND app_secret = ?", app_id, app_secret]).first
    end
  end
end

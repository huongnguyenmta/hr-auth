module UserSso
  extend ActiveSupport::Concern

  included do
    has_many :authentications, dependent: :delete_all
    has_many :access_grants, dependent: :delete_all

    class << self
      def find_for_token_authentication access_token
        where(["access_grants.access_token = ? \
          AND (access_grants.access_token_expires_at IS NULL \
          OR access_grants.access_token_expires_at > ?)",
          access_token, Time.now])
        .joins(:access_grants).select("users.*").first
      end
    end

    def json_data
      {
        id: id,
        uid: uid,
        email: email,
        avatar_url: "http://#{Settings.host}/#{avatar.url}",
        join_date: join_date,
        resigned_date: resigned_date,
        display_name: display_name,
        authentication_token: authentication_token,
        sync_token: sync_token,
        info: {
          position: position
        }
      }
    end
  end
end

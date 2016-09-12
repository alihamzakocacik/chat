module ApplicationCable
  class Connection < ActionCable::Connection::Base
   include SessionsHelper
   idendified_by :current_user

    def Connect
      self.current_user = find_verified_user
      logger.add_tags "Actioncable", "User #{current_user.id}"
      end

      protected

    def find_verified_user
      if current_user = env['warden'].user
        current_user
      else
        reject_authorized_connection
      end
    end
  end
end

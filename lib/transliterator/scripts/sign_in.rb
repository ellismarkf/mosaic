require 'digest/sha1'
require 'pry-byebug'

module Transliterator
  class SignIn

    def self.run(params)

      user = Transliterator.orm.get_user(params[:username])
      if !user.validate_pw(params[:password])
        return { :success? => false, :error => :invalid_password}
      end

      # if user["password_digest"] != Digest::SHA1.hexdigest(params[:password])
      #   return { :success? => false, :error => :invalid_password }
      # end

      # session_id = Transliterator.orm.create_session({ :user_id => user["id"]})

      return { :success? => true,
               :username => user.username}

    end
  end
end
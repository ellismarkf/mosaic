module Transliterator
  class SignUp
    def self.run(params)
      username = params[:username]
      password = params[:password]

      user_exists = Transliterator.orm.check_user(username)

      if user_exists != nil
        return  { success?: false, error: :user_already_exists }
      end

      user = Transliterator::User.new(username)
      # binding.pry
      user.update_pw(password)
      user.create

      # session_id = Transliterator.orm.create_session({ :user_id => user.user_id})

      return {
        success?: true,
        username: user.username,
        password: user.password_digest
      }

    end
  end
end
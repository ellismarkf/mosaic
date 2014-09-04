require 'digest/sha1'

module Transliterator
  class User

    attr_reader :username, :password_digest, :id

    def initialize(username, password_digest=nil, id=nil)
      @username = username
      @password_digest = password_digest
    end

    def create
      result = Transliterator.orm.create_user(@username, @password_digest)
      @id = result["id"]
      self
    end

    def update_pw(password)
      @password_digest = Digest::SHA1.hexdigest(password)
    end

    def validate_pw(password)
      @password_digest == Digest::SHA1.hexdigest(password)
    end

  end
end